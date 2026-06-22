# Changelog

All notable changes to this Implementation Guide are documented here.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
Versions follow [Semantic Versioning](https://semver.org/).
Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/) — this changelog is generated automatically by [release-please](https://github.com/googleapis/release-please).

## [0.4.0](https://github.com/oskthu2/EHDS-TK/compare/v0.3.1...v0.4.0) (2026-06-22)


### Features

* **vac:** sourceSystem-fält → SEEHDSDevice; komplettera Immunization-profil ([1256eb5](https://github.com/oskthu2/EHDS-TK/commit/1256eb5cff5abd8592d012ebf60078740f3fb98f))


### Bug Fixes

* **css:** WCAG 2.1/2.2 AA – tre kontrastfixar i inera.css ([7142171](https://github.com/oskthu2/EHDS-TK/commit/7142171c298c44091b1464c0e9ca4d40ccd662f1))

## [0.3.1](https://github.com/oskthu2/EHDS-TK/compare/v0.3.0...v0.3.1) (2026-06-18)


### Bug Fixes

* **logicalmodels:** återgå till uri för patientId.system (bygg-krasch) ([2ea5f0b](https://github.com/oskthu2/EHDS-TK/commit/2ea5f0bead1da47b92bbbacb256a7e484ee48fbb))


### Documentation

* **search-parameters:** omarbeta strategier för careUnit och careGiverId ([8426093](https://github.com/oskthu2/EHDS-TK/commit/84260931e8f8e4fbb0f61ef8969c8dbada586ec5))

## [0.3.0](https://github.com/oskthu2/EHDS-TK/compare/v0.2.0...v0.3.0) (2026-06-18)


### Features

* add SEEHDSObservationBase + update growth profile per IoÖ v3 ([98d2894](https://github.com/oskthu2/EHDS-TK/commit/98d28940d7ec9a63fdd115714713fd279488ca23))
* complete GetAlertInformation with full TKB body structure ([18a9ada](https://github.com/oskthu2/EHDS-TK/commit/18a9ada1e3fe1c60561df43457465bd0887cce8c))


### Bug Fixes

* **search-parameters:** korrigera careGiverId-mappning och lägg till SP-005 ([d3491eb](https://github.com/oskthu2/EHDS-TK/commit/d3491eb370bb3b360370a9672b44c539cbe5c972))


### Documentation

* **search-parameters:** sourceSystemHSAId ej tillämplig i FHIR-kontext ([c7df1e3](https://github.com/oskthu2/EHDS-TK/commit/c7df1e3e469ae085ead49ab04cf4107b1d3dcea9))

## [0.2.0](https://github.com/oskthu2/EHDS-TK/compare/v0.1.0...v0.2.0) (2026-06-17)


### Features

* add FHIR IG for NPÖ and 1177 Journal (inera.ehds.tk) ([9286191](https://github.com/oskthu2/EHDS-TK/commit/92861919c3151b08a729af01a85152ae35f6bdd2))

## [0.1.0] — Initial release

- Initial IG template structure with Inera branding
- Example `IneraPatient` profile with personnummer identifier slice
- GitHub Actions for SUSHI validation and IG Publisher deployment to GitHub Pages
- ig-registry integration via `package-list.json`
