#!/bin/bash

# BibTeX to HTML conversion script for Hugo website
# This script converts your BibTeX file to HTML and injects it into your publications page

# Check if bibtex2html is installed
if ! command -v bibtex2html &> /dev/null; then
    echo "Error: bibtex2html is not installed"
    echo "Install with: brew install bibtex2html (on macOS) or apt-get install bibtex2html (on Ubuntu)"
    exit 1
fi

# Paths
BIBTEX_FILE="static/files/publications.bib"
TEMP_HTML="temp_publications.html"
PUBLICATIONS_MD="content/publications.md"

echo "Converting BibTeX to HTML..."

# Convert BibTeX to HTML with custom styling
bibtex2html -nf url "URL" -nf doi "DOI" -nf pdf "PDF" \
    -o temp_publications \
    -nodoc -nobibsource -nokeys -nokeywords \
    -dl -revchrono -nofooter \
    "$BIBTEX_FILE"

# Extract just the publication list from generated HTML
sed -n '/<dl>/,/<\/dl>/p' temp_publications.html > publications_list.html

# Create the updated publications.md with embedded HTML
cat > "$PUBLICATIONS_MD" << 'EOF'
---
title: "Publications"
description: "My scholarly publications and contributions"
menu:
  main:
    weight: 30
---

## Publications

<!-- Auto-generated from static/files/publications.bib -->
<!-- Last updated: $(date) -->

EOF

# Append the HTML content
cat publications_list.html >> "$PUBLICATIONS_MD"

# Add footer
cat >> "$PUBLICATIONS_MD" << 'EOF'

## Presentations

### Invited Talks

- Add your invited talks here manually or create separate BibTeX entries

### Conference Presentations

- Add your conference presentations here

---

*For the most up-to-date list of publications, please see my [Google Scholar profile](https://scholar.google.com/citations?user=YOURPROFILE) or [ORCID](https://orcid.org/YOUR-ORCID-ID).*
EOF

# Clean up temporary files
rm -f temp_publications.html temp_publications_bib.html publications_list.html

echo "Publications page updated successfully!"
echo "Run 'hugo server' to preview your site"