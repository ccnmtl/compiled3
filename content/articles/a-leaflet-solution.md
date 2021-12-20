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

I was tasked with providing a work around for the virtual microscope used in two
of our ongoing applications, [Histology](https://histologylab.ctl.columbia.edu)
and [Pathology](https://pathologylab.ctl.columbia.edu/) lab manuals.The virtual
microscope is used by medical students to view the massive Aperio digital
pathology slides. The current system worked well but used Flash, which is no
longer supported in major browsers. I had to quickly find a solution for the
upcoming semester.

{{< figure
    src="/img/assets/virtualslides-aperio.jpg"
    class="bordered"
    alt="Snapshot of the old virtual slides on Aperio."
    caption="Snapshot of the old virtual slides on Aperio." >}}

One of the solutions considered was to have the Aperio software integrated into
the site. Unfortunately this option would require students to log in anytime
they accessed a slide. More importantly, the cost for the software was high. The
other option was to build our own viewer. I looked around for a possible way to
display these slides, coming across this guide from folks at NYU
[Virtual Microscope](https://iime.github.io/virtualmicroscope/). They proposed a
solution which involved converting the Aperio specific `.SVS` slides to a common
file type and using a maps framework called [Leaflet](https://leafletjs.com/).

The Leaflet framework works similarly to Google Maps, using tiles to break up
large images. With the NYU guide in hand, I began to convert around 143 `.SVS`
slide images to a huge tiled versions using the recommended library
[libvips](https://github.com/libvips/libvips). Once completed, this allowed me
to set up Leaflet to use those tiled images to create a virtual microscope,
zooming in as if it were a real microscope.

To really make this new version useful and accessible, I added some controllers.
The pan controller offers keyboard control. Panning across the image is especially
useful when zoomed in all the way. A  zoom slider allows for keyboard control of
the magnification. Because I didn’t have the information for exact microscope
magnification, I set up a small algorithm so that the zoom levels were at least
consistent with each other.

{{< figure
    src="/img/assets/virtualmicroscope.jpg"
    alt="A screenshot of our current working virtual microscope."
    caption="A screenshot of our current working virtual microscope." >}}

This new virtual microscope has been working well for the faculty and students.
I am happy we were able to produce something in-house using open source software,  
saving a few bucks along the way!
