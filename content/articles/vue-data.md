---
title: "Delivering Data to a Vue Component"
date: 2019-05-05
type: "post"
authors: ["dreher"]
tags: ["django","vue","python","javascript","json"]
lede: "Delivering data from server-side to client-side is pretty
straightforward. Generally, you just throw together an API, RESTful or
otherwise. When working in the Django framework, there are a couple of other
options to consider, that might be easier and solve a few problems."
shortlede: "Exploring efficient approaches to get data clientside with Django
and Vue."
poster: "poster-vue-data.jpg"
socmediaimg: "socmediaimg-vue-data.jpg"
hiliteimg: "poster-vue-data.jpg"
poster_sourceurl: "https://unsplash.com/photos/fb7yNPbT0l8"
poster_source: "Photo by Mathyas Kurmann on Unsplash"
bookendanimal: "spider"
---

## Special delivery

Delivering data from server to client is pretty straightforward. Generally, you
just throw together an API, RESTful or otherwise. When working in the Django
framework, there are a couple of other options to consider, that might be
easier and solve a few problems. Here are two ways I've used to get data to the
client.

### Some background

Rather than create a standalone Vue application, I have (so far) chosen to
intertwine Vue functionality into Django templates. I feel this approach
capitalizes on the power of both frameworks. Two examples for review are
[Writ Large](https://github.com/ccnmtl/writlarge) and
[Attaining Higher Education](https://github.com/ccnmtl/ahemap). In both
applications, the Vue components and sub-components required data from the
server.

## Rendering data

Django's MVC framework allows templates easy access to server-side data via the
view context. So, why not just render a context variable directly into a
Javascript variable? The data is immediately available and a secondary API call
is eliminated. Super efficient right?

Here's what that looks like:

    <script>
        const WritLarge = {
            staticUrl: '{{STATIC_URL}}',
            debug: {% if debug %}'true'{% else %}'false'{% endif %},
            baseUrl: '//{{ request.get_host }}/',
            someData: JSON.parse('{{someJsonData|escapejs}}')
        }
    </script>

This example shows a few different ways to transfer data to a
Javascript-friendly structure. Note that the JSON data must be escaped, then
parsed to avoid encoding and security issues.

Vue and other clientside code can then access the WritLarge instance to
retrieve data.

## A new way to render

In Django 2.1, we received an even simpler solution in the form of the
`json_script` templatetag. This templatetag "Safely outputs a Python object as
JSON, wrapped in a `<script>` tag, ready for use with JavaScript." The
`someData` variable can now be transformed to:

    <script>
        {{ someData|json_script:"someData" }}
    </script>

this then outputs

    <script id="someData" type="application/json">
        // all the data here
    </script>


## Why not just use REST?

Using Django's capabilities to get the data to the client faster seems like a
no-brainer.

For one, there's simply no need to implement a data api and make sure it is
locked down properly. Less code is always a good thing.

For two, asynchronous data calls initiated by Vue or other clientside
components can cause a few issues. Even with the fastest APIs, the data is
arriving at the client after the initial render. To deal with this, all the
clientside code needs to be prepared for null or empty data structures. Complex
objects present additional challenges with the need to check if a property is
present. And, the user interface needs to be primed for an empty state,
displaying neatly with or without data. 

The big "but" to all of this is when the clientside components need to pass
data back upstream. Then, of course, the client must post back to the server
via a well-known api. I've gone back and forth how I feel about delivering data
to the client one way and updating it in another way. That feels a bit messy
and inconsistent. So far, I've gone full REST in these cases, but the problems
outlined above have definitely bitten me.
