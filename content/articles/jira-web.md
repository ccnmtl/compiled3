---
title: "Jira Web"
date: "2020-07-19"
type: "post"
authors: ["dittren"]
tags: [jira]
lede: "My first dive into a robust project management tool."
shortlede: "My first dive into a robust project management tool."
poster: "poster-jira-web.jpg"
thumbnail: "thumbnail-jira-web.jpg"
socmediaimg: "socmediaimg-jira-web.jpg"
hiliteimg: "poster-jira-web.jpg"
poster_sourceurl: "https://unsplash.com/photos/J7rRzjba-kY"
poster_source: "Ariana Suárez on Unsplash"
bookendanimal: "cat"
---

One of my first tasks at the CTL was to look into a more efficient way for the
Media Team to get the information they need when an event requires photo
and/or video. After some brainstorming, I wanted to approach the problem in a
way that would be the least distruptive to the current workflow. I settled on
creating a customized issue for photo/event purposes.

This decision began my deep dive into Jira. Before Jira, I had some experience
with project management tools like Trello and Asana but didn’t know much about
the administrator tasks. At first, I imagined the work would mostly consist of
creating custom fields to place on a template, but I came to find that there was
a lot more to it. Jira is a much more complex tool than I was expecting and I
found myself in a bit of a web.

The creation of a custom issue involved multiple steps. To accomplish this, yes,
you do need to create each individual custom field you would want to use in
your issue. But it also involves the creation of an Issue Type, which is then
attached to an Issue Type Scheme. From there, you must create a Screen and
attach the newly configured custom fields. Lastly, it also requires the
configuration of an
[Issue Type Screen Scheme](https://confluence.atlassian.com/adminjiracloud/associating-screen-and-issue-operation-mappings-with-an-issue-type-776636504.html#:~:text=Hence%2C%20an%20issue%20type%20screen,default%20issue%20type%20screen%20scheme.).

The use of schemes and screens in Jira was something that I had to research
quite a bit to fully understand. Fortunately there were a lot of beginner’s
guides to Jira like this one
[Jira Project Management: A How-To Guide for Beginners](https://blog.hubstaff.com/jira-project-management-guide-beginners/)
as well as a pretty active Jira community board for the
questions that kept coming to me. Another good source of information is this
[Jira tutorial](https://www.tutorialspoint.com/jira/).
One also had to be careful about which guide to follow, as some
workflows/features are only available on Jira Cloud vs Jira Software.

The main takeaway for me was the expansiveness of Jira and how many things
actually go into making a complex project management tool. I had previously
written a small application management system, which had a different goal of
course, but I can see where I can go back and improve.

Ultimately, after some research, I was able to create a customized Jira ticket
that will hopefully make it easier for the Media Team to collect all necessary
information for events that require photography or video recording. I look
forward to learning more about Jira and management tools in general.
