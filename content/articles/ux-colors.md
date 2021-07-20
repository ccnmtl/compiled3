---
title: "Coloring User Experience in Locus Tempus"
date: 2021-07-16
type: "post"
authors: ["mustapha"]
tags: ["user experience", "user interface", "visual design"]
lede: "Color choice in interface design is an important component of user experience design.
Colors in Locus Tempus are applied intentionally to communicate meaning in interface components,
improve usability, integrate functionality and aesthetic design, and improve user engagement with
the tool."
shortlede: "An examination of color use in Locus Tempus to enhance usability, integrate
functionality and aesthetic design, and improve user engagement with the tool."
poster: "poster-ux-colors.jpg"
hiliteimg: "poster-ux-colors.jpg"
thumbnail: "thumbnail-ux-colors.jpg"
socmediaimg: "socmediaimg-ux-colors.jpg"
poster_sourceurl: "https://unsplash.com/photos/4N4DiBz9c5s"
poster_source: "Sanath Kumar on Unsplash.com"
bookendanimal: "palette"
---

Software development in educational technologies benefits greatly from user experience design (UXD)
to ensure that the user experience leads to the outcome of the pedagogical goals behind the
application design.

Color choices in user interface design are an important component of UXD. They can be a source of
harmony that integrates product identity, visual design, mood. A combination of tone and saturation
in user interface design can increase usability, affect functionality, and shape behavior. Colors
can also indicate interactive components, and express relationships between elements on a page. A
good selection of colors can improve user engagement with the product.

[Color psychology](https://medium.com/iconscout/colors-in-ui-design-theory-psychology-practice-f6d6a5e6e04d)
shows us how color can influence our mind and elicit reactions. So, why not use a splash of chroma
in our designs of educational software? I’ve been thinking about colors a great deal in my UX and
visual design work in Locus Tempus, a recent web-based application that we developed here at the CTL.

## Logo colors

{{< figure
    src="/img/assets/ux-colors-lt-logo.svg"
    alt="Locus Tempus logo, bearing the title, the logo is a map marker in blue, amber and green, with clock face."
    width="75%"
    class="mx-auto bordered"
>}}

Locus Tempus
([main website](https://locustempus.ctl.columbia.edu), [information](https://locustempus.ctl.columbia.edu/about/)
is an open-source digital mapping tool that leverages a geospatial environment to
engage students as repository builders, researchers and curators. Faculty and students from all
disciplines can collaboratively identify, organize, and visualize geolocated materials within a
course context.

I thought it was appropriate to set the tone of Locus Tempus with the color palette in
[Mapbox](https://www.mapbox.com)—the mapping tool used in Locus Tempus— and other mapping
applications such as Google Maps, and Apple Maps. These applications have these color palettes in
common: blue, amber (or yellow), and green. I chose these colors to represent the identity of Locus
Tempus in its logo.

<div class="row my-5">
    <div class="col-3 col-md-2 offset-md-1">
    <img class="mh-100 mw-100" src="/img/assets/ux-colors-lt-avatar.png" />
    </div>
    <div class="col-2 p-2 py-3 p-md-3 mr-3" style="line-height: 1; background: #90caf9;">
    <small>BLUE</small>
    </div>
   <div class="col-2 p-2 py-3 p-md-3 mr-3" style="line-height: 1; background: #ffb300;">
    <small>AMBER</small>
    </div>
   <div class="col-2 p-2 py-3 p-md-3 mr-3" style="line-height: 1; color: #fff; background: #218739;">
    <small>GREEN</small>
    </div>
</div>

However, this choice of colors didn’t begin and end in the logo. To reflect the Locus Tempus brand
throughout the application, I needed to make sure that these colors are in harmony outside their
use in maps, and examine how they can be used to improve user experience and bolster usability of
the tool.

## Grayscale matter

At first, I wanted us to focus on the user experience for the tool, so the interface was mostly
grayscale. When only
[colors are used as visual cues](https://www.w3.org/WAI/WCAG21/Understanding/use-of-color.html)
to convey meaning and guide user behavior, these cues will not be accessible to users who are blind
or have limited color vision. By leaving the Locus Tempus user interface in grayscale for the most
part of the design and development phase, we can shape an accessible user interface without color cues.

After we decided on the components, layout, grouping, architecture, and functionalities, and made
sure the experience is accessible, then I began the process of choosing the right color palette.


{{< figure
    src="/img/assets/ux-colors-lt-bw.png"
    width="50%"
    class="mx-auto bordered"
    alt="Locus Tempus user interface in grayscale."
>}}

## Colors for user interface

Looking at the palettes in the aforementioned mapping applications, blue is used to represent
bodies of water, a dominant component on the map. Amber or yellow indicates major roadways such as
freeways and highways. In Google Maps, areas shaded in light yellow suggest
[places of interest](https://blog.google/products/maps/discover-action-around-you-with-updated/).
And finally, green visualizes vegetation.

Taking the roles of these colors and their visual representation in maps, combining the
psychological influences these colors can evoke, I reached a more abstract understanding of the
palettes, and how they can also represent function. Blue is the dominant representation, is
[generally favored](https://worldsfavouritecolour.info/2019/03/03/favourite-colours/), and it
[suggests reliability](https://www.colorpsychology.org/blue/). Amber (and yellow) is
[warm and playful](https://worldsfavouritecolour.info/2019/03/25/colour-association-by-positive-emotion/),
and it attracts attention. Aligning with the metaphors used in maps, amber represents a way of
getting somewhere, and building blocks of interest. Finally, green is the color of growth, and
[a “go” signal](https://www.colorpsychology.org/green/).

And so, here are the colors I used for Locus Tempus user interface:

### Primary: Blue

<div class="row pb-3 mb-3">
    <div class="col-2 offset-1 p-2 py-3 p-md-3" style="line-height: 1; color: #fff; background: #0d47a1;">
    <small>BLUE #0d47a1</small>
    </div>
    <div class="col-2 p-2 py-3 p-md-3" style="line-height: 1; background: #90caf9;">
    <small>BLUE #90caf9</small>
    </div>
   <div class="col-2 p-2 py-3 p-md-3" style="line-height: 1; background: #bbdefb;">
    <small>BLUE #bbdefb</small>
    </div>
</div>

 * Blue is calming, generally a favorite color to suggest dependability.
 * It is also the color of Columbia University.
 * Blue is used in Locus Tempus as the main color for the application, the primary level pages and
hierarchy.

### Secondary: Amber

<div class="row pb-3 mb-3">
    <div class="col-2 offset-1 p-2 py-3 p-md-3" style="line-height: 1; background: #ffe082;">
    <small>AMBER #ffe082</small>
    </div>
    <div class="col-2 p-2 py-3 p-md-3" style="line-height: 1; background: #ffecb3;">
    <small>AMBER #ffecb3</small>
    </div>
    <div class="col-2 p-2 py-3 p-md-3" style="line-height: 1; background: #fff8e1;">
    <small>AMBER #fff8e1</small>
    </div>
</div>

* Amber is warm, inviting, playful, and it focuses attention.
* In maps, it represents a way of getting somewhere, and building blocks of interest. In Locus
Tempus, amber is used to group parts and actions that lead to the completion of an activity or action.

### Accent: Green

<div class="row pb-3 mb-3">
    <div class="col-2 offset-1 p-2 py-3 p-md-3" style="line-height: 1; color: #fff; background: #218739;">
    <small>GREEN #218739</small>
    </div>
    <div class="col-2 p-2 py-3 p-md-3" style="line-height: 1; background: #c8e6c9;">
    <small>GREEN #c8e6c9</small>
    </div>
</div>

* Green represents growth and positivity.
* It is a “go” signal, used on call-to-action (CTA) components, such as buttons, that adds value or
content to an activity or action.

### Additional: Red (and pink)

<div class="row pb-3 mb-3">
    <div class="col-2 offset-1 p-2 py-3 p-md-3" style="line-height: 1; color: #fff; background: #b00020;">
    <small>RED #b00020</small>
    </div>
    <div class="col-2 p-2 py-3 p-md-3" style="line-height: 1; background: #ffcdd2;">
    <small>PINK<br />#ffcdd2</small>
    </div>
</div>

* Red is complementary to green.
* It implies risk and danger. In Locus Tempus it serves to alert users of an error, or of an
irreversible action such as deletion.
* Red is also used for the markers and highlights because it stands out on the map. This may seem
contradictory to the previous points, However, the usage for this purpose is minimal and localized,
so I don’t think there will be a huge confusion. I may revisit this in the future.

The color scheme for Locus Tempus is
[tetradic](https://www.tigercolor.com/color-lab/color-theory/color-theory-intro.htm#rectangle):
square and rectangle.

<div class="row w-75 mx-auto">
    <div class="col">
{{< figure
    src="/img/assets/ux-colors-rectangle.gif"
    caption="Rectangle color scheme"
    alt="A color wheel with rectangle connecting four colors arranged into two complementary pairs: red and green, blue and amber."
    class="mx-auto mt-1"
>}}
    </div>
    <div class="col">
{{< figure
    src="/img/assets/ux-colors-square.gif"
    caption="Square color scheme"
    alt="A color wheel with square connecting four colors spaced evenly around the color circle: red and green, blue and amber."
    class="mx-auto mt-1"
>}}
    </div>
</div>

Finally, I applied these colors to the user interface, and the following shows the color palette
and their context on the tool’s interface.

<div class="row my-5">
    <div class="col-4 col-md-3">
        <div class="row">
            <div class="col-12" style="height: 3.5rem; line-height: 3.5rem; color: #fff; background: #0d47a1;">
            <small>BLUE #0d47a1</small>
            </div>
            <div class="col-12" style="height: 3.5rem; line-height: 3.5rem; background: #90caf9;">
            <small>BLUE #90caf9</small>
            </div>
           <div class="col-12" style="height: 3.5rem; line-height: 3.5rem; background: #bbdefb;">
            <small>BLUE #bbdefb</small>
            </div>
            <div class="col-12" style="height: 3.5rem; line-height: 3.5rem; background: #ffe082;">
            <small>AMBER #ffe082</small>
            </div>
            <div class="col-12" style="height: 3.5rem; line-height: 3.5rem; background: #ffecb3;">
            <small>AMBER #ffecb3</small>
            </div>
            <div class="col-12" style="height: 3.5rem; line-height: 3.5rem; background: #fff8e1;">
            <small>AMBER #fff8e1</small>
            </div>
            <div class="col-12" style="height: 3.5rem; line-height: 3.5rem; color: #fff; background: #218739;">
            <small>GREEN #218739</small>
            </div>
            <div class="col-12" style="height: 3.5rem; line-height: 3.5rem; background: #c8e6c9;">
            <small>GREEN #c8e6c9</small>
            </div>
        </div>
    </div>
    <div class="col-8 col-md-9 text-center py-5" style="max-height: 28rem; background: #f3f3f3;">
        <img class="mh-100 mw-100" style="box-shadow: 0 3px 5px -1px rgb(0 0 0 / 20%), 0 5px 8px 0 rgb(0 0 0 / 14%), 0 1px 14px 0 rgb(0 0 0 / 12%);" src="/img/assets/ux-colors-lt-colors-site.jpg" alt="Locus Tempus application in color." />
    </div>
</div>

And here is a comparison of the interface before and after the colors were put in place.

<div class="row mx-auto my-5">
    <div class="col-5 offset-1">
{{< figure
    src="/img/assets/ux-colors-lt-bw.png"
    caption="Before"
    alt="Locus Tempus user interface in grayscale"
    class="mx-auto my-0 bordered"
    width="100%"
>}}
    </div>
    <div class="col-5 offset-1">
{{< figure
    src="/img/assets/ux-colors-lt-colors.png"
    caption="After"
    alt="Locus Tempus user interface in grayscale."
    class="mx-auto my-0 bordered"
    width="100%"
>}}
    </div>
</div>

## Colors for hierarchy and emphasis

Colors can also indicate interactive components, and express relationships between elements on a
page. The different variations of amber, for example, is used on the Locus Tempus interface to
signal that a layer is active and new map markers can be added to it.

{{< figure
    src="/img/assets/ux-colors-lt-layers.png"
    alt="Locus Tempus interface showing two layers sets, the active layer is highlighted in amber, and the inactive is in grayscale."
    width="75%"
    class="mx-auto bordered"
>}}

Hue, saturation, and brightness of colors can be used to signal level of prominence and
hierarchical relationship of components. Dark green buttons in Locus Tempus have higher emphasis
than their lighter counterparts, and they represent more important actions. Saturated red buttons
suggest actions that need to be approached with caution.

{{< figure
    src="/img/assets/ux-colors-lt-buttons.png"
    alt="Green buttons indicate positive actions, red buttons show risky action. The most saturated buttons are labeled high prominence."
    width="75%"
    class="mx-auto"
>}}

## Wrapping it all up

Locus Tempus has a complex user experience, and color plays a major role in its design. I used the
colors commonly used in maps to represent Locus Tempus’s identity, in its logo and consistently
throughout the application. Colors in Locus Tempus are applied intentionally to communicate meaning
in interface components, improve usability, and shape user experience. The harmony in the color
palette integrates functionality and aesthetic design, and I hope it helps evoke delight and
consequently improve user engagement with the application.

But it is important to note that when only colors are used as visual cues to convey meaning and
guide user behavior, these cues will not be accessible to users who are colorblind or blind.
Information about these visual cues must also be conveyed through additional ways.
