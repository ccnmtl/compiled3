---
title: "Developing Accessibility Awareness"
date: 2022-05-19
type: "post"
authors: ["mustapha"]
tags: ["accessibility", "user experience"]
lede: "Thursday, May 19, 2022 is Global Accessibility Awareness Day. I use this day to share with you a technique that I constantly use to keep accessibility mindset present in my design and development processes: ask questions about my own browsing."
shortlede: "On Global Accessibility Awareness Day 2022, I share with you a technique I use to keep accessibility mindset in my work: ask questions about my digital content usage."
poster: "poster-accessibility-awareness.jpg"
thumbnail: "thumbnail-accessibility-awareness.jpg"
socmediaimg: "socmediaimg-accessibility-awareness.jpg"
hiliteimg: "poster-accessibility-awareness.jpg"
poster_sourceurl: ""
poster_source: ""
bookendanimal: "universal-access"
---

Thursday, May 19, 2022, is the 11th annual [Global Accessibility Awareness Day (GAAD)](https://accessibility.day/). It is a worldwide event to bring everyone’s focus on digital access and inclusion for people with different disabilities.

I use this day to reflect on how I came to become aware of digital accessibility, and subsequently learning to design and write code with components that are compliant with digital accessibility guidelines.

Some six years ago, I was involved in designing and developing an open online resources for Dental School at Columbia University. Compliance to digital accessibility guidelines was a requirement, and that was how I got started.

Learning about digital accessibility is a continuing education for me to the present-time. I’d like to share with you a technique that I constantly use to keep accessibility mindset present in my design and development processes: ask questions about my own browsing.

Let’s get started then.

## Links and wayfinding: how to get here and there

Let’s begin with what brought you to this CompilED post. Notice where you found the link that directs you here. Trace the path of your actions, from the beginning, __out loud__ so you can notice your movements consciously, and won't unknowingly skip a step. A few questions to ask yourself as you become aware of how you get here are:

* Was the URL linked to a text?
* Did the text describe the purpose, or the context of this page?
* Why did you follow the link, and what did you expect to find?
* Did your findings match the text that described the link?

An now that you’re on this page...

* Can you tell where you are in context of this page’s parent site?
* What cues do you use to explore the site—link text, sensory cues such as icons or audio, or different use of color?

You can apply this brief exercise on any link or website you follow to build accessibility awareness of links and wayfinding. What this exercise is doing is shed some light on how to provide meaning and context to users so they can decide whether to follow a link. Assistive technology such as screen readers with the list of links on the page, and meaningful text help users determine the purpose of the link quickly. Clarity helps users, regardless of disabilities, avoid ambiguities and frustration, and not just randomly asking them to [simply click here](https://en.wikipedia.org/wiki/Pauline_Wayne).

## Navigation: moving around and getting things done

While you’re on this page, or any page that you’re browsing, how do you go about exploring the page? Once again, trace the path of your actions, __out loud__. What affordances are available to you on a page that help you find your way around, and give you maximum access to the content?

Do you scroll up and down? What do you use to do that—a mouse, a trackpad, a keyboard, or what gestures do you use on a smartphone? When you use these affordances, do they function the way you always expect? What if you can’t use the mouse or trackpad, how would you navigate the site, and use its functionalities?

As you explore a page and come across links or forms, what cues tell you that the component is in focus? What happens when you use the tab key—does something change visually, or do the links and forms look the same? Can you use the functionalities on the page with a keyboard?

These questions will help you become aware of the modalities you use to interact with a page and its content. When content can be operated through a keyboard, it is operable by people with vision impairments (via screen reader navigation) as well as by people who use assistive technologies with keyboard emulators.


## Content structure: lay of the land

Now, notice the structure of this page. What components on this page give you the impression of structure, if any? Is the page divided into sections with headings, and does the structure make sense to you, why or why not? Check other web pages, do you notice meaningful lay of the land on those pages?

Let’s look at the following list of different food groups:

1. Grains
   * Oats
   * Brown rice
   * Bread
1. Fruits
   * Apple
   * Orange
   * Strawberry
1. Vegetables
   * Spinach
   * Kale
   * Carrot

Notice how the content is arranged, say it __out loud__, what do you understand from the list? What about the layout of the content that led you to your understanding? Is it grouping, numbering, indentations an whitespace, or sensory cues?

It is important to give structure, especially semantic structure, to content on a page. Semantic structure through proper headings, lists, etc, makes the content available for screen readers, and provide consistent meaning regardless of devices. Visual characteristics to communicate structure are very useful, however, the information needs to be conveyed to users in ways they can perceive.  

## Images: describe that to me

Say __aloud__, what do you see in the following photo?

{{< figure
    src="/img/assets/gaad-image-example.jpg"
    caption="What animal is this?"
    alt="What animal is this?" >}}

What leads you to your answer? Is there anything in the caption, or anywhere else that helps you identify the subject in the photograph?

If I tell you it’s a dog, would you believe me?

The animal in the photograph is a _tanuki_, a mammal in the canid (dog) family, also known as the Japanese raccoon dog. The raccoon dog is named for the resemblance of the raccoon, but they are not at all related.

This information would be useful to have as the caption, and as the alternative text for the image to convey the context and description of the image. Screen readers can read the text, and search engines can index it as an added bonus. Without an alternative text, and the auxiliary caption, users will miss out on the information the image is trying to relay.

## Video: movement and sound

At the Center for Teaching and Learning, we’re always developing web applications and online video content for educational settings. We do our best to conform to the Universal Design for Learning. Our focus is always ensuring that what we make supports the methods of instruction and the benefit of learning.

Let’s review the following instructional video.

{{< youtube
    id="Ct5mvc6Wt2I"
    attr="YouTube"
    title="Instructions on emergency uses of a handkerchief" >}}

What is this content about? How did you arrive at your understanding on what the video is teaching you? What did you see, versus hear? How would you benefit from the video if you have visual impairment? What would the transcript for this instructional video look like?

This video won’t have a transcript and captioning that explains the content because there is no verbal commentary in the video. Adding a narration can make the content accessible to people with visual disabilities.

## Forms: give and take

Forms are a very powerful tool for interacting with users. At times, there is a sort of conversation between the interface and the user. A user would enter information, and the form respond immediately to the entry. Here’s an example of a form that provides feedback based on validation.

<form class="bordered rounded p-3 needs-validation mb-3" novalidate>
<p style="font-size: x-large;"><b>Plan a trip</b></p>
  <div class="row ">
    <div class="col-10 mb-3">
    <div class="form-group">
    <label for="startpoint">From: <b>*</b></label>
      <input type="text" class="form-control" id="startpoint" placeholder="Type starting location" required>
      <div class="invalid-feedback">
        Please provide a valid location.
      </div>
    </div>
    <div class="form-group">
      <label for="destinationpoint">To: <b>*</b></label>
      <input type="text" class="form-control" id="destinationpoint" placeholder="Type destination location" required>
      <div class="invalid-feedback">
        Please provide a valid location.
      </div>
    </div>  
    </div>
    <div class="col-2 mb-3 align-self-center">
    <button class="btn btn-light border"><img src="/img/assets/icon-exchange.svg" style="height: 1.75rem;" alt="" /></button>
    </div>
  </div>
  <hr />
  <p class="mb-1 pb-0">Travel time: <b>*</b></p>
    <div class="form-check">
      <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" required>
      <label class="form-check-label" for="exampleRadios1">
        AM
      </label>
    </div>
    <div class="form-check">
      <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2" required>
      <label class="form-check-label" for="exampleRadios2">
        PM
      </label>
      <div class="invalid-feedback">
        Please provide travel time.
      </div>
    </div>
  <hr />
  <p class="mt-4 mb-1 pb-0">Places to visit:</p>
    <div class="form-check">
      <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
      <label class="form-check-label" for="defaultCheck1">
        Museums
      </label>
    </div>
    <div class="form-check">
      <input class="form-check-input" type="checkbox" value="" id="defaultCheck2">
      <label class="form-check-label" for="defaultCheck2">
        Cafés
      </label>
    </div>
    <div class="form-check">
      <input class="form-check-input" type="checkbox" value="" id="defaultCheck3">
      <label class="form-check-label" for="defaultCheck3">
        Parks
      </label>
    </div>
    <p class="text-right"><i>* required</i></p>
  <button class="mt-4 btn btn-primary" type="submit">Submit form</button>
</form>

<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
        event.preventDefault();
        event.stopPropagation();
      }, false);
    });
  }, false);
})();
</script>


Once again, __out loud__, what do you interpret what you need to do with this form? How is information, or requests for actions, is arranged in this form?

What information do you need to enter, and how do you know that? Do you see visual cues that acts are instructions? Where are the cues located in the form.

Can you tell the up-down arrows mean without clicking on it? What leads you to that answer?

Go ahead and click the “Submit form” button without filling out the form fields. Is the immediate feedback clear to you? Is the immediate feedback _important_ for you? What do you understand from that feedback? Does the use of colors convey any information to you?

Forms can be complex and challenging to design. We need to ask ourselves, however, if the complexities are necessary, and if they can interfere with user experience. If you see live feedback in the form, that same feedback must be presented in ways that everyone can perceive, in the order that you “see” happening.

## Conclusion

I hope that my post provides you with long-lasting questions to ask, and help in fostering accessibility awareness in designing and developing digital content. This awareness can lead to a better understanding of how to fold accessibility mindset into our working processes, because digital accessibility isn’t a checklist to go through at the end, it should be part of the process. It benefits everyone.

_“Digital accessibility is when all people regardless of disability can obtain the same information and perform the same functions independently [online].”_  
— Tim Harshbarger and Michael Harshbarger, accessibility consultants and instructors at Deque.

## Get started with a few resources

* [Introduction to Web Accessibility](https://www.w3.org/WAI/fundamentals/accessibility-intro/): from W3C.
* [How People with Disabilities Use the Web](https://www.w3.org/WAI/people-use-web/): from W3C.
* [How Persons with Disabilities Use the Web](https://www.youtube.com/watch?v=WveJjhwaEDI): a video recording of a webinar by Deque.
* [A11Y Style Guide](https://a11y-style-guide.com/style-guide/): a living style guide or pattern library with pre-populated accessible components.
* [W3C Web Accessibility tutorials](https://www.w3.org/WAI/tutorials/): a collection of tutorials by W3C on how to develop web content that is accessible to people with disabilities.
