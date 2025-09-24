# BibTeX Integration Guide

This document explains how to integrate your BibTeX file with your Hugo website to automatically generate your publications list.

## Current Setup

- **BibTeX file location**: `/static/files/publications.bib`
- **Publications page**: `/content/publications.md`

## Integration Options

### Option 1: Academic Hugo Theme (Recommended)
The Academic Hugo theme has built-in BibTeX support:

1. Install the Academic theme
2. Place your `.bib` file in `/content/publication/`
3. Use the `{{< cite "citation-key" >}}` shortcode

### Option 2: Hugo Data Files + Custom Template
Convert BibTeX to YAML/JSON data files:

1. Convert your `.bib` file to `/data/publications.yaml`
2. Create a custom shortcode to render publications
3. Use Hugo's data templates to iterate through publications

### Option 3: JavaScript Client-Side Processing
Use bibtex-js library for client-side rendering:

1. Include bibtex-js library in your theme
2. Load your `.bib` file via JavaScript
3. Render publications dynamically on page load

### Option 4: Build-Time Processing
Use pandoc or bibtex2html during Hugo build:

1. Add build script to convert `.bib` to Markdown
2. Include generated Markdown in your publications page
3. Automate with Hugo's build hooks

## Implementation Steps (Option 2 - Recommended for Hugo)

1. **Convert BibTeX to YAML**:
   ```bash
   # Use pandoc or custom script to convert
   pandoc publications.bib -t markdown -o publications.md
   ```

2. **Create Hugo shortcode** (`layouts/shortcodes/publication.html`):
   ```html
   <div class="publication">
     <h4>{{ .Get "title" }}</h4>
     <p class="authors">{{ .Get "authors" }}</p>
     <p class="journal">{{ .Get "journal" }}, {{ .Get "year" }}</p>
     {{ if .Get "doi" }}<p class="doi">DOI: <a href="https://doi.org/{{ .Get "doi" }}">{{ .Get "doi" }}</a></p>{{ end }}
   </div>
   ```

3. **Use shortcode in publications.md**:
   ```markdown
   {{< publication title="Article Title" authors="Author, A." journal="Journal Name" year="2024" doi="10.1000/example" >}}
   ```

## Next Steps

1. Replace the placeholder content in `/content/publications.md`
2. Choose your preferred integration method
3. Implement the chosen solution
4. Test the automated publication generation

## Resources

- [Hugo Data Templates](https://gohugo.io/templates/data-templates/)
- [Academic Hugo Theme](https://github.com/wowchemy/starter-hugo-academic)
- [bibtex-js Library](https://github.com/pcooksey/bibtex-js)
- [Pandoc BibTeX Conversion](https://pandoc.org/MANUAL.html#citations)