---
title: "Netcat Tricks"
date: "2018-06-29"
type: "post"
authors: ["buonincontri"]
tags: [unix,sysadmin]
lede: "Useful things to do with Netcat."
shortlede: ""
poster: "poster-netcat-tricks.jpg"
socmediaimg: "socmediaimg-netcat-tricks.jpg"
hiliteimg: ""
poster_sourceurl: "https://imgur.com/gallery/O00xD"
poster_source: "Imgur"
---

One of the joys of using a UNIX box is ‘discovering’ utilities that ship with a particular OS. Who hasn’t on a slow day tab-completed through the letters of the alphabet to see what weird and mysterious things show up in your terminal? (Ok, most of humanity, actually.) And more often then not, those strange things that pop up often turn out to be useful.

For me, one such utility is [Netcat](https://en.wikipedia.org/wiki/Netcat).
Netcat is a tool for creating or listening to arbitrary TDP/UDP connections. As a web developer I use it to debug anything involving cross application requests, like requesting a JSON file for a feed, or debugging a connection to a search backend.

Many times I’ll open a port to listen for an incoming connection to debug remote requests: `nc -l <some port number>`. Most often I use this as a sanity check, to see that the remote service is actually making the request. I’ll also use this to verify request headers.

Conversely, if I’m working with a remote service, and I want to inspect their response headers, I’ll make a request, like so: `echo "GET /some/path.html HTTP/1.0" | nc example.com 80`. As ssl usage becomes more common though, I don’t use this as often.
