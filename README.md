# Inera FHIR Implementation Guide Template

[![Build and publish IG](https://github.com/Inera-AB/IneraFHIRTemplate/actions/workflows/publish.yml/badge.svg)](https://github.com/Inera-AB/IneraFHIRTemplate/actions/workflows/publish.yml)
[![Validate FSH](https://github.com/Inera-AB/IneraFHIRTemplate/actions/workflows/validate.yml/badge.svg)](https://github.com/Inera-AB/IneraFHIRTemplate/actions/workflows/validate.yml)
[![FHIR R4](https://img.shields.io/badge/FHIR-R4-blue)](https://hl7.org/fhir/R4/)
[![License: CC0-1.0](https://img.shields.io/badge/License-CC0_1.0-lightgrey.svg)](https://creativecommons.org/publicdomain/zero/1.0/)

This repository is a GitHub template for Inera FHIR Implementation Guides. It includes the standard IG structure, author guidance pages, an example FSH profile, and pre-configured GitHub Actions for validation and publishing.

---

## Inera branding

The template uses Inera's visual identity by default. All branding is isolated to four files:

| File | Vad den gör |
|------|------------|
| `input/includes/fragment-css.html` | Laddar Inera CSS och favicon |
| `input/includes/fragment-header.html` | Inera-logga i headern |
| `input/images/inera.css` | Alla Inera-färger, typsnitt och layout |
| `input/images/inera-*.svg / inera-*.png` | Loggor och favicon |

Ta bort dessa fyra filer (och mappen `input/images/inera-*`) för att gå tillbaka till standard HL7 FHIR-styling.

---

## Creating a new IG from this template

### 1. Create a new repository

Go to this repository on GitHub and click **"Use this template"** → **"Create a new repository"**.

- Choose the `inera-ab` organisation (or your own) as owner.
- Give the repository a name that reflects your IG, e.g. `inera-fhir-laboratory`.
- Set visibility to **Private** until the IG is ready for publication.
- Click **"Create repository"**.

> All files — including GitHub Actions workflows — are copied into the new repository.

### 2. Enable GitHub Pages

In the new repository, go to **Settings → Pages**.

- Under **Source**, select **"GitHub Actions"**.
- Save.

The IG will be published automatically at `https://inera-ab.github.io/<repo-name>/` the first time a push lands on `main`.

### 3. Configure the IG

Edit the following files to reflect your IG:

| File | What to update |
|------|---------------|
| `sushi-config.yaml` | `id`, `canonical`, `name`, `title`, `description`, `version` |
| `input/pagecontent/index.md` | Domain, Scope, Purpose, and the governance section |
| `input/pagecontent/version-history.md` | Initial version and date |

### 4. Replace template content

- Replace placeholder profiles in `input/fsh/profiles/` with your own.
- Replace or extend examples in `input/fsh/examples/`.
- Fill in the narrative pages in `input/pagecontent/`.

### 5. Develop on a branch

Create a feature branch for your work:

```bash
git checkout -b feature/my-first-profile
```

Every push to a non-main branch, and every pull request, triggers the **SUSHI validation** workflow. Fix any errors before merging.

### 6. Register the IG in ig-registry

Each Inera IG is tracked in [Inera-AB/ig-registry](https://github.com/Inera-AB/ig-registry). Do this once per IG, before the first publication.

**a)** Update `package-list.json` in this repo to reflect the correct `package-id`, `canonical`, and `path` (GitHub Pages URL) for your IG.

**b)** Add an entry for your IG to `fhir-ig-list.json` in `Inera-AB/ig-registry`:

```json
{
  "package-id": "inera.<domain>.<name>",
  "title": "Your IG Title",
  "canonical": "https://fhir.inera.se/ig/<name>",
  "category": "National Base",
  "language": "sv",
  "country": "SE",
  "package-list": "https://raw.githubusercontent.com/Inera-AB/<repo-name>/main/package-list.json"
}
```

Commit and push to `Inera-AB/ig-registry`. The registry now points to your IG's version history.

### 7. Publish a CI build

Merge your branch to `main`. The **Build and publish IG** workflow runs automatically:

1. SUSHI compiles FSH to FHIR JSON.
2. The HL7 FHIR IG Publisher builds the full HTML IG.
3. The output is deployed to GitHub Pages at `https://inera-ab.github.io/<repo-name>/`.

### 8. Publish a versioned release

When the IG is ready for a numbered release:

1. Update `sushi-config.yaml` — bump `version` and set `releaseLabel` (e.g. `draft`, `ballot`, `release`).
2. Update `input/pagecontent/version-history.md` with the new version and a change summary.
3. Merge to `main` and create a Git tag:

```bash
git tag v1.0.0
git push origin v1.0.0
```

The `publish.yml` workflow detects the tag, builds the IG, deploys it to GitHub Pages, and **automatically adds a versioned entry to `package-list.json`** so the release is visible in the registry.

For official registration with the global HL7 FHIR registry (tools.fhir.org), submit a PR to [FHIR/ig-registry](https://github.com/FHIR/ig-registry) with the same entry format as above.

---

## CI workflows

| Workflow | Trigger | What it does |
|----------|---------|--------------|
| `validate.yml` | Push to any branch except `main`; pull requests | Runs SUSHI and uploads the generated artefacts |
| `publish.yml` | Push to `main` or a version tag (`v*`); manual trigger | Runs SUSHI + IG Publisher, deploys to GitHub Pages; on tags also updates `package-list.json` |

---

## Local development

Install [SUSHI](https://fshschool.org/docs/sushi/installation/) and Java 17+, then:

```bash
# Compile FSH
sushi .

# Download the IG Publisher (first time)
mkdir -p input-cache
curl -sL https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar \
  -o input-cache/publisher.jar

# Build the IG
java -jar input-cache/publisher.jar -ig ig.ini

# Open the result
open output/index.html
```

---

## Repository structure

```
.github/workflows/
  validate.yml          Validate FSH on push / PR
  publish.yml           Build and deploy IG on push to main or version tag
package-list.json       IG version history — consumed by ig-registry
sushi-config.yaml       IG metadata, dependencies, pages and menu
ig.ini                  IG Publisher configuration
input/
  fsh/
    aliases.fsh         Shared FSH aliases
    profiles/           FHIR profile definitions (.fsh)
    examples/           Example instances (.fsh)
  pagecontent/          Narrative IG pages (.md)
  images/               Images and diagrams
  includes/menu.xml     Navigation menu
```

---

## Governance

This template is maintained by Inera AB. See the [Inera FHIR Landing Page](https://www.inera.se/fhir) for conformance requirements that apply to all Inera FHIR IGs.
