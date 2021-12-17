# compgen

This repository hosts the course website and slides for BIMS 8601 Foundations of Computational Genomics.

## Course information

Course information is populated from [_data/course_information.yaml](_data/course_information.yaml)

## Lecture information

The lecture table is populated from [_data/lectures.yaml](_data/lectures.yaml). Update that to make changes. You can add external links to a particular lecture by adding a new item under `links`, with a `url` and `title`.


## Slides

Slides are saved in the [slides](slides) folder. Each presentation is a single `html` file, which is served using [reveal.js](http://revealjs.com). You can write slides in markdown. For example, [slides/k-mer-analysis.html](slides/k-mer-analysis.html) is written in reveal markdown. You can also mix-and-match markdown and base reveal slides. The trick is: 1. use `layout: reveal_markdown` in the yaml frontmatter, and 2. the file extension should be `.html`, not `.md`... because otherwise jekyll will consume the markdown and convert it to HTML, but that's not what we want; we want it to stay as markdown for reveal to parse.

## Developing locally

If you want to render the page locally to develop slides, just clone the repository and serve it with:

```
jekyll serve
```
