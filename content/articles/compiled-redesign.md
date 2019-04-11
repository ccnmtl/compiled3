---
title: "CompilED for Inclusion"
date: 2019-04-11
draft: true
type: "post"
authors: ["mustapha"]
tags: ["accessibility","inclusive design"]
lede: "Sed sed quam eget ipsum placerat sodales. Nulla fermentum justo vel metus commodo, id mollis lorem vehicula. Aenean volutpat, metus vitae vestibulum ultrices, purus dolor tristique lacus, id aliquam odio nibh eu tortor. Vestibulum vitae urna viverra ante posuere commodo."
shortlede: "Fusce tempor hendrerit facilisis. Quisque at nunc diam. Pellentesque imperdiet porttitor orci ut efficitur. Phasellus."
poster: "poster-compiled-v3.jpg"
socmediaimg: ""
hiliteimg: "poster-compiled-v3.jpg"
poster_sourceurl: ""
poster_source: ""
bookendanimal: "dragon"
---

In March, I restructured and redesigned the CTL DevTeam’s website _CompilED_ to meet the web accessibility standards, and to improve its overall user experience inclusively on all devices.

This latest iteration of _CompilED_ follows the [Web Content Accessibility Guidelines (WCAG) 2.0](https://www.w3.org/TR/WCAG20/) level AA, and it is much more technically and usably accessible than the previous versions. It is keyboard accessible with improved focus styling. The site is also seamlessly adaptive to multi-size screen devices—smartphones, tablets, and desktops. The comprehensive design has also improved the readability of the site’s content.

In my work at the CTL, I consider accessibility as an integral part of my own development process. Lately, I’ve been mulling over an effective, broader integration of accessibility thinking, process, and policy across different groups in the whole department, as part of our commitment to accessibility, universal design, and inclusion in higher education.

[_CompilED_ redesign in 2016](/articles/rebuilding-compiled/) afforded some accessibility since my grasp of WCAG standards was limited at the time. Three years later with more experience and grounded understanding, I redesigned _CompilED_ as an exercise to develop a website that conforms very well to the WCAG. This experience led me to best practices and a workable flow that I can share with my team for other development processes.

## Steps on improving CompilED’s accessibility

### User experience design

I thought carefully about _CompilED_ content delivery and comparable user experience on different medium, from visual to auditory experience. Much of the UX design centered around the integrity of the visual UI and the browser’s rendering of the accessibility tree for screen readers. The elements and content on the pages were regrouped according to function, reordered according to priority, and restacked for responsive design. This regrouping and reordering was done so that the structure on each page make sense to all users regardless of their choice of devices—desktop, mobile, or assistive technologies.

I’ve written on similar design process for the [redesign of PHTC image map](/articles/a11y-rwd-imagemap/) and [two Dental School projects](/articles/deconstructing-accessibility/).

### Semantic HTML and ARIA

In her demonstration on [how a screen reader user accesses the web](https://www.smashingmagazine.com/2019/02/accessibility-webinar/), accessibility engineer [Léonie Watson](https://tink.uk/) recommended using semantic HTML and ARIA attributes to improve content accessibility and clarify meaning for content groups. They serve as sign posts to help users to chart a mental model of a page. I was already using HTML5 landmark regions (`header`, `nav`, `main`, `section`, `article`, `footer`) in _CompilED_. This time, I paid more attention to the ARIA labels to identify components on the pages so that they can be read by screen readers. 

### Keyboard accessibility

Keyboard navigation is markedly improved for _CompilED_ pages—all functionality and interactive elements are available from a keyboard. I also redesigned the visual focus styling (`hover`, `focus`, `active`), thanks to the [helpful tips from Eric Bailey.](https://www.youtube.com/watch?v=9YazmVNwtHI)

### Alt text for images and social media

While it is common knowledge that alternative text for images is necessary, what is less know is what sort of description should be used for the `alt` text. To put simply, image description depends on context.

All images on _CompilED_ articles how have `alt` attribute built in the template. It is up to the authors to decide how the images are used to provide context in the `alt` text. W3C provides a good [tutorial on image concepts](https://www.w3.org/WAI/tutorials/images/). WebAIM also has a [thorough explanation on alternative text](https://webaim.org/techniques/alttext/) and images.

_CompilED_ also uses `og:image:alt` and `twitter:image:alt` structured properties to provide descriptions images used for social media sharing.

### Audits and limitations

I used the following scanning tools to test accessibility compliance for _CompilED_:

* [Siteimpove](https://chrome.google.com/webstore/detail/siteimprove-accessibility/efcfolpjihicnikpmhnmphjhhpiclljc)
accessibility checker, by [Siteimprove](https://siteimprove.com)
* [Wave](https://wave.webaim.org/extension/) web accessibility evaluation tool
by [WebAIM](https://webaim.org/)
* [Axe](https://www.deque.com/axe/) web accessibility testing tool by 
[Deque Systems](https://www.deque.com)
* [VoiceOver](https://www.apple.com/accessibility/mac/vision/), the screen
reader by Apple

The scan shows some color contrast errors, but for the most part, _CompilED_ [conforms to WCAG 2.0 Level AA](/info/accessibility/). 

## Coda

Web content accessibility isn’t just about technology. _CompilED_ could have passed all the scanning audits and still wouldn’t be very usefully if I didn’t understand the user experience with screen readers or other assistive technologies. We should make POUR (Perceivable, Operable, Understandable, Robust) design regarding digital experience and accessibility for _people of all abilities_.

This experience has deepened my understanding accessibility and inclusive design principles. There is still a lot to learn, and there are many more accessibility challenges to solve in web applications design. I’m looking forward to look at these issues and make more improvement in the future.

&#42; &#42; &#42;

_CompilED_ is built with [Hugo](https://gohugo.io), a general-purpose static site generator that renders HTML files as output from content files and layout templates. _CompilED_ repository is available on [Github](https://github.com/ccnmtl/compiled3/).


