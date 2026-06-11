# AGENTS.md — sead.org.uk website

## What this is
Static website for SEAD-Fund, a Scottish charity (education, environment, development).
Built with **Jerbil** (a Jekyll-like static site generator).

## Key structure
- `pages/` — Markdown/HTML source files (content lives here)
  - `pages/projects/` — one `.md` file per funded project
  - `pages/volunteer/` — volunteer pages
- `templates/` — shared HTML partials (`template.html`, `navbar.html`, `footer.html`, `project.html`, `project2.html`)
- `style/` — `main.less` + `gridbox.less` (compiled to `webroot/style/`)
- `webroot/` — compiled output (do not hand-edit; regenerate via Jerbil)
- `webroot/img/` — images referenced by pages

## Project page format (`pages/projects/*.md`)
```html
<section src='project2.html'>
name: Project Name
tagline: 
image: /img/projects/filename.jpg
location: Country, Region
organisation: Org Name

Body text here...
</section>
```

## Deployment
- Server: `aberdeen` 65.109.140.6, user `winterwell`
- GitHub Actions workflow (`jerbil-gh-pages.yml`) deploys on push to `main`
- Nginx config: `config/sead.org.uk.nginx`

## Editing tips
- Add a new project: create `pages/projects/YYYY-MM-slug.md` using the section format above, add image to `webroot/img/projects/`
- CSS changes: edit `style/main.less`, not the compiled CSS in `webroot/`
- The site uses Bootstrap 5.3 + Bootstrap Icons
