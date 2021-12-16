---
title: "A Leaflet Solution"
date: "2021-12-16"
type: "post"
authors: ["dittren"]
tags: [leaflet, aperio]
lede: "A compact solution to slides for virtual microscopy."
shortlede: "A compact solution to slides for virtual microscopy."
poster: "poster-leaflet-solution.jpg"
thumbnail: "thumbnail-leaflet-solution.jpg"
socmediaimg: "socmediaimg-leaflet-solution.jpg"
hiliteimg: "poster-leaflet-solution.jpg"
poster_sourceurl: "https://unsplash.com/photos/vBQU_KAQ4Tc"
poster_source: "Chyntia Juls on Unsplash"
bookendanimal: "cat"
---

Here at the CTL, we come across a variety of different challenges to tackle. One
such occasion was when I was tasked with providing a work around for the virtual
microscope used in two of our ongoing applications,
[Histology](https://histologylab.ctl.columbia.edu) and
[Pathology](https://pathologylab.ctl.columbia.edu/) lab manuals.

The Histology and Pathology lab manuals are two of our static sites that until
recently were using Webscope to view these massive Aperio slides. These worked
out pretty well but ran using Flash. As you know, Flash is no longer supported
in major browsers so we had to come up with a quick solution for the upcoming
semester.

{{< figure
    src="/img/assets/virtualslides-aperio.jpg"
    class="bordered"
    alt="Snapshot of the old virtual slides on Aperio."
    caption="Snapshot of the old virtual slides on Aperio." >}}

One of the solutions considered was to have the Aperio software integrated into
the app. Unfortunately this would require student logins anytime they would want
to see a slide, not to mention the costs were great.

The other solution was to build our own viewer. We looked around for a possible
way to display these slides and came across this guide from some folks at NYU
[Virtual Microscope](https://iime.github.io/virtualmicroscope/). They proposed a
solution which involved conversion of the slides to usable form and using a maps
framework called [Leaflet](https://leafletjs.com/).

With this guide on hand, I began to convert around 143 `.SVS` slides to a huge
tiled version of the image. To do this I used the recommended library
[libvips](https://github.com/libvips/libvips). This allowed me to set up Leaflet
to use those tiled images to create a virtual microscope where you can zoom all
the way as if it were a real microscope. The Leaflet framework is usually used
for maps so the virtual microscope works in a similar way to something like
Google maps.

To really make this accessible, I added some controllers. The pan controller
allows the user to use the keyboard to pan across the image, especially useful
when zoomed in all the way, while the zoom slider allows for keyboard control of
the magnification. Because I didn’t have the info for exact magnification, I set
up a small algorithm so that the zoom levels were at least consistent with each
other.

{{< figure
    src="/img/assets/virtualmicroscope.jpg"
    alt="A screenshot of our current working virtual microscope."
    caption="A screenshot of our current working virtual microscope." >}}

This solution has been working well for the faculty, and I am happy we were able
to produce something in house and maybe save a couple of bucks along the way!
