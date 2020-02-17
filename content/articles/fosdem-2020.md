---
title: "FOSDEM 2020"
date: 2020-02-20
type: "post"
authors: ["nyby"]
tags: ["linux", "conference", "events"]
lede: "A summary of FOSDEM, the Free and Open source Software Developers' European Meeting."
shortlede: ""
poster: ""
thumbnail: ""
socmediaimg: ""
hiliteimg: ""
poster_sourceurl: ""
poster_source: ""
bookendanimal: ""
---

I attended [FOSDEM](https://fosdem.org/2020/) in Brussels on February
1st and 2nd, last weekend. The amount of people throughout the
[ULB](https://www.ulb.be/en) campus made the experience overwhelming,
but exciting. Around 8,000 people attend this conference, and there
are 30 different talks going on at any one time.

Even after reading the [How to survive FOSDEM](https://marcin.juszkiewicz.com.pl/2019/10/15/how-to-survive-fosdem/) guide before my trip, I
still felt under prepared when I got there.

In the K building there were two floors of booths for a bunch of Linux
distros and different software projects. The floors were packed wall
to wall with people, and the amount of knowledge, and energy, in these
rooms was really intimidating! At one end was a booth for [0 A.D.](https://play0ad.com/), a
strategy game I've never played but might try soon.

If I go again next year, I'm definitely going to prepare more, have
specific things I want to work on or find out about, and I'll also
know what to expect. In the closing keynote, it was mentioned that one
of the main draws of FOSDEM now is the devrooms, which is a whole
other aspect of the conference that I didn't explore. I'm not sure if
these are more hackathons or focused project-based talks, but if I
return next year I'll find out.

<a data-flickr-embed="true" href="https://www.flickr.com/photos/18873310@N00/49497132963/in/album-72157712999554782/" title="ULB J auditorium"><img class="img-fluid" src="https://live.staticflickr.com/65535/49497132963_b3ce255d3d.jpg" width="640" height="480" alt="ULB J auditorium"></a>

Here's an overview of some of the talks I took notes on, with links to
the recordings.

# [Over Twenty Years Of Automation](https://fosdem.org/2020/schedule/event/automation/) - James Shubin

The creator of [mgmtconfig](https://github.com/purpleidea/mgmt)
describes the history of configuration management.
He gives demos for many different systems,
including a simple shell scripting + ssh combo,
Puppet, Chef, Ansible, Docker, and others. He
doesn't mention Salt, but it seems really similar
to Ansible.  They're both based on Python and
YAML.

The future of config management? According to James, it's a
"choreography" model instead of
orchestration. Instead of a salt master, every
node would follow its own algorithm and know how
to take care of itself, while still being aware of
all nodes around it. The downside here is that
implementation, debugging, and everything, can be
more complicated.

He makes a point to note that docker and kubernetes are not
configuration management systems.

His own project, mgmtconfig, is like salt, but changes are updated
immediately instead of through a periodic highstate. He describes it
as "reactive".

# [Blender, Coming of Age](https://fosdem.org/2020/schedule/event/blender/) - Ton Roosendaal

This is a talk about the origins of the [Blender project](https://www.blender.org/), by its
founder. He goes through the whole history, from before Blender
existed in the 90s, to how they sustain their business now, with a
bunch of film and graphics demos demonstrating how advanced their
rendering systems have become.

<a data-flickr-embed="true" href="https://www.flickr.com/photos/18873310@N00/49497628951/in/album-72157712999554782/" title="Blender history - 1994"><img class="img-fluid" src="https://live.staticflickr.com/65535/49497628951_54e3aef238.jpg" width="640" height="480" alt="Blender history - 1994"></a>
<a data-flickr-embed="true" href="https://www.flickr.com/photos/18873310@N00/49497855657/in/album-72157712999554782/" title="Blender history - 1995-1997"><img class="img-fluid" src="https://live.staticflickr.com/65535/49497855657_affc7a9168.jpg" width="640" height="480" alt="Blender history - 1995-1997"></a>

# [The Hidden Early History of Unix](https://fosdem.org/2020/schedule/event/early_unix/) - Warner Losh

The speaker goes through the history of Unix and uncovers some nearly
forgotten details.

Columbia University was mentioned as the first university to receive
Unix from Bell Labs in the 1970s.

# [Generation Gaps](https://fosdem.org/2020/schedule/event/generation_gaps/) - Liam Proven

The speaker goes through the history of operating systems, how and
when we've seen fundamental changes. Software advancements have always
followed hardware changes, and usually when something about the
hardware is removed, or the computer "gets worse", or simpler.

"We now have computers based on 70s workstation technology ... You can
go with 40 years of accumulated baggage from the IBM PC (Windows 1),
or, you can go with Unix and have 50 years of accumulated baggage!" We
now have incredibly complex operating systems that no one really
understands. But hey, they get the job done, we've fixed most of the
bugs, and we'll just keep adding more and more fixes and incremental
improvements.

Liam thinks that the next major change in computing (i.e., the next
piece of hardware to be removed) is the hard drive. With new RAM
designs, we can design an operating system entirely in memory - no
disk swapping, no file systems. No need for boot loader, or even init
and shutdown scripts. Just turn the computer off, and turn it back on,
and it's running just as it left off, everything in memory. That could
really change how we think about software, and the role of the
operating system.

<img class="img-fluid" src="/img/assets/ibm-hd.jpg" width="640" height="480"
     alt="5MB IBM hard disk being delivered (1956)" />

In this talk, Liam mentions The Future of Programming, a talk by Bret
Victor in 2013, made from the perspective of 1973, complete with an
old-fashioned slide deck and a pocket protector.

# [HTTP/3 for everyone](https://fosdem.org/2020/schedule/event/http3/) - Daniel Stenberg

This talk was completely packed, in the main J auditorium. I'm not
sure why. The author of curl describes making a new, faster HTTP
protocol based on UDP instead of TCP.

<hr />

I saw some interesting talks, but there's at least as much info to dig
through in the video recordings for all the talks, here:
https://video.fosdem.org/2020/ (These are organized by room
number. The title/speaker info for each talk can be found
[here](https://review.video.fosdem.org/overview)).
These talks will all be available [here on YouTube](https://www.youtube.com/user/fosdemtalks)
eventually, but that's going to take a while.

Here are some talks that I missed, but I still want to watch, so I'm
making notes for myself.

## [The Linux Kernel: We have to finish this thing one day ;)](https://fosdem.org/2020/schedule/event/linux_kernel/) - Thorsten Leemhuis

I found the closing keynotes underwhelming, but I missed this opening
keynote - I had just arrived at ULB, was kind of lost, and the main
auditorium (J) was overflowing with people.

## [Reinventing Home Directories](https://fosdem.org/2020/schedule/event/rhdlp/) - Lennart Poettering

The systemd creator continues to cause controversy and annoy Unix
traditionalists. This talk, in a small classroom, was completely
overflowed with people, even outside the door, with both fans and
critics, waiting to talk to Lennart about his ideas. In this talk he
describes his latest idea, to handle home directories with systemd in
a more self-contained way: [systemd-homed](https://www.phoronix.com/scan.php?page=news_item&px=systemd-homed). The first thought that comes
to my mind is... why??? I'll just have to watch the talk.

## [Python](https://fosdem.org/2020/schedule/track/python/) and [JavaScript](https://fosdem.org/2020/schedule/track/javascript/) dev rooms

<hr />

And here are just some random photos from around the conference.

FOSDEM's special beer, with a Belgian beer Cuvée des Trolls.

<a data-flickr-embed="true" href="https://www.flickr.com/photos/18873310@N00/49497140988/in/album-72157712999554782/" title="FOSDEM's special beer, with a Belgian beer Cuvée des Trolls"><img class="img-fluid" src="https://live.staticflickr.com/65535/49497140988_a1deea174f.jpg" width="640" height="480" alt="FOSDEM's special beer, with a Belgian beer Cuvée des Trolls"></a>

<a data-flickr-embed="true" href="https://www.flickr.com/photos/18873310@N00/49497857672/in/album-72157712999554782/" title="FOSDEEM outdoor cafe"><img class="img-fluid" src="https://live.staticflickr.com/65535/49497857672_31ce3d2695.jpg" width="640" height="480" alt="FOSDEM outdoor cafe"></a>

And finally one of my favorite images from the weekend: people dressed
up as [VLC](https://www.videolan.org/vlc/index.html) logos. Nothing else could've made me feel more at home.

<a data-flickr-embed="true" href="https://www.flickr.com/photos/18873310@N00/49497859277/in/album-72157712999554782/" title="Attendees dressed up as VLC logos"><img class="img-fluid" src="https://live.staticflickr.com/65535/49497859277_73464c1de5.jpg" width="640" height="480" alt="Attendees dressed up as VLC logos"></a>