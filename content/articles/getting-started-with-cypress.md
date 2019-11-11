---
title: "Getting Started with Cypress"
date: 2019-11-11
type: "post"
authors: ["buonincontri"]
tags: ["cypress", "testing", "accessibility", "javascript", "webpack"]
lede: "Integration testing web applications in the browser has always been a
challenge. Cypress unique architecture offers a different way."
poster: "poster-ochoe-cypress.jpg"
socmediaimg: "socmediaimg-ochoe-cypress.jpg"
hiliteimg: "poster-ochoe-cypress.jpg"
poster_sourceurl: "https://commons.wikimedia.org/wiki/File:Wheat-Field-with-Cypresses-(1889)-Vincent-van-Gogh-Met.jpg"
poster_source: "Wikimedia"
bookendanimal: "cat"
---
Testing is a key pillar of writing reliable software. When we build Django apps
at the CTL, the testing story is pretty clear—it’s focused on unit testing.
But what about other kinds of sites, like Hugo sites or React apps? Our work on
a [recent project](https://ohcoe.ctl.columbia.edu) led me to try the Cypress
testing framework, and I was happy that I did.

## Why Cypress?
[Cypress](https://cypress.io) is the Chrome browser married with a Javascript
testing framework. Typically, integration testing is driven by an external tool
that manipulates the application and the browser. Consider Selenium testing—particularly how it interacts with the browser through an API, but isn’t really
aware of the state the browser is in. Race conditions are all too common with
these frameworks because sometimes the browser hasn’t finished doing what the
test driver requested before moving on to the next stop. These bugs create
confusion because it’s not clear if the application or the test is broken, and
tests become peppered with calls to “wait()”, which never work consistently.

Cypress is different because it is the browser as well as the test driver. It
knows when the page has finished rendering or when network requests are
complete, because the browser’s event loop is visible to the test runner. It
knows to wait for these asynchronous events to finish before proceeding.

Cypress also packages everything you need. It can be tedious to install and
configure various JavaScript testing and assertion libraries by hand. Cypress
wires this all up for you.

## What I wish I knew before I started
Cypress tests rely on Javascript promises to know when to schedule each step of
a test. Suppose a test takes some action on the page; it waits for the browser
to finish rendering before it returns that link in the promise chain to a
method that will make an assertion.  I found that I needed to understand how
promises work before I could really get going.

Cypress can be pretty smart about events on the page, but it isn’t a magician.
In particular, if you modify the DOM outside of the browser API, you’ll likely
run into some classic race condition skullduggery. I hit this the first time I
set up Cypress. Initially I used Require.JS to load javascript assets. None of
my tests worked at first, and it became apparent once I looked at how
Require.JS works. It creates new script tags and injects them into the DOM.
This is a common pattern, especially before the “async” attribute became
available with HTML5, but it bypasses the browser’s API for fetching resources
after the page loads. The way to fix this was to use Webpack to assemble
multiple assets to a single file, which would be loaded with the initial page
load.

Another pattern that bit me was trying to test Google Analytics custom events.
You never want tests to have real-world side effects, so Cypress has a way to
configure a DNS blacklist. If a request is made to a host on the list it won’t
resolve. The Cypress way of handling external resources is to add the external
host to the blacklist, and then stub in whichever function or object which
would be loaded by this external resource. This way, you can assert that the
function is called, but it never calls the real implementation.

Cypress has docs showing how to stub out GA in this way, but it never worked.
The solution in this case it to wrap the call to GA with another function, and
assert that this wrapper function is called instead.

## How to get started
Getting started with Cypress is pretty straightforward. Its thorough
documentation is the best place to
[start](https://docs.cypress.io/guides/getting-started/installing-cypress.html).

One helpful hint with regard to this point: you need a way to run the app on a
testing server, and then you need to start running Cypress. There’s a handy NPM
package that does just
that—[start-server-and-test](https://www.npmjs.com/package/start-server-and-test).
It will bring up your app, run your tests, and cleanly bring down the test
server regardless of how the tests exit.

## TDD/BDD and accessibility
By design, Cypress can be used with test-driven and behavior-driven testing
schemes. It runs in headless mode for CI but it also can be run in a “headed”
mode. It will render your tests in the browser and you can watch the robot
drive the machine.

In the headed mode, it will watch your codebase and re-run the selected suite
of tests when a file is saved. If TDD or BDD is your thing, Cypress makes these
schemes especially easy to work in.

In particular, Cypress paired with the Axe accessibility checker, proved to be
an important part of building for accessibility. For a recent project, I wrote
[tests to run accessibility
checks](https://github.com/ccnmtl/ohcoe-hugo/tree/master/cypress/integration/axe)
for each of the page templates. In headed mode, accessibility issues were
quickly identified. It helped me build for accessibility right from the start,
rather than trying to push the blueberries into the muffin at the end of
development. It would also make these checks a part of the build process. If a
later code change introduced a regression, it would fail to build, and not
reach production.
