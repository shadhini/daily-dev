---
title: Jekyll
render_with_liquid: false
---

# Jekyll
[Jekyll Documentation](https://jekyllrb.com/docs/)

`static site generator` written in `Ruby`

---
## My Notes

- Jekyll Guide: [Jekyll Guide](https://github.com/shadhini/jekyll-tryouts/blob/main/jekyll-guide.md)
- Jekyll Quick Reference Guide: [Jekyll Quick Reference](https://github.com/shadhini/jekyll-tryouts/blob/main/jekyll-quick-reference-guide.md)
- Jekyll Reusable Templates in my Jekyll Tryouts Repo: [Jekyll Reusable Templates](https://github.com/shadhini/jekyll-tryouts/blob/main/jekyll-reusable-templates.md)

---

## Ecosystem & Tooling

- static site generator: `jekyll`
- dependency & plugin management: `Ruby` & `RubyGems`
  - `Gemfile` and `Bundler`
- input files:
 - `.md`, `.html`, `.yml`, `.json`
 - templates/tags in `liquid` --> `{{ }}`, `{% %}`
 - css/js/assets
- templating engine: `liquid`
 - Filters, Tags, Objects -- for dynamic content generation during build time
- markdown processor: `kramdown`
- syntax highlighter: `rouge`
- metadata in content files: `YAML front matter`
- js libraries:
  - `bootstrap`
  - copy to clipboard: `clipboard.js`
  - anchors: `anchor.js`
  - scrollspy: `bootstrap scrollspy`
  - responsive font sizes: `rfs`
  - syntax highlighting: `rouge pygments` themes
- toc: `allejo/jekyll-toc`
- styling: 
  - themes: pre-built themes --  gem-based or file-based
    - `bootswatch yeti` theme via `CDN`
  - css preprocessor: `sass`
  - icons: `bootstrap icons`
- plugins: 
  - `jekyll-seo-tag`, `jekyll-feed`, `jekyll-sitemap`, `jekyll-paginate`, ...
  - custom plugins
- deployment platforms:
  - `GitHub Pages` (default - in-built support)
  - `Netlify`, `Vercel`, `AWS S3/CloudFront`, `Firebase Hosting`, traditional web servers


## Jekyll Build Process
1. parse `.md` files and `liquid` templates
2. convert `.md` to `.html`
3. apply templates from `_layouts`
4. generate navigation or dynamic content
   - e.g: `{% for item in site.posts %}`
5. combine all parts into static **HTML** files


## Core Concepts

- **`SSG`: Static Site Generator**
  - Plain text files [`Markdown`, `HTML`, `Liquid templates`] --> Static HTML website
  - No live server-side processing
- **Ruby-based:**
  - uses `RubyGems` for installation and plugin management
- **Convention over Configuration:**
  - Directory structure, naming conventions
- **Templating Engine -- `Liquid`:**
  - Developed by Shopify, used for dynamic content insertion, loops, conditionals within templates.
- **Content Formats:**
  - `.md`, `.markdown`, `.html`
  - Other formats via plugins

## Key Features & Strengths

- **Simplicity:**
  - Easy to learn, Markdown-centric
- **Performance:**
  - Fast -- static site -- pre-rendered HTML, CSS, and JS
  - Cache/CDN friendly
- **Security:**
  - Reduced attack surface compared to dynamic sites 
    - no server-side code execution
    - no database vulnerabilities on the live site
- **Version Control Friendly:**
  - Git for entire site
- **Hosting Flexibility & Cost-Effectiveness:**
  - Wide options -- `GitHub Pages`, `Netlify`, `Vercel` ...
  - Low/no server maintenance cost
- **SEO-Friendly:**
  - Clean HTML -- crawlable by search engines
  - Full control over metadata and site structure
- **Extensibility:**
  - Plugins -- `Ruby gems` 
    - SEO tags, sitemaps, asset processing

## Architectural Considerations

- **Content Strategy:**
  - collections, posts, pages, data files
- **Build Times:**
  - Can be slow for very large sites
    - strategies: incremental builds, optimizing Liquid logic
- **Dynamic Functionality:**
  - Jekyll itself is static.
  - For dynamic features -- comments, forms, search
    - Third-party services -- `Disqus`, `Formspree`, `Algolia`
    - Client-side JavaScript
    - `"Jamstack"` approach -- APIs and serverless functions
- **Asset Pipeline:**
  - basic SASS/SCSS support
  - external tools (`Webpack`, `Parcel`) or plugins (`jekyll-assets`) for advanced -- complex asset processing (minification, transpilation)
- **Data Management:**
  - `_data` files -- `YAML`, `JSON`, `CSV`
- **Previewing Changes:**
  - Local development server -- `jekyll serve`
    - live reloading & previewing
- **Scalability (Content & Traffic):**
  - Excellent for traffic via CDNs
  - Content scalability depends on organization & build time
- **Headless CMS Integration:**
  - `Contentful`, `Forestry`, `Netlify CMS`

## Common Use Cases

- Blogs
- Documentation Sites: software projects, APIs, products 
- Portfolio Websites: personal/professional work
- Small Business Websites
- Personal Websites
- Landing Pages

## When is Jekyll a Good Fit?
- You want a fast, static site with automated deployment.
- You value version-controlled content (Markdown/HTML/data files).
- You want to leverage GitHub Pages for free hosting.
- You don’t need dynamic server-side features (or you can supplement with client-side JS).


## Limitations & When Not to Use

- **Highly Dynamic Sites:**
  - real-time updates, complex server-side logic 
  - instead use dynamic frameworks -- `Rails`, `Django`, `Node.js` 
- **Large E-commerce Sites:**
  - Frequent catalog/user changes
- **Sites Requiring User Authentication/Accounts directly on the platform:**
  - Requires third-party services
- **Teams Unfamiliar with Git/Markdown:**
  - Headless CMS can mitigate this

## Emerging Trends

- **Jamstack:**
  - Jekyll is a key player in the Jamstack ecosystem; combined with serverless functions & APIs 
- **Improved Developer Experience:** better tooling, streamlined development
- **Integration with Modern Frontend Tooling:** Patterns for use with JS frameworks

