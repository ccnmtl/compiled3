---
title: "Reflections on the Open Analytics Summit"
date: "2013-06-30"
type: "post"
authors: ["bossewitch"]
tags: ["analytics", "big data", "drill", "elasticsearch", "logstashd", "python", "events"]
shortlede: ""
lede: "Back in June, I attended the one-day Open Analytics Summit. We aren't really doing much with analytics or big data here at CCNMTL (yet), but there are many conversations and projects happening around campus and I wanted to get a better sense of the kinds of value these methods are yielding."
poster: ""
socmediaimg: ""
hiliteimg: ""
poster_sourceurl: ""
poster_source: ""
---

<p>Back in June, I attended the one-day <a href="http://www.openanalyticssummit.com/">Open Analytics Summit</a>.  We aren't really doing much with analytics or big data here at <span class="caps">CCNMTL </span>(yet), but there are many conversations and projects happening around campus and I wanted to get a better sense of the kinds of value these methods are yielding. These issues are sure to be central to much of the research and instruction at the <a href="http://idse.columbia.edu">Institute for Data Sciences and Engineering</a>, and have already crept up on a number of Columbia projects we have been involved with, such as the <a href="http://www.declassification-engine.org/">Declassification Engine</a> and the <a href="http://opensyllabusproject.org/">Open Syllabus Project</a>.</p>

<p>The conference was interesting, but I was a bit puzzled by the format. The talks were all 15 or 30 min in length, and the speakers rarely left any time for questions.  It was almost like a day of long lightning talks - they talks weren't really long enough to get into too much depth, but I did get a flavor for the kind of work happening in this field.<br /> <br />Some of the conference highlights: </p>

<ul>
<li>Nearly everyone is using <a href="http://hadoop.apache.org/">hadoop</a>.  No real surprises there.</li>
<li>I saw an impressive demo of <a href="http://www.elasticsearch.org/">elasticsearch</a> (distributed <span class="caps">SOLR</span>), combined with <a href="http://logstash.net/">logstash</a> (which we are now using) and web-based querying tool - <a href="http://kibana.org/">kibana</a>.  See <a href="http://demo.kibana.org">demo.kibana.com</a> and this <a href="http://spredzy.wordpress.com/2013/01/25/powerful-analysis-tool-using-logstash-elasticsearch-kibana/">writeup</a> and <a href="http://www.youtube.com/watch?feature=player_embedded&amp;v=lFGghofKfyM%23">video</a> to see how this is used to query the twitter firehose.  It's interesting to think about the different kinds of data that resemble log formats, and can be coaxed into this style of analysis.</li>
<li><a href="http://incubator.apache.org/drill/">Apache Drill</a>, a <span class="caps">FOSS </span>implementation of Google's Dremel, for using sql to query multiple data stores, including nosql ones. The speaker quipped that the apache foundation is borrowing its roadmap from Google's whitepapers.</li>
<li><a href="https://datanitro.com/">DataNitro</a> - I thought this was super cool, even though its not open (though it is gratis for students) and windows-only.  Basically treats excel as a front-end client (or, the View in an <span class="caps">MVC </span>system) for interacting with server-side python, and includes a python interpreter inside of excel for manipulating data.  Looked really powerful for teaching, with plenty of <a href="http://ipython.org/">IPython</a> overlap, but has a pretty well defined niche. The author hopes that tools like these might do a better job with provenance, and prevent data disasters like the <a href="http://www.nytimes.com/2013/04/19/opinion/krugman-the-excel-depression.html?_r=0">Reinhart &amp; Rogoff depression</a>.</li>
<li><a href="https://github.com/spotify/luigi">Luigi</a> - (<a href="http://vimeo.com/63435580">pycon talk</a>) is a tool  "for batch data processing including dependency resolution and monitoring". It will  be interesting to compare this to <span class="caps">CCNMTL'</span>s Wardenclyffe (soon to be released!), a web-based, workflow orchestration tool that we use for batch processing of videos, and more.</li>
<li><a href="https://chartbeat.com/">Chartbeat</a> a service that allows sites to track in minute detail where users are spending time on their pages. Their software sends data back to chartbeat every second to let them know how long you have spent on the page, and where you mouse is pointing.  An interesting finding is that once you eliminate users that leave a page right away, most users spend most of their time scrolled part-way down the page. </li>
<li>Finally, I saw a fascinating talk about how big data and predictive modeling were used in the Obama campaign to strategize their media buys - I am pretty sure some of this was covered in the press, but the presenters were part of the campaign and shared some juicy details (like, how they spent something like 400k on "set top box" data), Here is their <a href="http://prezi.com/29n_72lxyyh0/how-open-data-and-predictive-modeling-were-used-in-the-2012-obama-campaign/?utm_campaign=share&amp;utm_medium=copy">prezi presentation</a>. They claimed that these techniques resulted in the Obama campaign spending $100/TV min/voter less than the Romney campaign.</li>
</ul>



<p>Overall, this summit was a pretty interesting mixture of sectors and tools. It wasn't quite as technical as I was hoping, and the format prevented anyone from diving into the detail I was hoping for. I was also left wondering what kind of real value this kind of analytics is providing, but there were a few examples in marketing that demonstrated the payoff, and everyone in this room believes enough in these methods to invest reams of resources into finding out that answer. </p>
