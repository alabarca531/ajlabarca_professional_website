# Anthony (AJ) La Barca - Hugo Website Template

This is a professional academic website template created with Hugo and the Paige theme.

## Structure

- **Home Page** (`content/_index.md`) - Main landing page with welcome message and navigation
- **Research Interests** (`content/research.md`) - Your research focus and current projects  
- **Biography** (`content/bio.md`) - Academic background and professional experience
- **Publications** (`content/publications.md`) - Complete list of scholarly publications
- **CV** (`content/cv.md`) - Complete curriculum vitae

## Navigation

The site includes a main navigation menu with the following tabs:
- Home
- Research  
- Bio
- Publications
- CV

## Customization

To customize this template for your use:

1. **Replace placeholder content** in all content files with your actual information
2. **Add your CV PDF** to `static/files/cv.pdf`
3. **Update contact information** in the CV page
4. **Customize the theme** by modifying `hugo.toml` as needed
5. **Add profile photo** to `static/images/` if desired

## Running the Site

To preview your site locally:

```bash
hugo server -D
```

To build the site for deployment:

```bash
hugo
```

The built site will be in the `public/` directory.

## Notes

- All content files use Markdown format
- The menu structure is defined in `hugo.toml`
- Static files (PDFs, images) go in the `static/` directory
- The Paige theme provides responsive, professional styling