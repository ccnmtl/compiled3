---
title: "Using Docker to Pilot a Drupal 7 to Wordpress Migration"
date: 2022-02-28
type: "post"
authors: ["dreher"]
tags: ["drupal", "wordpress", "docker", "mysql", "sustainability"]
lede: "Migrating content from one platform to another is never easy. With the
help of a popular plugin and some Docker know-how, a Drupal 7 site’s stories are
migrated to Wordpress posts."
poster: "poster-drupal-wordpress.jpg"
thumbnail: "thumbnail-drupal-wordpress.jpg"
socmediaimg: "socmediaimg-drupal-wordpress.jpg"
hiliteimg: "poster-drupal-wordpress.jpg"
poster_sourceurl: "https://unsplash.com/photos/5IHz5WhosQE"
poster_source: "Photo by Chris Lawton on Unsplash"
bookendanimal: "leaf"
---

## A Community Gift

Drupal 7 site maintainers received a pandemic-related gift last year when the
platform’s end of life
[was extended from November 2021 to November 2022](https://www.drupal.org/psa-2020-06-24).
The extra year was deeply appreciated. We dealt with five older Drupal 7 sites,
shutting a few down and flattening a few. But, one active site required a more
complex migration path.

## Introducing MyNy

[Mapping Yiddish New York](https://jewishstudiescolumbia.com/myny/) is a unique
assemblage of documentation about all aspects of Yiddish culture in New York:
from theater, film, literature and press, through music, record labels, humor,
and restaurants to organizations and institutions. In addition to mapping
particular sites, persons, and events, the website also features “digital
stories” &mdash; multimedia essays exploring the Yiddish history of New York
City.

The project is a working collaboration between the Yiddish Studies Program,
Columbia University Libraries, faculty partners.
[Dr. Agi Legutko](https://germanic.columbia.edu/content/agnieszka-legutko),
Lecturer in Yiddish in the Department of Germanic Studies, has overseen
undergraduate and graduate students in building the collection, connecting
humanities studies to the active development of a unique digital library.

The site was originally built in Drupal 5, then migrated to Drupal 7. Luckily,
the CTL and Prof. Legutko had already mapped out a long-term plan for Mapping
Yiddish New York. Prof. Legutko worked with Columbia Libraries to spin up a
WordPress site a few years ago, and all new content was created there. Our job
was to migrate about 70 multimedia essays from the Drupal 7 site to the
Wordpress site. 

## How to get from here to there

I spend some time researching and discussing possible solutions with my
colleague [Nick Buonincontri](https://compiled.ctl.columbia.edu/authors/buonincontri/),
our resident Drupal expert. The
[FP Drupal to Wordpress plugin](https://wordpress.org/plugins/fg-drupal-to-wp/#description)
looked promising and was free for migrating articles, stories, pages,
categories, tags and images. The premium version includes extra features, which
are well worth the price of ~$50, but not needed in our case.

I was concerned about migrating content into the existing site, which already
had a rich set of published articles. Would the old content fit into the new
templates? Would duplicate images overwrite each other? Would internal site
links be made relative or be properly translated to the new url? A rigorous
round of testing was in order. We devised the following plan to vet the
migration in a development sandbox, with Docker as a primary tool.

* Spin up a local Wordpress instance using
[Docker](https://docs.docker.com/samples/wordpress/).
* Import a site backup from the MyNy production Wordpress site into the local WP
instance.
* Install the FG Drupal-to-Wordpress plugin into the local WP instance.
* Spin up a local Mapping Yiddish New York instance using [our Docker
configuration](https://github.com/ccnmtl/drupal7_myny/blob/master/drupal-docker.
mk) with a production database backup.
* Point the local WP instance at the local MyNy instance.
* Kick off the migration.
* Export migrated content from the local Wordpress instance.
* Import into the production Wordpress instance.

## Devilish Docker Details

The FG plugin needs access to a secure, public endpoint to pull down media. My
locally running MyNy container at http://localhost:8080 would not work. Luckily,
I have access to a dev environment that is publicaly addressable. An alternative
would be to point the plugin to your production site for the migration.

The FG plugin needs direct access to the Drupal MySQL database instance. I had
no luck getting the plugin to “see” the MyNy database in its separate container.
Instead, I created and loaded a MyNy database within the WP MySQL container. I
then went through another dance to correctly identify that database to the
plugin. I finally thought to log into the running WP container and see how the
database was addressed. The answer was right there in wp-config.php. The
database “host” is the name specified in the docker-compose.yml file, i.e. `db`.

## Polishing

After these small bumps, I successfully drew the Drupal 7 “stories” into WP as
“posts,” with the media correctly referenced within the content. The local WP
export and the production WP import went smoothly.

There were a few loose ends to resolve, primarily around look and feel. Most of
the old content
[looked pretty good within the new WP templates](https://jewishstudiescolumbia.com/myny/arts/dybbuk-or-between-two- worlds-1948/).
Prof. Legutko worked with her graduate students to review and polish posts that
didn’t transfer as nicely.

We have two more Drupal 7 migrations ahead of us &mdash; one going to Hugo and
the other to Wordpress again. Wish us luck!
