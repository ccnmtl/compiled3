---
title: "Learning to love REST for clientside data delivery"
date: 2019-04-18
type: "post"
authors: ["dreher"]
tags: ["django","vue","reactive","python"]
lede: ""
shortlede: ""
compliance."
poster: ""
socmediaimg: ""
hiliteimg: ""
poster_sourceurl: ""
poster_source: ""
bookendanimal: "spider"
---

Delivering data from server-side to client-side seems pretty straightforward, particularly for reactive applications. You can simply build a rest api and get the data down there. But, when tightly integrating with a Django application, there are other options to consider that might be a shade more efficient and get around some timing problems that seem to crop up. At least, it feels that way to me, and the inefficiency of REST data delivery when you have the data right there *really* bugs me. Here's some experiements I tried as I worked to integrate Vue functionality into a Django application.


1. Django Template Variables

2. Django rendered JSON in the template

3. I should just get over myself and use REST
* for consistency
* single data interface
* because everyone else is doing it


