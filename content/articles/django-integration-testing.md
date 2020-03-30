---
title: "Setting up Django Integration Testing with Cypress"
date: 2020-03-13
type: "post"
authors: ["buonincontri"]
tags: ["django", "python","cypress", "testing", "javascript", "webpack"]
lede: "Finding a solution to integration testing in Django."
shortlede: "Finding a solution to integration testing in Django."
poster: "poster-django-integration-testing.jpg"
thumbnail: "thumbnail-django-integration-testing.jpg"
socmediaimg: "socmediaimg-django-integration-testing.jpg"
hiliteimg: "poster-django-integration-testing.jpg"
poster_sourceurl: "https://www.loc.gov/resource/gottlieb.07301.0/?sp=1"
poster_source: "Portrait of Django Reinhardt, Aquarium, New York, N.Y., ca. Nov. 1946, LOC"
bookendanimal: "cat"
---
One of the pleasures of writing applications in Django, or painpoints depending
on your outlook, is that unit testing is at the core of the experience. It's
very much part of the culture of the Django project, so much so that it has its
[own chapter](https://docs.djangoproject.com/en/3.0/intro/tutorial05/) in the
Django tutorial. Though Django excels at unit testing, the story around
integration testing isn't as well defined.

For a recent project, I sought to introduce [Cypress.io](https://cypress.io) to
facilitate front-end and integration tests. The first problem I ran into was
that I wanted a way to populate a test database, like when one runs `manage.py
test`, but I needed the server to stay alive while the integration tests ran.
Django provides a `manage.py testserver` command which loads in provided
fixtures. This was closer to what I wanted, but not 100%. Primarily, I didn't
want to rely on fixtures, as it can be a brittle experience to use and maintain
them. Other parts of how `manage.py testserver` works did seem exactly like
what I wanted. Ultimately, I chose to borrow the parts of `testserver` that I
needed to bring up the test database and the test server, and replace the
fixture loading with some factories to populate the database.

I then used Node's `start-server-and-test` package on
[NPM](https://www.npmjs.com/package/start-server-and-test) to wireup the
services that I needed to run. Specifically to bring up the new `./manage.py
integrationserver` command, wait for the server to be available, and then run
the Cypress test suite. My [package.json file](https://github.com/ccnmtl/locustempus/blob/f1374543a66a36ad96d9ac86dcaa6f782817efce/package.json#L11)
looks something like this:
```
{
    "scripts": {
        "cypress:run": "cypress run",
        "cypress:test": "start-server-and-test 'make integrationserver' http-get://localhost:8000 cypress:run",
        ...
    },
    ...
}
```

This all worked swimmingly on my local machine, but then my tests started
failing more often then not in our CI workflow. The bug turned out to be a
confluence of three different factors, in particular the usage of a Sqlite
backend during tests, setting the dev server to run on a single thread, and a
known buggy interaction with Chrome and Django's test server. In Django, the
Sqlite database feature has a `test_db_allows_multiple_connections`
[attribute](https://github.com/django/django/blob/3.0/django/db/backends/sqlite3/features.py#L11)
which is set to `False`. This seems like a leftover from
[Sqlite2](https://www.sqlite.org/lockingv3.html). In Django's docs, there's a
[timeout option for Sqlite](https://docs.djangoproject.com/en/3.0/ref/databases/#database-is-locked-errors)
which seems to suggest that the API has changed. In Django's implementation of
`testserver` [it checks this feature](https://github.com/django/django/blob/3.0/django/core/management/commands/testserver.py#L46)
and sets the test server to run in a single thread if the database backend
doesn't support concurrent connections. This then kicks off `runserver` on a
single thread, but in practice this causes the test client to hang, seemingly
at random. This seems to have been [a known issue](https://code.djangoproject.com/ticket/16099)
which prompted a switch to a multithreaded server, 
[but the single threaded option was kept around](https://github.com/django/django/commit/ce165f7bbf0c481a20db6b4b9f764b8bb89348ba#diff-f6d1c75ec606389da5af6558bf57f171).
Because this command will be used for testing, I decided to ignore the database
connection feature, and always run the server in multithreaded mode.

In addition to testing, I'm also finding `integrationserver` to be helpful for
local development. By having my models populated by factories, it makes it easy to
trash my local database, and start cleanly.

Why do all this though? In the past we've found that integration tests that use
a Web Driver approach, like Selenium, present challenges with concurrency. Test
code is peppered with calls to `wait(n)`, and we experience a number of false
fails in our CI workflow. Cypress' approach, merging the client and the test
runner, seems like a more durable approach in that tests can wait for the
browsers async loop. We want to explore the capabilities of Cypress to see if
it can successfully fill this role.
