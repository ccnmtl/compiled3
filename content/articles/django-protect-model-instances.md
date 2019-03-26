---
title: "Protecting Django Model Instances"
date: "2018-09-26"
type: "post"
tags: ["django",sysadmin]
authors: ["buonincontri"]
lede: "How to protect arbitrary Django model instances."
shortlede: "How to protect arbitrary Django model instances."
poster: "poster-protect-django-model.jpg"
socmediaimg: "socmediaimg-protect-django-model.jpg"
hiliteimg: ""
poster_sourceurl: "https://imgur.com/1hXmJjc"
poster_source: "LizzyLemonade on Imgur"
---

Recently, I had a task where I needed to create a ‘Category’ model for a user,
such that a default option would always be present. Users could create, edit,
and delete any other instance of this ‘Category’ model, except for deleting the
default option (users still could edit the default). Django
[field types](https://docs.djangoproject.com/en/2.1/ref/models/fields/#field-types)
and [field options](https://docs.djangoproject.com/en/2.1/ref/models/fields/#field-options)
give developers a great degree of control, but I couldn’t quite assemble what
I needed from stock options. Rather, I found that I needed a three step
approach: write a migration to ensure the default option is present, register a
`pre_delete` signal on the ‘Category’ model to raise an exception, and catch the
exception on the admin interface.

## Migration

The data model for the feature in quesiton consists of ‘Graph’ which has a
‘Category’. In this case, my migration had to do two things, prepare the
‘Category’ model, and modify the foreign relationship on ‘Graph’ to set a default
value and an “on_delete” option. Preparing the ‘Category’ model required some
cleanup. I first deleted all existing instances from the database, and created
my default value at `pk` 1,
[like so](https://github.com/ccnmtl/econplayground/pull/476/files#diff-f97811a0318af6abb2a8c4db87dac249):
```
from django.db import migrations

def create_general_topic(apps, schema_editor):
    Graph = apps.get_model('main', 'Graph')
    Topic = apps.get_model('main', 'Topic')

    Graph.objects.all().update(topic=None)
    Topic.objects.all().delete()
    t = Topic.objects.create(name='General', pk=1, order=1)
    Graph.objects.all().update(topic=t)


class Migration(migrations.Migration):
    dependencies = [
        ('main', '0051_set_graph_order')
    ]
    operations = [
        migrations.RunPython(create_general_topic),
    ]
```
This is all pretty standard, straight from Django’s docs. You can’t import
models directly into a migration, rather you access them via the `apps` object
passed in.

## `pre_delete` Signal

Django models have a number of signals, which are a manifestation
of an Observer design pattern. A programmer can register function(s) to be
called at various stages of a Django model’s lifetime. In this case, I wanted
my function to check that the ‘General’ topic wasn’t being deleted. In the general
case, there’s much a developer could do at this point. Django’s docs explain
how to use [signals](https://docs.djangoproject.com/en/2.1/topics/signals/),
and explain which signals are
[available](https://docs.djangoproject.com/en/2.1/ref/signals/#).

Django offers a handy decorator to register methods to signals. In particular,
I was interested in checking that the instance being deleted wasn’t `pk` 1:
```
@receiver(pre_delete, sender=Topic)
def default_topic_handler(sender, instance, **kwargs):
    if instance.id is 1:
        raise ProtectedError('The General topic can not be deleted', instance)
```

## Admin Interface

If I try to delete the ‘General’ category, it will raise a `ProtectedError`.
Great, except that if the exception is left unhandled it will percolate up, and
return a 500 error to the user.  This is not what we want.

We have to override three methods of the ModelAdmin class to ensure that we
catch the exception and handle it appropriately. Specifically `delete_view`,
`response_action`, `has_delete_permission`:
```
class TopicAdmin(OrderedModelAdmin):
    list_display = ('name', 'move_up_down_links')

    def delete_view(self, request, object_id, extra_context=None):
        try:
            return super().delete_view(request, object_id, extra_context=None)
        except ProtectedError:
            msg = "{} can not be deleted." 
                .format(self.model.objects.get(id=object_id).name)
            self.message_user(request, msg, messages.ERROR)
            opts = self.model._meta
            return_url = reverse(
                'admin:{}_{}_change'.format(opts.app_label, opts.model_name),
                args=(object_id,),
                current_app=self.admin_site.name,
            )
            return HttpResponseRedirect(return_url)

    def response_action(self, request, queryset):
        try:
            return super().response_action(request, queryset)
        except ProtectedError:
            msg = "This object can not be deleted."
            self.message_user(request, msg, messages.ERROR)
            opts = self.model._meta
            return_url = reverse(
                'admin:{}_{}_change'.format(opts.app_label, opts.model_name),
                current_app=self.admin_site.name,
            )
            return HttpResponseRedirect(return_url)

    def has_delete_permission(self, request, obj=None):
        return super().has_delete_permission(request, obj) and (
                not obj or obj.id is not 1
            )
```
The above does two main things. The `delete_view` and `response_action` handle
the exception if the user takes some action on the admin interface. The last
method override, `has_delete_permission` is used to show/hide the delete button
on the admin interface. In this case, its used to hide the delete button when
viewing the default model that we’d like to preserve.

For the full context, you can see the pull request
[on Github](https://github.com/ccnmtl/econplayground/pull/476/files).
