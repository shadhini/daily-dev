# Adding a template project to Daily Dev 

1. Create the template project in a suitable subdirectory of the root directory.
2. After adding all necessary files, create a branch for the template project.
3. Remove any unnecessary files from this branch.
4. Update the README.md file in the root directory of the template project branch.
5. Release the template project branch.


# Maintaining the Tech Catalog

## Structure
```text
.
├── Gemfile: Ruby dependencies
├── _config.yml: Configuration file for Jekyll
├── _data: Data files for Jekyll
│       ├── navigation.yml: Navigation links for main menu bar
│       ├── technologies.yml: Data for technologies;
│       │     * Technologies list with list of
│       │          * corresponding topics (`topics`),
│       │          * similar technologies (`similar-technologies`),
│       │          * related technologies (`related-technologies`) and
│       │          * important links (`important`) for each technology
│       ├── topics.yml
│       │     * Topics list with list of
│       │          * related technologies (`technologies`),
│       │          * related topics (`related-topics`) and
│       │          * important links (`important`) for each topic
│       ├── tech-catalog-sidebar.yml: Sidebar navigation items for tech-catalog
│       ├── technologies-sidebar.yml: Sidebar navigation items for technologies
│       └── topics-sidebar.yml: Sidebar navigation items for topics
├── _includes
│       ├── docs-sidebar.html: Sidebar partial layout for documentation pages (technologies, topics, tech-catalog)
│       ├── footer.html: Footer partial layout
│       ├── head.html: Head with meta tags, stylesheets, scripts
│       ├── navigation.html: Navigation bar partial layout
│       ├── scripts.html: JavaScript scripts list
│       ├── stylesheet.html: Stylesheet list
│       ├── svg-icons.html: SVG icons list
│       ├── theme-toggler.html: Theme/color mode toggler partial layout
│       ├── toc.html: Table of contents generation liquid template
│       ├── technology-list-accordion.html: Technology list accordion layout for technologies page  
│       ├── technology-metadata.html: Tabular technology metadata generation liquid template for each technology page
│       ├── topic-list-accordion.html: Topic list accordion layout for topics page
│       └── topic-metadata.html: Tabular topic metadata generation liquid template for each topic page
├── _layouts
│       ├── base.html: Single Column Base layout for all pages
│       ├── default.html: Default layout - single columns
│       ├── doc.html: 3 column Documentation layout for technologies, topics, tech-catalog with sidebar and TOC
│       ├── landing-page.html: Landing page layout
│       ├── technology.html: Layout for each technology document
│       └── topic.html: Layout for each topic document
├── _sass
│       ├── _clipboard-js.scss: Styles for copy-to-clipboard button
│       ├── _custom.scss: Custom project styles
│       ├── _layout.scss: Layout styles
│       ├── _scrolling.scss: Prevents focus from landing behind the sticky header, when navigating with the keyboard
│       ├── _sidebar.scss: Sidebar styles
│       ├── _syntax-highlighting.scss: Code blocks syntax highlighting styles
│       ├── _toc.scss: Table of contents styles
│       ├── _variables.scss: Project variables; Has been extended from _variables.scss for the "Bootswatch Yeti" theme
│       ├── _mixins.scss: Import all mixins for project styles
│       ├── mixins: Mixins for project styles
│       │       ├── _border-radius.scss: Border radius mixins
│       │       ├── _breakpoints.scss: Layout breakpoints mixins
│       │       └── _color-mode.scss: Theme/color mode mixins
│       └── vendor
│           └── _rfs.scss: Responsive font size mixins
├── _technologies: Technologies collection: Each technology has a separate markdown file
│       └── jekyll.md
├── _topics: Topics collection: Each topic has a separate markdown file
│       └── static-site-generators.md
├── assets: Project assets
│       ├── css: Project styles
│       │       └── styles.scss: Main stylesheet that imports all style files required
│       ├── images: Project images
│       └── js: Project JavaScript
│           ├── copy-to-clipboard.js: JS for copy-to-clipboard button
│           └── theme.js: JS for theme/ color mode toggler
├── 404.html: Custom 404 page for 404 not found errors
├── index.md: Index page/ landing page
├── tech-catalog.md: Tech Catalog page
├── technologies.md: Technologies List page
├── topics.md: Topics List page
└── _site: Jekyll build output directory
```


## Add a New Technology
1. Add the new markdown file to the `_technologies` directory.
2. Add the following front matter to the new markdown file:
```yaml
---
title: <TECHNOLOGY_TITLE>
render_with_liquid: false
---
```
3. Update the `technologies.yml` file in the `_data` directory with the new technology details.
4. Update the `topics.yml` file in the `_data` directory if necessary.
5. Add new page entry to the `technologies-sidebar.yml` and `tech-catalog-sidebar.yml` files in the `_data` directory.

## Add a New Topic
1. Add the new markdown file to the `_topics` directory.
2. Add the following front matter to the new markdown file:
```yaml
---
title: <TOPIC_TITLE>
# if the file contains liquid tags/html content 
render_with_liquid: false 
---
```
3. Update the `topics.yml` file in the `_data` directory with the new topic details.
4. Update the `technologies.yml` file in the `_data` directory if necessary.
5. Add new page entry to the `topics-sidebar.yml` and `tech-catalog-sidebar.yml` files in the `_data` directory.