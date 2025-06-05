---
title: Jekyll
render_with_liquid: false
---

# Jekyll

`static site generator` written in `Ruby`

- It transforms plain text files (Markdown, HTML, YAML, JSON) into a complete, static website.


## Jekyll Tech Stack

- static site generator: `jekyll`
- templating engine: `liquid`
- markdown processor: `kramdown`
- syntax highlighter: `rouge`
- site deployment: `github pages`
- js libraries:
    - `bootstrap`
    - copy to clipboard: `clipboard.js`
    - anchors: `anchor.js`
    - scrollspy: `bootstrap scrollspy`
    - responsive font sizes: `rfs`
    - syntax highlighting: `rouge pygments` themes
- toc: `allejo/jekyll-toc`
- styling: `bootswatch yeti` theme via `CDN`
    - css preprocessor: `sass`
    - icons: `bootstrap icons`


## Jekyll Build Process
1. parse `.md` files and `liquid` templates
2. convert `.md` to `.html`
3. apply templates from `_layouts`
4. generate navigation or dynamic content
    * e.g: `{% for item in site.posts %}`
5. combine all parts into static **HTML** files


## When is Jekyll a Good Fit?
- You want a fast, static site with automated deployment.
- You value version-controlled content (Markdown/HTML/data files).
- You want to leverage GitHub Pages for free hosting.
- You don’t need dynamic server-side features (or you can supplement with client-side JS).


## My Notes

- Jekyll Guide: [Jekyll Guide](https://github.com/shadhini/jekyll-tryouts/blob/main/jekyll-guide.md)
- Jekyll Quick Reference Guide: [Jekyll Quick Reference](https://github.com/shadhini/jekyll-tryouts/blob/main/jekyll-quick-reference-guide.md)
- Jekyll Reusable Templates in my Jekyll Tryouts Repo: [Jekyll Reusable Templates](https://github.com/shadhini/jekyll-tryouts/blob/main/jekyll-reusable-templates.md)