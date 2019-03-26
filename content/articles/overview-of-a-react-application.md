---
title: "Overview of a React Application"
date: "2016-07-19"
type: "post"
authors: ["nyby"]
tags: ["javascript", "mediathread", "working notes", "react"]
shortlede: ""
lede: "This post outlines some of the technologies involved in putting together a video juxtaposition tool for Mediathread. The primary technology I'm focusing on is React, which is a framework for building highly interactive user interfaces on the web in JavaScript."
poster: "poster-overview-react.jpg"
socmediaimg: ""
hiliteimg: ""
poster_sourceurl: ""
poster_source: ""
---

This post outlines some of the technologies involved in putting
together a video juxtaposition tool for
[Mediathread](http://mediathread.info/).  The primary technology I'm
focusing on is [React](https://facebook.github.io/react/), which is a
framework for building highly interactive user interfaces on the web
in JavaScript.

Now that I've made some progress on
[Juxtapose](https://github.com/ccnmtl/juxtapose) I wanted to review
some of the pieces and decisions I've made when putting this
together. There are some differences between what I'm using here and
what we've used for other JavaScript projects at CTL.

In the `src` directory, there's a mix of `.js` and `.jsx` files. I'm
using `.jsx` when there's jsx templating in the file, which allows
Emacs to automatically indent these sections correctly using
[web-mode](http://web-mode.org/).

I've chosen to use the newer ecmascript 6 JavaScript syntax, made
possible by [Babel](https://babeljs.io/). You'll see the string
`es2015` in `.babelrc` and `.eslintrc` - this denotes features added
to ecmascript 6 in 2015, which turn out to be the essential ones I've
been using, like `import` / `export` / `class`.

Because I'm using a newer JavaScript syntax, jshint had trouble with
this code. It turns out most people are using eslint instead of jshint
for this, so I'm using that as well.

Testing is done with [Jest](https://facebook.github.io/jest/) - I
figured it would be the most straight-forward to use because Facebook
specifically built it to test React applications. It's just a
unit-testing framework though, like QUnit or Mocha.

The balance of "state" vs "props" is a key concept of making a React
application. Each React component can contain state and props as data
to be rendered. React handles the rendering - the view is always up to
date with its state and props. `props` refers to the parameters passed
to the component by its parent on initialization. A component doesn't
change its own props, it just uses whatever props its parent gave it.
The component can change its own `state`, though, using
`this.setState()`. `state` is how you model changes over time in React
applications. There's more info in
[Thinking in React](https://facebook.github.io/react/docs/thinking-in-react.html#step-4-identify-where-your-state-should-live),
and the guideline is to identify which components depend on which
pieces of state, and put that state in one place: the nearest common
parent. In my application that turns out to be the root class:
`JuxtaposeApplication`.
