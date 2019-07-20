---
title: "Interacting With Nutrition Theory"
date: 2019-07-05
type: "post"
authors: ["dreher"]
tags: ["django","vue","python","javascript","json","jointjs"]
lede: "Translating a paper-based theory diagram into a clientside interactive takes teamwork and a solid diagramming library."
poster: "poster-theory-model.jpg"
socmediaimg: "socmediaimg-theory-model.jpg"
hiliteimg: "poster-theory-model.jpg"
poster_sourceurl: "https://unsplash.com/photos/VHpDp_GkGgc"
poster_source: "Photo by Pineapple Supply Co. on Unsplash"
bookendanimal: "fish"
---

## Designing DESIGN Online
We're working with nutrition education faculty at [Teacher's College](https://www.tc.columbia.edu/health-and-behavior-studies/nutrition/) on an interactive curriculum builder. The application models the [DESIGN Procedure](https://www.amazon.com/Nutrition-Education-Linking-Research-Practice/dp/1284078000), the brainchild of Professor Isobel Contento with the support of her colleague Associate Research Professor Pam Koch. Students will use this tool to create more effective and engaging nutrition-related learning experiences.

The DESIGN Procedure interaction started simply as a set of worksheets, then was migrated to Qualtrics, a survey-like environment. Our latest iteration is [DESIGN Online](https://designonline.ctl.columbia.edu), a [Django](https://www.djangoproject.com/) web application using [Vue.js](https://vuejs.org/) as the clientside framework. This implementation was largely straightforward, building on similar applications that offer a guided learning experience. The DESIGN Procedure is fairly lengthy, so our main focus was to provide an intuitive interface with clear wayfinding and progress indicators.

{{< figure
    src="/img/assets/theory-model-team.jpg"
    class="bordered"
    alt="Isobel Contento, Pam Koch, Rachel Paul and Marc Raymond are shown reviewing design documents." >}}

## A solid foundation
One unique challenge centers around learning theory. In nutrition education, a set of proven theory models guide practitioners and provide a pedagogical structure. These theory models are composed of determinants, identified behaviors and attitudes that cause or impede change. The DESIGN procedure requires students to choose and customize a theory model for each lesson plan, adding and removing determinants where appropriate.

On the faculty’s wishlist was a way to make these theory models come alive. In the paper-based implementation, students customized their theory models with paper and pencil. This approach proved too permissive, resulting in inaccurate models. The ensuing Qualtrics implementation could not technically offer a solution.

{{< figure
    src="/img/assets/theory-model-paper.jpg"
    class="bordered"
    alt="A student completing the paper-based DESIGN procedure" >}}

After a lot of talk and white-boarding sessions, our team decided to allow students to interact directly with the models, but only allow some determinants to be added and removed. Each of the five models had “similar but not the same” signatures. These variations led us to draw out detailed documents for each model.

{{< figure
    src="/img/assets/theory-model-mockup.png"
    class="bordered"
    alt="A screenshot of the requirements document for the Social Cognitive nutrition theory model" >}}

## Choosing a library
I surveyed client-based graphing and diagraming libraries, using the selection criteria:
<ul>
<li>Open-source, free to use for non-commercial implementations.</li>
<li>Serialization capabilities.</li>
<li>Flexible layout control.</li>
<li>Connectors that dynamically determined their own path.</li>
<li>User-interface events.</li>
</ul>

I settled on the open-source [JointJS](https://www.jointjs.com/opensource) library primarily for its excellent user-interaction capabilities, layout control and its ability to easily connect diagram elements with links. I knew I could come up with a serialization format that worked.

## Drawing the diagram
The theory model interactive is implemented within a [Vue.js](https://vuejs.org/) component. The component responds to user-interface events, handles load and save operations and orchestrates the JointJS rendering.

Each model has an initial JSON representation, modeled as a two-dimensional array reflecting a grid layout. Array items describe diagram elements including labels, link relationships and relative offsets from the top y position, and interactivity toggles. Here’s a look at the Perceived Norms category of the Social Cognitive theory. The category contains two determinants that can be removed, and connect to the next category with double arrows.

        {
            "id": 14,
            "label": "Perceived norms",
            "style": "motivator",
            "required": 1,
            "determinants": [
                {"id": 15, "label": "Injunctive social norms ³",
                 "show": 1, "interactive": 1},
                {"id": 16, "label": "Descriptive social norms ³",
                 "show": 1, "interactive": 1}
            ],
            "links": [{"id": 18, "style": "double", "router": "normal"}]
        },


When the Vue component triggers a render, three passes are made through the JSON structure.

1. The first pass calculates the width and height of each element based on its label. Text wrapping is not natively supported in SVG, so I used the JointJS utility [joint.util.breakText](https://resources.jointjs.com/docs/jointjs/v3.0/joint.html#util.breakText) to break the text into lines based on element width. Width is determined by the current width of the enclosing component divided by the number of columns.

2. The second pass creates the JointJS shapes and sets the x, y positions based on the width and height calculations performed in step 3. Interactive shapes also get a delete button.

3. The third pass adds the links between the shapes. This operation technically could be accomplished in the second pass. However, rendering happens in the order shapes and connectors are added to the diagram. Adding the connectors last ensures that they are drawn last and can be seen clearly.

The Perceived Norms render looks like so:
{{< figure
    src="/img/assets/theory-model-rendered.png"
    class="bordered"
    alt="A screenshot of the Perceived Norms determinant" >}}

## Interactivity

The last bit of work was hooking up a click on the JointJS diagram to a “remove determinant” action. JointJS handles this by [exposing events on its “paper”](https://resources.jointjs.com/docs/jointjs/v3.0/joint.html#dia.Paper.events).  When a shape is clicked, a little work is done to determine if a user clicked on an interactive shape’s delete button. The underlying JSON structure is then updated and saved.

            clickDelete: function(cellView, evt, x, y) {
                if (this.disabled === 'disabled') {
                    return;
                }
                if (cellView.$el.hasClass('interactive')) {
                    let $elt = cellView.$el.find('.joint-port');
                    if ($elt && this.within(evt.clientX, evt.clientY, $elt)) {
                        const did = cellView.$el.data('determinant-id');
                        this.setVisibility(did, 0);
                        this.save();
                    }
                }
            },

## Pulling it all together
{{< figure
    src="/img/assets/theory-model-full.png"
    class="bordered"
    alt="A screenshot of Social Cognitive nutrition theory model" >}}


Overall, I’m pleased with this implementation. I like the JSON initialization format, and the final rendering code boils down to just 250 lines of code and is super fast. My only point of frustration is in the exception cases. One of the theory models needs an enclosing container around a set of determinants. Another theory model needs a non-determinant element that spans multiple columns. I handled these as additional attributes within the JSON representation, but the code did start to warp a bit. I do continue to think about ways to handle the rendering even more efficiently.

Note: This repository’s code is private pending licensing agreements. Stay tuned!
