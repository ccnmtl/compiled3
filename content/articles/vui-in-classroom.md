---
title: "All Talk? Where is VUI Design in the Inclusive Classroom?"
date: 2022-06-17
type: "post"
authors: ["raymond"]
tags: ["vui", "user experience", "inclusive design", "accessibility"]
lede: "When it comes to incorporating VUI-based educational technologies and
other voice-centric learning strategies within the classroom, I was disappointed
to find very little research about this topic."
shortlede: "Why is finding stellar examples of the purposeful use of VUI in the
inclusive classroom difficult?"
poster: "poster-vui-classroom.jpg"
thumbnail: "thumbnail-vui-classroom.jpg"
socmediaimg: "socmediaimg-vui-classroom.jpg"
hiliteimg: "poster-vui-classroom.jpg"
poster_sourceurl: "https://www.pexels.com/photo/white-bluetooth-speaker-on-silver-laptop-computer-1666315/"
poster_source: "Jessica Lewis Creative on Pexels"
bookendanimal: "comment"
---

There is no shortage of Voice User Interface (VUI) Design resources out there
when it comes to ideas about the potential use of VUI design in our everyday
lives and how-to-guides for creating commercial applications. However, when it
comes to incorporating VUI-based educational technologies and other
voice-centric learning strategies within the classroom, I was disappointed to
find very little research about this topic.

A still relatively new and powerful design discipline (in spite of imperfections
like speech recognition and privacy), VUIs allow users to interact with smart
devices and applications through conversation. Since it’s widely used in our
homes and cars and voice commands don’t rely on hands and eyes, why is finding
stellar examples of the purposeful use of VUI in the inclusive classroom
difficult? 

Even the experts say there just isn’t much research to glean from (yet).<sup><a
href="#works-cited" aria-label="Footnote 1.">1</a></sup> VUI design usability
studies is still a new field of study and has yet to be incorporated into wider
human-computer interaction curricula.<sup><a href="#works-cited"
aria-label="Footnote 2.">2</a></sup> I could use an upgrade myself because I
still have a lot to learn about VUI principles as a GUI designer, but I already
see that there are some similarities when we look at the basics of voice design.

First, like code, a voice command on any device—Alexa, Cortana, Google
Assistant, and Siri—has a common, three-component structure<sup><a
href="#works-cited" aria-label="Footnote 3.">3</a></sup>:

* Intent
* Utterance
* Slot

## Intent

What is the objective of this user’s voice command? Does the voice command
within this interaction have a high utility or low utility objective?

High utility intent could be:

* requesting a dance song to play on Apple Music
* requesting the lights in the living room be turned off with Google Assistant

Low utility intent could be:

* vaguely asking for more information about the weather prompting the VUI to
formulate follow-up questions
* asking for French phrases to be translated, which may need to be checked
against the VUI’s language scope.

## Utterance

How does the user phrase/utter this voice command in order to trigger the task?
How many variations of this command can we also consider for better
understanding and use?

A _simple_ phrase could be “Tell me the weather.” A _complex_ variation of this
phrase might be “Could you give me a 5-day weather outlook including humidity?”

## Slot

What are the variables that are requested within this user voice command to
fulfill this task? Are these slots _required_ or _optional_?

* Required slot - “Hey, Google. Book me a reservation at Café du Soleil on
Friday at 5pm for two people.” Place, day, time, and party are required slots as
this voice command cannot be processed without including them.
* Optional Slot - “OK Google, play some party music.” The word “party” is an
optional slot because the command can be processed without it.

Secondly, like GUI design, persona and user story development requires as
much—if not more rigor—compared to GUI design. Three popular tools for
prototyping VUI designs include:

* [Dialogflow](https://cloud.google.com/dialogflow)- a Google Cloud product
* [Speechly](https://www.speechly.com/) - a voice interface API
* [Voiceflow](https://www.voiceflow.com/) - collaborative conversation design
for chatbots, Alexa, Google Assistant, in-car, and others

A deeper understanding of VUI strategies and tactics for designing eyes-free,
hands-free voice interfaces for instructors and students will help educators in
creating and sustaining accessible learning experiences. Are you using Alexa in
your classroom? Is Google Home helping you teach? Is Siri helping your students
with their homework? What about Cortana? Anything else?  If so then please
[contact me](https://ctl.columbia.edu/about/team/raymond/) as I’d really like to
learn more about your efforts.

## Works Cited

1. Voice User Interfaces in Schools: Co-designing for Inclusion With
Visually-Impaired and Sighted Pupils  
http://www.ousmet.com/wp-content/uploads/2019/02/Voice_User_Interfaces_in_Schools.pdf

2. Teaching for Voice: The State of VUI Design in HCI Education  
https://educhi2019.hcilivingcurriculum.org/wp-content/uploads/2019/04/p03-Teaching-for-Voice-The-State-of-VUI-Design-in-HCI-Education.pdf

3. A Definitive Guide to Voice User Interface Design (VUI)
https://userguiding.com/blog/voice-user-interface/