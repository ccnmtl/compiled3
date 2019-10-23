---
title: "Accessible Interactive PDF: Pointers to Start"
date: 2019-10-23
type: "post"
authors: ["mustapha"]
tags: ["accessibility","pdf","user experience"]
lede: "Making accessible interactive PDF can be tricky. This post offers an approach that considers accessibility experience in addition to technical compliance."
poster: "poster-accessible-pdf-wheel.png"
socmediaimg: "socmediaimg-accessible-pdf-wheel.jpg"
hiliteimg: "poster-accessible-pdf-wheel.png"
poster_sourceurl: ""
poster_source: ""
bookendanimal: "universal-access"
---

Digital accessibility means that content on websites and digital platforms is
developed so that everyone, including people with disabilities, can perceive,
interact, understand, and navigate using a wide range of devices and assistive
technologies. This applies to content in PDF documents, considering that this
file format is one of the most widely used digital formats in the world.

PDF is a popular format because it presents an electronic version of a printed
document. It affords robust and reliable options for presentation, layout, and
interactivity, that is independent of hardware and operating system. It is also
tricky for accessibility, because of the flexibility of layout it provides.

Consider an inaccessible PDF document with multi-column layout that is typical
in newspapers or brochures. The columns are visual containers for the text, and
they provide structure for sighted readers. The reader perceives the content
flow as top-down, line by line, column by column.

{{< figure
    src="/img/assets/two-col-text.png"
    alt="The paragraph of text in a two-column layout. A sighted reader perceives the content flow as top-down, line by line, column by column." >}}

A screen reader, on the other hand, doesn’t recognize the content structure as
hinted by the columns because there’s nothing in the inaccessible PDF that
passes that structure along. The screen reader reads the inaccessible PDF from
top to bottom, left to right, across columns. The following video demonstrates
the nonsensical screen reading of an inaccessible PDF content.

{{< youtube
    id="GaNwnsT4B5s"
    attr="NC State IT Accessibility"
    title="Untagged PDF Being Read by a Screen Reader" >}}

## What is PDF accessibility?

A PDF document is considered accessible when people with visual, motor, and
other disabilities can read, interact, understand, and navigate the document in
the equivalent manner as an abled person.

The content of an accessible PDF document needs to be in a _logical, or
meaningful structure and sequential order_ regardless of its layout. This can
be achieved using _PDF tags_. These tags provide assistive technologies, such
as a screen reader, an organizational hierarchy of the document that can be
read and tabbed through. These tags are similar to the semantic elements in
HTML such as header, paragraph, image, and link.

_The foundation of PDF accessibility is the tagging of its content._

<div class="text-center text-black-50 my-5" aria-hidden="true"><i class="fas fa-lg fa-ellipsis-h"></i> <i class="fas fa-lg fa-file-pdf"></i> <i class="fas fa-lg fa-ellipsis-h"></i></div>

This summer, the CTL launched its first massive open online course (MOOC)
dedicated to the topic of inclusive teaching in higher education. The MOOC,
titled [Inclusive Teaching: Supporting All Students in the College Classroom](https://www.edx.org/course/inclusive-teaching-supporting-all-students-in-the-college-classroom), is a self-paced course on edX, and is open
to everyone. Accessibility was an extensive consideration for this MOOC, from
its main video production to the development of its supplementary materials.

## Challenge: Interactive Identity Wheel Activity

One of the materials is the Identity Wheel Activity worksheet. The exercise
encourages learners to identify and reflect on the different facets of their
identities, and on how their identities are experienced differently in
different contexts. The insight from this activity may help foster awareness on
how these identities inform the way they understand the world, how they
interact with it, and help them understand the idea of positionality.

<p class="sr-only">The following image features a circle that is separated into
12 sections. Each section is labeled: (starting at the top and moving clockwise
around the circle) sexual identity; gender identity; race; ethnicity; religious
affiliations; socioeconomic status; socioeconomic background; ability;
educational background; national origin; first language; and family status. In
the center of the circle, there are five numbered reflective prompts: (1)
Identities you think about most often; (2) Identities you think about least
often; (3) Your own identities you would like to know more about; (4)
Identities that have the strongest effect on how you perceive yourself; (5)
Identities that have the greatest effect on how others perceive you.</p>

{{< figure
    src="/img/assets/identity-wheel.png"
    alt="The Identity Wheel Activity" >}}

Each box on the wheel represents a different facet of identity. The learner
will type in the textboxes the number that corresponds with each reflective
prompts in the center of the circle as it relates to a particular identity
facet. An interactive PDF seemed like a good fit for Identity Wheel worksheet
because the learner can work on the activity on- or offline, save it or print
it for future reference. The worksheet just needed to be made accessible;
exercise didn’t look so complex.

## Solution: first UX, then UX, then tools, then more UX

The goal of the Identity Wheel exercise is to get learners to associate the
reflective prompts to the twelve identity facets. The initial visual layout and
experience for the exercise is as follows:

* The worksheet instructions and attribution precede the Identity Wheel. A
learner would read the instructions before begin working on the exercise.
* The twelve identity facets are arranged in a circle. While a sighted user
would commonly read the wheel clockwise, the hierarchy or order of these facets
is irrelevant.
* The reflective prompts are also placed in the center of the circle for easy
reference.

{{< figure
    src="/img/assets/wheel-first-structure.png"
    caption="Initial visual layout for the Identity Wheel exercise"
    alt="" >}}

The experience through a screen reader, however, is linear, and the content of
the Identity Wheel PDF needed to be in a logical, meaningful structure and
sequential order regardless of its layout. I also had to take into account how
the screen reader reads a PDF, and find solutions to its limitations.
VoiceOver, for example, reads only the content that is visible on screen. If
half of the wheel is visible on the monitor, then VoiceOver reads only half of
the identity facets and reflective prompts.

{{< figure
    src="/img/assets/sr-visible-scope.jpg"
    class="bordered"
    alt="A diagram showing half of the PDF document on a monitor." >}}

Determining the accessible experience for the Identity Wheel worksheet was an
examination of the learning process of the exercise for _all learners_. What
guidance and information did the learners require _beforehand_ to begin the
exercise on their own? What did they need _while_ working on the activity?
Would pagination be a problem if the worksheet is split into two pages? What
would the linear layout of experience be like?

We decided on the following experience structure and sequence:

* The instructions and reflective prompts would be ahead of the Identity Wheel
as guidance, on the first page.
* The attribution would follow as reference, also on the first page.
* The Identity Wheel would be on the second page for readability. The tabbing
and reading order of the identity facets would be clockwise.
* A duplicate of the reflective prompts remained in the center of the circle
for sighted users, but would be read before the identity facets.

{{< figure
    src="/img/assets/wheel-second-structure.png"
    caption="Revised visual layout for the Identity Wheel exercise.<br/>The numbers indicate order of reading by a screen reader as described above."
    alt="" >}}

## 1, 2, 3: Design, optimize, and test

### 1. Design: Adobe InDesign

PDF accessibility begins from the original source, and since the worksheet has
a particular visual layout, I used Adobe InDesign to create the source
document. I designed the worksheet according to the accessibility experience
structure and order previously described. The key to the correct reading and
tabbing order in Adobe InDesign is the Articles Panel, and Tag Panel for
structure—headings, paragraphs, images. I made sure that the source document
had no typos or errors, and that it complied to the accessibility experience
_before exporting to interactive PDF_ to minimize repairs in subsequent steps.

I find the following tutorials helpful in creating the InDesign interactive
source document:

* [Creating a more accessible PDF in Adobe InDesign](https://www.youtube.com/watch?v=AmR_FRF6JkE)
* [Adobe InDesign accessibility](https://www.adobe.com/accessibility/products/indesign.html)
* [Create an interactive PDF](https://helpx.adobe.com/indesign/how-to/indesign-create-interactive-pdf.html)
* [Articles panel in InDesign](https://helpx.adobe.com/indesign/how-to/indesign-articles-panel.html)

### 2. Optimize: Adobe Acrobat Pro

The next step was to optimize the interactive PDF worksheet for better
accessibility using Adobe Acrobat Pro. Tagging and Reading Order tools are the
building blocks of accessible PDF documents to ensure correct readings by
screen readers and Adobe PDF Reader’s Read Out Loud functionality.

First, I examined the Identity Wheel worksheet using the Reading Order tool.
Since I structured my original InDesign document properly, the order of content
required little fixing. I had to fix some peculiarities unique to InDesign PDF
export (fractured paragraphs, for example), but other changes were minor.

Next, I repaired some structural tags; for example, improper headings, and list
items in the worksheet instructions, with the Tagging tool. Finally, to address
the issue with partial reading of on-screen visible content, I set the the page
layout to “Single Page” in the “Initial View” document property.

These resources helped me understand Acrobat Pro better for accessible PDF
optimization:

* [Reading Order and Tagging tool in Acrobat Pro](https://helpx.adobe.com/acrobat/using/touch-reading-order-tool-pdfs.html)
* [Add Tags to an Untagged Document](https://www.adobe.com/accessibility/products/acrobat/pdf-repair-add-tags.html)
* [Examine and Repair the Tag Order](https://www.adobe.com/accessibility/products/acrobat/pdf-repair-repair-tags.html)
* [Examine and Repair the Tag Order—advanced](https://www.adobe.com/accessibility/products/acrobat/pdf-repair-repair-tags-advanced.html)

### 3. Test: Acrobat Pro, Screen reader, Adobe Read Out Loud

Adobe Acrobat Pro comes with an
[accessibility checker](https://helpx.adobe.com/acrobat/using/create-verify-pdf-accessibility.html#check_accessibility_of_PDFs)
that provides a report on the level of compliance in a PDF document. I ran the
Identity Wheel worksheet through the checker after fixing the content reader
order and tags.

Finally, I tested the worksheet with VoiceOver—the screen reader by Apple—and
with Acrobat Reader’s Read Out Loud functionality, to make sure that the
reading and tabbing order was correct, and the accessibility experience
followed what we had planned.

__Final result: [Accessible interactive Identity Wheel Activity PDF](/img/assets/identity_wheel_compiled.pdf)__

## Lessons learned

What I’ve learned from this whole process are:

1. Accessibility experience __is user experience__ and __is learning
experience__. Get these right first, and the content will be accessible.
2. PDF content needs to be in a logical, or meaningful structure and sequential
order using semantic structure in the original document as much as possible
before exporting to PDF. 
3. Visual layout and meaningful structure/order for screen readers are
independent of each other. You can lay out the document design any way you
want, and with PDF tags, you can achieve a different reading order.
4. Tagging PDF document content is important for accessibility.