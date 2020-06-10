---
title: "The Narrative of User and Technical Stories"
date: 2020-06-09
type: "post"
authors: ["mustapha"]
tags: ["user experience", "user stories", "technical stories"]
lede: "Technical stories connect the intention of use of what we’re
imagining, and the reality as well as possibilities of the technology that we
can build."
shortlede: "Technical stories connect the intention of use of what we’re
imagining, and the reality as well as possibilities of the technology that we
can build."
poster: "poster-userstory-techspec.jpg"
thumbnail: "thumbnail-userstory-techspec.jpg"
socmediaimg: "socmediaimg-userstory-techspec.jpg"
hiliteimg: "poster-userstory-techspec.jpg"
poster_sourceurl: "https://www.youtube.com/watch?v=wbkslm52xog"
poster_source: "10 Cats.ᐩ"
bookendanimal: "book"
---

The software development team at the CTL makes software for courses or
classroom use, and we follow the
[(modified) Agile methodology](/articles/practicing-agility/)
to run our projects. Typically, during the discovery phase (and throughout the
lifecycle) of a project, the project’s faculty (client), the learning designer
(owner), the front-end designer, and the developer would meet to define the
learning objectives and outcomes of what it is that we’re making, and then
write some user stories.

What comes next is the bridge connecting the intention of use of what we’re
imagining, and the reality as well as possibilities of the technology that we
can build.

## User stories and technical stories

A user story is a concise description of a feature of a software, from the
perspective of the user. 

A user story typically follows the following format:  
_As a {user type}, I want to {do something}, so I can {benefit}_

Or, another way to put it is:  
_As a {who}, I want to {what}, so I can {why}_

And, as an example:  
_As a course instructor, I want to create an activity, so I can assign it to my students._

_As a course student, I want to create an essay, so I can respond to an assigned activity._

In the context of our work at the CTL, these user stories inform us developers
what the software should do to satisfy the learning objectives, and how it can
yield the specified outcomes. We gather these user stories to define the sets
of functionality of the learning tools we’re building.

These user stories alone are not enough for us to begin implementing the
functionalities. As simple as they may sound, complexity can happen from the
point of view of the system, or technology, and it can be hidden without
further examination. Sometimes this system’s perspective introduces a chain of
complications that can change user experience, and perhaps affect the learning
objectives outcomes.

This is why I write technical stories.

## What are technical stories?

There are
[many](https://rgalen.com/agile-training-news/2013/11/10/technical-user-stories-what-when-and-how),
[many](https://mentormate.com/blog/when-user-stories-get-technical/)
definitions and
[guidance](https://medium.com/tribalscale/writing-technical-user-stories-434bf96f1dd5)
on writing technical stories, and even
[disagreements](https://www.extremeuncertainty.com/why-technical-user-stories-are-bad/)
on their usefulness. A technical story follows along a user story, coupled with
[acceptance criteria](https://www.freecodecamp.org/news/the-acceptance-criteria-for-writing-acceptance-criteria-6eae9d497814/),
from the point of view of the system that will be developed or used to
implement the functionality.

Technical stories are not in lieu of user stories. In fact, they add value to
the specification initially defined by user stories. They also clarify backend
conditions for acceptance criteria. It’s noted that technical stories are not
instructions on how developers should implement the functionalities. They’re
narratives on what happens next in the system, and guides the technical
specifications.

As a front-end developer, I find them extremely valuable in designing and
refining the software’s user experience, communicating with the project’s
developers and stakeholders, drafting out specifications, and sketching out the
wireframes.

## Why write technical stories?

User stories are invaluable to define user expectations of a desired
functionality in a simple and direct manner, but they may not make apparent the
details and conditions that may come up on the backend. Writing out these
technical narratives defines the scope and helps us estimate our efforts and
prioritize the functionalities.

Technical stories are also a form of conversation among us developers and
designers, and the project’s stakeholders. These stories are not what and how
we developers want the software to do. Instead they are an examination of
options and possibilities to meet the acceptance criteria, and satisfy the
learning goals and outcomes. We may not have thought of these potentials in
detail as we write the user stories, and in the end, they can help us design
and develop better experience for the users.

These stories can also inform us of additional conditions, limitations, or
other important technical aspect of the software we’re making that may not be
obvious or have been overlooked in user stories. This can help us build better
models, or develop better architecture, and design smoother user interaction.

## How we write technical stories

I write technical stories with the project’s developer, and we begin with the
user stories. Sometimes, the user stories are too broad, so we break them down
further. Here is an example of a broad user story from one of our projects:

* As a _course instructor_, I want to _create an activity_, so I can _assign it
to my students_.

The _“who”_, _“what”_, and _“why”_ in this user story each needs to have its
own user story.

Let’s look at _“what”_ the user wants to do, which is _“create an activity”_.
We walk through the steps of creating, assuming the role as the system. For
example:

* As the _system_, I want to _validate the activity_, so I can _allow it to be
created_.

The components of an activity, from the user’s perspective, are title,
instructions, and due date. What are not apparent in the user story are
conditions: character limitations for title and instructions (min/max),
required field, error handling and display, date range logic, state of the
activity (draft/published), activity visibility, auto saving (or not),
accidental browser closing, and permissionning (who can see it). So now, the
user story gets a rewrite into a technical story. Let’s consider the title and
instructions component:

- As a _course instructor_, (separate story)
- I want to _create an activity_,  
  - required field: title  
      - character range is 1 to 1024, alphanumeric
  - required field: instructions  
      - no character limitation, alphanumeric
  - (other components)
- so I can _assign it to my students_. (separate story)

Since both title and instructions are required fields, the user needs to be
alerted if they are blank, but on save or on focus? What will error handling
and display look like? Can this requirement be weaved into a more intuitive
user experience? How will auto-saving work in this case, if we choose to do
that? What will the user interface for the activity look like given the
character limitation for title, and the lack of it for instructions?

As we flesh out the technical stories, we can then prioritize our development
work, and change user stories to improve the desired functionalities. These
technical stories also help me sketch out a set of wireframes that include
user and information (or data) interaction. The technical stories map to the
user stories, and because of that, we can see how they affect user experience.

The conversations around the technical stories for this user story doesn’t
happen in isolation. Both the faculty client and learning designer for the
projects are involved in shaping these stories to make sure that the primary
learning goals aren’t compromised. Writing technical stories is a craft of
communication that bridges the intent of use and the implementation of the
system.