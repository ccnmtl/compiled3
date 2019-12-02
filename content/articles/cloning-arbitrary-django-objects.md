---
title: "Cloning Arbitrary Django Objects"
date: 2019-12-02
type: "post"
authors: ["nyby"]
tags: ["django", "python"]
lede: "An overview of how to clone objects in Django that have foreign key relations"
shortlede: "An overview of how to clone objects in Django that have foreign key relations"
poster: ""
socmediaimg: ""
hiliteimg: ""
poster_sourceurl: ""
poster_source: ""
bookendanimal: ""
---

I recently made a "course-cloning" feature in [EconPractice](https://econpractice.ctl.columbia.edu/)
that provides new instructors with their own template course. The
original master course is managed by Tom Groll. This will give new
instructors some ideas on how EconPractice can be used, and what
scenarios it was designed for.

A course is represented in Django with the Course model. This model
has many Topic instances, which in turn have many Graph instances. I
want to create a copy of each topic and graph whenever this course is
cloned.

Python includes a [copy](https://docs.python.org/3.6/library/copy.html) library
that can be used to copy Python objects. But Django model instances
have even more to them than a Python object, because they represent
what's saved in a database.

The recommended way to copy Django model instances is to use copy(),
then set the instance's primary key to None, and save it. To clone a
Graph instance, it's pretty simple:

```
class Graph(models.Model):
    def clone(self):
        g = copy.copy(self)
        g.pk = None
        g.save()
        return g
```

To clone the whole course, I have to deal with the relations of the
course manually. Because Django doesn't know that I want to clone all
the course's topics and graphs, but not some relations like, for
example, the users.

```
# Course is called Cohort here (it's just a more general
# term for a course).
class Cohort(models.Model):
    def clone(self):
        c = copy.copy(self)
        c.pk = None
        c.is_sample = None
        c.save()

        # Clone the topics.
        for topic in self.topic_set.all():
            if topic.name == 'General':
                # The General topic is created automatically in the
                # post_save hook.
                cloned_topic = c.get_general_topic()
            else:
                cloned_topic = Topic.objects.create(cohort=c, name=topic.name)

            for graph in topic.graph_set.all():
                cloned_graph = graph.clone()
                cloned_graph.topic = cloned_topic
                cloned_graph.save()

        return c
```