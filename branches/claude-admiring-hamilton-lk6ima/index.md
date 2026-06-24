# Introduction - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* **Introduction**

## Introduction

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/ImplementationGuide/inera.ehds.tk | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSTK |

# Introduktion

### Domän

Denna Implementation Guide (IG) beskriver den FHIR-funktionalitet som krävs för att informationsförsörja **NPÖ** (Nationell patientöversikt) och **1177 Journal** via Ineras RIVTA-tjänstekontrakt. IG:t definierar FHIR-profiler, logiska modeller och mappningar för 16 tjänstekontrakt fördelade på 6 FHIR-grupper.

-------

### Omfång

IG:t täcker följande FHIR-grupper och tjänstekontrakt:

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| Patientöversikt | Diagnos | GetDiagnosis | Ja (2.0) | Ja (2.0) |
| Patientöversikt | Uppmärksamhetsinformation | GetAlertInformation | Ja (2.0, 3.0) | Ja (2.0, 3.0) |
| Patientöversikt | Läkemedel | GetMedicationHistory | Ja (2.2) | Ja (2.2) |
| Patientöversikt | Vaccinationer | GetVaccinationHistory | Ja (2.0) | Ja (1.0, 2.0) |
| Patientöversikt | Funktionstillstånd och ADL | GetFunctionalStatus | Ja (2.0) | Ja (2.0) |
| Patientöversikt | Mödravård | GetMaternityMedicalHistory | Ja (2.0) | Ja (2.0) |
| Patientöversikt | Vårdplan | GetCarePlans | Ja (2.0) | Ja (2.0) |
| Patientöversikt | Vårdkontakter | GetCareContacts | Ja (2.0, 3.0) | Ja (2.0, 3.0) |
| Patientöversikt | Anteckningar | GetCareDocumentation | Ja (2.1, 3.0) | Ja (2.1, 3.0) |
| Laboratorie och diagnostik | Provsvar | GetLaboratoryOrderOutcome | Ja (3.1, 4.1) | Ja (3.1, 4.2) |
| Bilddiagnostik | Bilddiagnostik | GetImagingOutcome | Ja (1.0) | Ja (1.0) |
| Remiss och process | Konsultationsremiss | GetReferralOutcome | Ja (3.1) | Ja (3.1) |
| Remiss och process | Remisstatus | GetRequestActivities | Ja (2.0) | Ja (1.0, 2.0) |
| Tillväxtkurva barn | Tillväxtkurva | GetObservations | Ja (1.2) | Ja (1.2) |
| Logg | Åtkomstloggar | GetAccessLogForPatient | Nej | Ja (1.1, 2.0) |

IG:t täcker **inte** tjänstekontrakt utanför ovanstående tabell, och avser inte att ersätta källsystemen eller specificera gränssnittet mot NPÖ/1177 Journal på transaktionsnivå.

-------

### Syfte

Syftet med IG:t är att:

1. Definiera FHIR-profiler (R4) som möjliggör EHDS-kompatibel representation av data från Ineras RIVTA-tjänstekontrakt
1. Dokumentera mappningen från RIVTA-element till FHIR-element, inklusive OID→URI-översättning, Provenance-mönster och Sparr-hantering
1. Stödja implementörer som transformerar RIVTA-svar till FHIR-resurser för NPÖ och 1177 Journal

IG:t riktar sig till systemleverantörer, arkitekter och integrationsspecialister inom svensk e-hälsa.

-------

### Arkitektur och EHDS-relation

Profilerna bygger på:

* **IPS (International Patient Summary)** – profiler ärvs där de finns
* **EU EPS (European Patient Summary)** – obligations-profilen sätts i `meta.profile` vid runtime
* **HL7 Sweden basprofiler** – SEBasePractitionerRole och SEBaseOrganization används för personreferenser

Varje producerad FHIR-resurs bär **två profiler** i `meta.profile`:

1. Aktuell EHDS-TK-profil (t.ex.`IneraEHDSConditionDiagnosis`)
1. Relevant EU EPS obligations-profil

-------

### Terminologi

Alla kodverk och värdemängder som Inera förvaltar finns på [Inera Terminologitjänst](https://www.inera.se/tjanster/alla-tjanster-a-o/terminologitjanst-for-nationell-e-halsa/).

-------

### Beroenden

Denna IG har beroenden till:

* **HL7 IPS:** `hl7.fhir.uv.ips`
* **EU EPS:** `hl7.fhir.eu.eps`
* **SE-core (HL7 Sweden):** `hl7se.fhir.base`

-------

### Dokumentation

Mer information om Inera Core och RIVTA finns på [Inera Core](https://www.inera.se/tjanster/alla-tjanster-a-o/inera-core/).

-------

### Förvaltning och vägledning

FHIR-profilerna förvaltas av Inera: [Källkod](https://github.com/oskthu2/ehds-tk).

Beskrivning av krav på konformans och vägledning för Ineras FHIR-IGs finns på [Inera FHIR-landningssida](https://www.inera.se/fhir).



## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "inera.ehds.tk",
  "url" : "https://fhir.inera.se/ig/ehds-tk/ImplementationGuide/inera.ehds.tk",
  "version" : "0.1.0",
  "name" : "IneraEHDSTK",
  "title" : "Inera EHDS Tjänstekontrakt – FHIR Implementation Guide",
  "status" : "draft",
  "date" : "2026-06-24T12:10:33+00:00",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "FHIR IG som beskriver hur Ineras RIVTA-tjänstekontrakt mappas till FHIR för att informationsförsörja NPÖ och 1177 Journal.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "packageId" : "inera.ehds.tk",
  "license" : "CC0-1.0",
  "fhirVersion" : ["4.0.1"],
  "dependsOn" : [{
    "id" : "hl7tx",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
    }],
    "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
    "packageId" : "hl7.terminology.r4",
    "version" : "7.2.0"
  },
  {
    "id" : "hl7ext",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
    }],
    "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
    "packageId" : "hl7.fhir.uv.extensions.r4",
    "version" : "5.3.0"
  },
  {
    "id" : "hl7_fhir_uv_ips",
    "uri" : "http://hl7.org/fhir/uv/ips/ImplementationGuide/hl7.fhir.uv.ips",
    "packageId" : "hl7.fhir.uv.ips",
    "version" : "1.1.0"
  },
  {
    "id" : "hl7_fhir_eu_eps",
    "uri" : "http://hl7.eu/fhir/eps/ImplementationGuide/hl7.fhir.eu.eps",
    "packageId" : "hl7.fhir.eu.eps",
    "version" : "current"
  }],
  "definition" : {
    "extension" : [{
      "extension" : [{
        "url" : "code",
        "valueString" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2024+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "show-inherited-invariants"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "usage-stats-opt-out"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "https://fhir.inera.se/ig/ehds-tk/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
      "valueCode" : "hl7.fhir.uv.tools.r4#1.1.2"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2024+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "show-inherited-invariants"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "usage-stats-opt-out"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "https://fhir.inera.se/ig/ehds-tk/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    }],
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/alert-degree-of-severity"
      },
      "name" : "Allvarlighetsgrad för överkänslighet",
      "description" : "Bedömning av överkänslighetens allvarlighetsgrad (alertInformationBody.hypersensitivity.degreeOfSeverity). KV Allvarlighetsgrad 1.2.752.129.2.2.3.3.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/assessmentcategory-cs"
      },
      "name" : "AssessmentCategory",
      "description" : "Bedömningskategori för funktionsstatus. Tillåtna värden är 'pad-pad' (PADL-bedömning) och 'fun-fun' (funktionsnedsättningsbedömning). Definierat i enum XSD v2.1 för domänen.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/assessmentcategory-vs"
      },
      "name" : "AssessmentCategory — ValueSet",
      "description" : "Tillåtna värden för fältet assessmentCategory i GetFunctionalStatus.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/alert-treatment-description"
      },
      "name" : "Behandlingsbeskrivning",
      "description" : "Beskrivning av allvarlig behandling som patienten genomgår (alertInformationBody.treatment.treatmentDescription). Behandlingskod läggs i Flag.code.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/alert-ascertained-date"
      },
      "name" : "Datum för konstaterande",
      "description" : "Datum då förhållandet som föranledde uppmärksamhetssignalen konstaterades (alertInformationBody.ascertainedDate).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/deliverycode-cs"
      },
      "name" : "DeliveryCode",
      "description" : "Kodverk för förlossningssätt (DeliveryCodeEnum). Används i GetMaternityMedicalHistory.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/deliverycode-vs"
      },
      "name" : "DeliveryCode — ValueSet",
      "description" : "Tillåtna värden för förlossningssätt i GetMaternityMedicalHistory.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/diagnosistype-cs"
      },
      "name" : "DiagnosisType",
      "description" : "Kodverk för typ av diagnos (huvud- respektive bidiagnos). Definierat i XSD för domänen.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/diagnosistype-vs"
      },
      "name" : "DiagnosisType — ValueSet",
      "description" : "Tillåtna värden för fältet typeOfDiagnosis i GetDiagnosis.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/errorcode-cs"
      },
      "name" : "ErrorCode",
      "description" : "Kodverk för felkoder i svar från tjänstekontrakten i domänen clinicalprocess:activityprescription:actoutcome.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/errorcode-vs"
      },
      "name" : "ErrorCode — ValueSet",
      "description" : "Tillåtna värden för errorCode i svar.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/examinationstatuscode-cs"
      },
      "name" : "ExaminationStatusCode",
      "description" : "Kodverk för undersökningsstatus (ExaminationStatusCodeEnum). Används i GetImagingOutcome.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/examinationstatuscode-vs"
      },
      "name" : "ExaminationStatusCode — ValueSet",
      "description" : "Tillåtna värden för examinationStatus i GetImagingOutcome.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/fetalpositioncode-cs"
      },
      "name" : "FetalPositionCode",
      "description" : "Kodverk för fosterläge (FetalPositionCodeEnum). Används i GetMaternityMedicalHistory.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/fetalpositioncode-vs"
      },
      "name" : "FetalPositionCode — ValueSet",
      "description" : "Tillåtna värden för fosterläge i GetMaternityMedicalHistory.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/immunization-is-dose-complete"
      },
      "name" : "Fullständig dos administrerad",
      "description" : "Anger om hela den ordinerade dosen administrerades (administrationRecord.isDoseComplete).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-lm-access-log"
      },
      "name" : "GetAccessLogForPatient",
      "description" : "Logisk modell för patientens åtkomstloggar hämtad via GetAccessLogForPatient (informationsecurity:auditing:log v1.1, 2.0). Krävs för 1177 Journal 1.1, 2.0 men ej för NPÖ.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-lm-alert-information"
      },
      "name" : "GetAlertInformation",
      "description" : "Logisk modell för tjänstekontraktet GetAlertInformation\n(RIV-TA urn:riv:clinicalprocess:healthcond:description:GetAlertInformationResponder:2).\nRepresenterar responsens informationsstruktur: uppmärksamhetsinformation för en patient,\nexempelvis överkänslighet mot läkemedel, allvarlig sjukdom, behandling, smittsam sjukdom,\nvårdbegränsning eller historisk varning.\n\nBody-strukturen är XOR – exakt en av hypersensitivity, seriousDisease, treatment,\ncommunicableDisease, restrictionOfCare, unstructuredAlertInformation ska anges per post.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-lm-care-contacts"
      },
      "name" : "GetCareContacts",
      "description" : "Logisk modell för tjänstekontraktet GetCareContacts\n(RIV-TA urn:riv:clinicalprocess:logistics:logistics:GetCareContacts:3).\nRepresenterar responsens informationsstruktur (GetCareContactsResponseType).\nEn lista med CareContactType returneras.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-lm-care-documentation"
      },
      "name" : "GetCareDocumentation",
      "description" : "Logisk modell för tjänstekontraktet GetCareDocumentation\n(RIV-TA urn:riv:clinicalprocess:healthcond:description:GetCareDocumentationResponder:3).\nRepresenterar responsens informationsstruktur: journalanteckningar för en patient.\nAnteckningstyper: utredning, åtgärd/behandling, sammanfattning, samordning, inskrivning,\nslutanteckning, anteckning utan fysiskt möte, slutenvårdsanteckning och besöksanteckning.\nMeddelandeformatet är kompatibelt med HL7 v3 CDA v2.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-lm-care-plans"
      },
      "name" : "GetCarePlans",
      "description" : "Logisk modell för tjänstekontraktet GetCarePlans\n(RIV-TA urn:riv:clinicalprocess:logistics:logistics:GetCarePlans:2).\nRepresenterar responsens informationsstruktur (GetCarePlansResponseType).\nEn lista med CarePlanType returneras, var och en med header- och body-element.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-lm-diagnosis"
      },
      "name" : "GetDiagnosis",
      "description" : "Logisk modell för tjänstekontraktet GetDiagnosis\n(RIV-TA urn:riv:clinicalprocess:healthcond:description:GetDiagnosisResponder:2).\nRepresenterar responsens informationsstruktur: registrerade diagnoser för en patient\ninklusive diagnoskod per ursprungligt diagnosticeringstillfälle.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-lm-functional-status"
      },
      "name" : "GetFunctionalStatus",
      "description" : "Logisk modell för tjänstekontraktet GetFunctionalStatus\n(RIV-TA urn:riv:clinicalprocess:healthcond:description:GetFunctionalStatusResponder:2).\nRepresenterar responsens informationsstruktur: dokumenterade bedömningar av\nfunktionsnedsättningar och/eller aktivitetsförmåga (PADL) för en patient.\nBedömningskategori styrs av assessmentCategory: 'pad-pad' (PADL) eller 'fun-fun' (funktionsnedsättning).\nEn tjänsteproducent måste använda samma värde för categorization i engagemangsindex som\nför assessmentCategory i svaret.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-lm-imaging-outcome"
      },
      "name" : "GetImagingOutcome",
      "description" : "Logisk modell för tjänstekontraktet GetImagingOutcome\n(RIV-TA urn:riv:clinicalprocess:healthcond:actoutcome:GetImagingOutcome:1).\nRepresenterar responsens informationsstruktur — bilddiagnostiska resultat\nför en patient. Baseras på NPÖ RIV 2.2.0-specifikation.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-lm-laboratory-order-outcome"
      },
      "name" : "GetLaboratoryOrderOutcome",
      "description" : "Logisk modell för tjänstekontraktet GetLaboratoryOrderOutcome\n(RIV-TA urn:riv:clinicalprocess:healthcond:actoutcome:GetLaboratoryOrderOutcome:4).\nRepresenterar responsens informationsstruktur — multidisciplinära laboratoriesvar\nför en patient.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-lm-maternity-medical-history"
      },
      "name" : "GetMaternityMedicalHistory",
      "description" : "Logisk modell för tjänstekontraktet GetMaternityMedicalHistory\n(RIV-TA urn:riv:clinicalprocess:healthcond:actoutcome:GetMaternityMedicalHistory:2).\nRepresenterar responsens informationsstruktur — mödravårdsjournal för en patient.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-lm-medication-history"
      },
      "name" : "GetMedicationHistory",
      "description" : "Logisk modell för tjänstekontraktet GetMedicationHistory\n(RIV-TA urn:riv:clinicalprocess:activityprescription:actoutcome:GetMedicationHistoryResponder:2).\nRepresenterar responsens informationsstruktur — läkemedelshistorik per patient.\n\nOBS: Kontraktet är tämligen omfattande. Se tillämpningsanvisningen\n(AB_clinicalprocess_activityprescription_actoutcome.docx) för implementationsdetaljer.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-lm-observations"
      },
      "name" : "GetObservations",
      "description" : "Logisk modell för tjänstekontraktet GetObservations\n(RIV-TA urn:riv:clinicalprocess:healthcond:basic:GetObservationsInteraction:2).\nRepresenterar responsens informationsstruktur — en samling observationer som\nmatchar sökkriterier i begäran, inklusive header-information.\nMeddelandemodellen från avsnitt 5.1 V-MIM — Observationer i TKB motsvarar\nen observation i svarsmeddelandet.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ConceptMap"
      }],
      "reference" : {
        "reference" : "ConceptMap/observation-status-map"
      },
      "name" : "GetObservations – observationStatus (SNOMED CT) → FHIR ObservationStatus",
      "description" : "Mappning från RIVTA GetObservations observationStatus-koder (SNOMED CT,\nurvals-id 56431000052106) till FHIR R4 ObservationStatus (OBS-003).\n\nKodsystem: SNOMED CT SE, OID 1.2.752.116.2.1.1 → URI http://snomed.info/sct.\nOm en okänd kod tas emot sätts status till 'unknown' och en OperationOutcome-varning\ngenereras av bryggan.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-lm-referral-outcome"
      },
      "name" : "GetReferralOutcome",
      "description" : "Logisk modell för tjänstekontraktet GetReferralOutcome\n(RIV-TA urn:riv:clinicalprocess:healthcond:actoutcome:GetReferralOutcome:3).\nRepresenterar responsens informationsstruktur — svar på konsultationsremiss\noch begäran om övertagande av vårdansvar. Meddelandeformatet är kompatibelt\nmed HL7v3 CDA v.2.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-lm-request-activities"
      },
      "name" : "GetRequestActivities",
      "description" : "Logisk modell för remisstatus och processaktiviteter hämtad via GetRequestActivities (crm:requeststatus v2.0).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:logical"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-lm-vaccination-history"
      },
      "name" : "GetVaccinationHistory",
      "description" : "Logisk modell för tjänstekontraktet GetVaccinationHistory\n(RIV-TA urn:riv:clinicalprocess:activityprescription:actoutcome:GetVaccinationHistoryResponder:2).\nRepresenterar responsens informationsstruktur — vaccinationsjournal per patient.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/approved-for-patient"
      },
      "name" : "Godkänd för patient",
      "description" : "Anger om information är godkänd för delning med patient (approvedForPatient, Regel 3).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/alert-asserter"
      },
      "name" : "Juridisk äkthetsintygsgivare för uppmärksamhetssignal",
      "description" : "HSA-id för juridisk äkthetsintygsgivare (alertInformationHeader.legalAuthenticator.legalAuthenticatorHSAId).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/immunization-legal-authenticator"
      },
      "name" : "Juridisk äkthetsintygsgivare för vaccination",
      "description" : "Signeringstidpunkt och HSA-id för juridisk äkthetsintygsgivare (vaccinationMedicalRecordHeader.legalAuthenticator).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/alert-restriction-of-care-comment"
      },
      "name" : "Kommentar om vårdbegränsning",
      "description" : "Information om uppmärksammat förhållande som inte avser överkänslighet, sjukdom eller behandling (alertInformationBody.restrictionOfCare.restrictionOfCareComment).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/alert-information-comment"
      },
      "name" : "Kommentar till uppmärksamhetssignal",
      "description" : "Kommentar angående uppmärksamhetssignalen (alertInformationBody.alertInformationComment).\nOm obsoleteComment är angivet konkateneras det med prefix 'Inaktiveringskommentar: {obsoleteComment}'.\nFör body = unstructuredAlertInformation: unstructuredAlertInformationContent läggs här.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/clinicaldocumentnotecode-cs"
      },
      "name" : "KV Anteckningstyp",
      "description" : "Kodverk för typ av journalanteckning enligt KV Anteckningstyp. OID: 1.2.752.129.2.2.2.11.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/clinicaldocumentnotecode-vs"
      },
      "name" : "KV Anteckningstyp — ValueSet",
      "description" : "Tillåtna värden för fältet clinicalDocumentNoteCode i GetCareDocumentation enligt KV Anteckningstyp (OID: 1.2.752.129.2.2.2.11).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/immunization-registration-device"
      },
      "name" : "Källsystem för vaccinationsregistrering",
      "description" : "Referens till den Device-resurs som beskriver källsystemet varifrån\nvaccinationsregistreringen härstammar\n(registrationRecord.sourceSystemName/productName/productVersion/sourceSystemContact).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/device-source-system-contact"
      },
      "name" : "Källsystemskontakt",
      "description" : "Ansvarig kontaktperson för källsystemet (registrationRecord.sourceSystemContact.actorId/actorName).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/alert-pharmaceutical-treatment"
      },
      "name" : "Läkemedel vid behandling",
      "description" : "Läkemedel som används vid uppmärksammad behandling, ATC-kod rekommenderas (alertInformationBody.treatment.pharmaceuticalTreatment). Lista med 0..* – ryms ej i Flag.code (1..1).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/alert-pharmaceutical-hypersensitivity"
      },
      "name" : "Läkemedelsöverkänslighet – substansdetaljer",
      "description" : "Kompletterande substansdetaljer för läkemedelsöverkänslighet\n(alertInformationBody.hypersensitivity.pharmaceuticalHypersensitivity).\nPrimär substans: atcSubstance → Flag.code.coding; nonATCSubstance → Flag.code.text.\nDenna extension bär kvarvarande detaljer: nonATCSubstanceComment och pharmaceuticalProductId.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/maternity-section"
      },
      "name" : "MaternityMedicalSection",
      "description" : "Diskriminatorkoder för de tre sektionerna i mödravårdsjournalen (GetMaternityMedicalHistory v2.0). Varje Observation-resurs som skapas ur ett maternityMedicalRecord sätter Observation.code till en av dessa koder.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/nonreplaceable-cs"
      },
      "name" : "NonReplaceable",
      "description" : "Kodverk för aktör som har angett att ett läkemedel inte är utbytbart i GetMedicationHistory (DispensationAuthorizationType).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/immunization-patient-postal-code"
      },
      "name" : "Patientens postnummer vid vaccination",
      "description" : "Patientens postnummer vid vaccinationstillfället (registrationRecord.patientPostalCode).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/prescriptionstatus-cs"
      },
      "name" : "PrescriptionStatus",
      "description" : "Kodverk för ordinationsstatus i GetMedicationHistory. Anger om en ordination är aktiv eller inaktiv.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/prescriptionstatus-vs"
      },
      "name" : "PrescriptionStatus — ValueSet",
      "description" : "Tillåtna värden för prescriptionStatus i GetMedicationHistory.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/referraloutcometypecode-cs"
      },
      "name" : "ReferralOutcomeTypeCode",
      "description" : "Kodverk för typ av remissvar (ReferralOutcomeTypeCodeEnum). Används i GetReferralOutcome.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/referraloutcometypecode-vs"
      },
      "name" : "ReferralOutcomeTypeCode — ValueSet",
      "description" : "Tillåtna värden för referralOutcomeTypeCode i GetReferralOutcome.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/related-alert-information"
      },
      "name" : "Relaterad uppmärksamhetssignal",
      "description" : "Information om samband med andra uppmärksamhetssignaler (alertInformationBody.relatedAlertInformation).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/resultcode-cs"
      },
      "name" : "ResultCode",
      "description" : "Kodverk för resultatkod i svar från tjänstekontrakten i domänen clinicalprocess:activityprescription:actoutcome.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/resultcode-vs"
      },
      "name" : "ResultCode — ValueSet",
      "description" : "Tillåtna värden för resultCode i svar.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-allergy-intolerance"
      },
      "name" : "SE EHDS AllergyIntolerance – Allergi/överkänslighet (GetAlertInformation)",
      "description" : "Sekundär profil för allergier och överkänslighet från GetAlertInformation.\n\nSkapas ENBART när alertInformationBody = hypersensitivity.\nDen tillhörande IneraEHDSFlag-resursen är alltid primär och pekar på denna\nresurs via Flag.extension[flag-detail] (standard R4-extension; R5: supportingInfo).\n\nPopuleras med klinisk information från hypersensitivity-blocket:\n- atcSubstance/hypersensitivityAgentCode → AllergyIntolerance.code\n- degreeOfSeverity → AllergyIntolerance.reaction.severity\n- degreeOfCertainty → AllergyIntolerance.verificationStatus (se ALERT-004)\n- ascertainedDate → AllergyIntolerance.onsetDateTime\n- alertInformationComment → AllergyIntolerance.note\n- pharmaceuticalProductId → AllergyIntolerance.reaction.substance.coding (NPL-id)\n\nTäcker NPÖ 2.0 och 1177 Journal 2.0.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-audit-event"
      },
      "name" : "SE EHDS AuditEvent – Åtkomstloggar (GetAccessLogForPatient)",
      "description" : "Profil för åtkomstloggar mappat från RIVTA-tjänstekontraktet GetAccessLogForPatient (informationsecurity:auditing:log v1.1, 2.0). Täcker 1177 Journal 1.1, 2.0. Krävs ej för NPÖ.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-care-plan"
      },
      "name" : "SE EHDS CarePlan – Vårdplan (GetCarePlans)",
      "description" : "Profil för vård- och omsorgsplaner mappat från RIVTA-tjänstekontraktet GetCarePlans (clinicalprocess:logistics:logistics v2.0). Täcker NPÖ 2.0 och 1177 Journal 2.0.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-condition-diagnosis"
      },
      "name" : "SE EHDS Condition – Diagnos (GetDiagnosis)",
      "description" : "Profil för diagnos/problem mappat från RIVTA-tjänstekontraktet GetDiagnosis (clinicalprocess:healthcond:description v2.0). Täcker NPÖ 2.0 och 1177 Journal 2.0.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-condition-functional"
      },
      "name" : "SE EHDS Condition – Funktionstillstånd och ADL (GetFunctionalStatus)",
      "description" : "Profil för funktionstillstånd och ADL-bedömningar mappat från RIVTA-tjänstekontraktet\nGetFunctionalStatus (clinicalprocess:healthcond:description v2.0).\nTäcker NPÖ 2.0 och 1177 Journal 2.0.\n\nTKBn har två bedömningskategorier: 'pad-pad' (PADL-bedömning) och 'fun-fun'\n(funktionsnedsättningsbedömning med ICF-kod). Condition.code mappas mot\nassessmentCategory (för PADL) eller disability.disabilityAssessment (ICF-kod).\nInget statusfält, tidperiod eller svårighetsgradfält finns i TKBn – dessa är härleddda.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-device"
      },
      "name" : "SE EHDS Device – Källsystem (GetVaccinationHistory registrationRecord)",
      "description" : "Profil för det källsystem som registrerat en vaccination i GetVaccinationHistory v2.0.\n\nRepresenterar vaccinationMedicalRecordBody.registrationRecord.sourceSystem*\noch sourceSystemContact. Refereras från IneraEHDSImmunization via\nextension[registrationDevice].\n\ndeviceName[systemName]  = sourceSystemName     (1..1, obligatorisk)\ndeviceName[productName] = sourceSystemProductName (0..1)\nversion                 = sourceSystemProductVersion (0..1)\nextension[sourceSystemContact] = sourceSystemContact.actorId/actorName (0..1)",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-diagnostic-report-imaging"
      },
      "name" : "SE EHDS DiagnosticReport – Bilddiagnostiskt utlåtande (GetImagingOutcome)",
      "description" : "Profil för bilddiagnostiska utlåtanden/fynd från GetImagingOutcome. Används tillsammans med IneraEHDSImagingStudy för att representera både undersökning och svar.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-diagnostic-report-referral"
      },
      "name" : "SE EHDS DiagnosticReport – Konsultationssvar (GetReferralOutcome)",
      "description" : "Profil för konsultationssvar (outcome) från GetReferralOutcome. Används tillsammans med IneraEHDSServiceRequestReferral.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-diagnostic-report-lab"
      },
      "name" : "SE EHDS DiagnosticReport – Provsvar (GetLaboratoryOrderOutcome)",
      "description" : "Profil för laboratorieresultat mappat från RIVTA-tjänstekontraktet GetLaboratoryOrderOutcome (clinicalprocess:healthcond:actoutcome v4.2). Täcker NPÖ v4.2 och 1177 Journal v4.2.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-document-reference"
      },
      "name" : "SE EHDS DocumentReference – Anteckningar (GetCareDocumentation)",
      "description" : "Profil för vårdanteckningar mappat från RIVTA-tjänstekontraktet GetCareDocumentation\n(clinicalprocess:healthcond:description v3.0). Täcker NPÖ 3.0 och 1177 Journal 3.0.\n\nAnvänder JoL-header v2.2 (ej PatientSummaryHeader): accessControlHeader för PDL,\nrecord för journaluppgift-metadata, author för dokumentationsansvarig,\nsignature för signeringsinformation.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-encounter"
      },
      "name" : "SE EHDS Encounter – Vårdkontakter (GetCareContacts)",
      "description" : "Profil för vårdkontakter mappat från RIVTA-tjänstekontraktet GetCareContacts (clinicalprocess:logistics:logistics v3.0). Täcker NPÖ 2.0, 3.0 och 1177 Journal 2.0, 3.0.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-flag"
      },
      "name" : "SE EHDS Flag – Uppmärksamhetsinformation (GetAlertInformation)",
      "description" : "Primär profil för ALL uppmärksamhetsinformation från GetAlertInformation\n(clinicalprocess:healthcond:description v2.0).\n\nVarje alertInformation-post ger alltid en Flag-resurs.\nOm typeOfAlertInformation anger allergi/överkänslighet (body = hypersensitivity)\nskapas dessutom en IneraEHDSAllergyIntolerance-resurs som pekas ut via\nextension[flag-detail] (standard R4-extension; kallas supportingInfo i R5).\n\nBody-strukturen är XOR: exakt en av hypersensitivity, seriousDisease, treatment,\ncommunicableDisease, restrictionOfCare, unstructuredAlertInformation anges per post.\n\nFlag.category[alertType]           = typeOfAlertInformation (obligatorisk).\nFlag.category[hypersensitivityType] = typeOfHypersensitivity (när body = hypersensitivity).\nFlag.code                           = den kliniska koden specifik för body-typen.\n\nTäcker NPÖ 2.0 och 1177 Journal 2.0.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-imaging-study"
      },
      "name" : "SE EHDS ImagingStudy – Bilddiagnostik (GetImagingOutcome)",
      "description" : "Profil för bilddiagnostiska undersökningar mappat från RIVTA-tjänstekontraktet GetImagingOutcome (clinicalprocess:healthcond:actoutcome v1.0). Täcker NPÖ 1.0 och 1177 Journal 1.0.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-immunization"
      },
      "name" : "SE EHDS Immunization – Vaccinationer (GetVaccinationHistory)",
      "description" : "Profil för vaccinationer mappat från RIVTA-tjänstekontraktet GetVaccinationHistory (clinicalprocess:activityprescription:actoutcome v2.0). Täcker NPÖ 2.0 och 1177 Journal 1.0, 2.0.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-medication-statement"
      },
      "name" : "SE EHDS MedicationStatement – Läkemedel (GetMedicationHistory)",
      "description" : "Profil för läkemedelsordinationer, förskrivningar och administrerade läkemedel mappat från RIVTA-tjänstekontraktet GetMedicationHistory (clinicalprocess:activityprescription:actoutcome v2.2). Täcker NPÖ 2.2 och 1177 Journal 2.2.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-observation-base"
      },
      "name" : "SE EHDS Observation Base – GetObservations",
      "description" : "Basprofil för alla observationer från GetObservations\n(clinicalprocess:healthcond:basic v2.0).\n\nProfilen fångar den generella TK-mappningen och används som förälder av\ndomänspecifika profiler (t.ex. IneraEHDSObservationGrowth för tillväxtkurva).\n\nNyckeldesignbeslut:\n- observationBody.observationValue är XOR-union av sju värdetyper (cv/pq/ivlpq/ts/ivlts/st/int).\n  Varje gren mappas till respektive FHIR value[x]-variant.\n- Om valueNegation=true utelämnas value[x] och dataAbsentReason sätts.\n- observationBody.time (ts/ivlts) → effective[x]; registrationTime → issued.\n- participation är polymorf (healthcareProfessional/patient/otherPerson/locationRole/resource/organisation).\n  Välj FHIR-element per deltagartyp (se mappningssida).\n- PDL-fält (Sparr) hanteras via Provenance och meta.security (se mappningssida).\n\nTäcker NPÖ 1.2 och 1177 Journal 1.2.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-observation-lab"
      },
      "name" : "SE EHDS Observation – Laboratoriesvar (GetLaboratoryOrderOutcome)",
      "description" : "Profil för enskilda laboratorieresultat/analyser mappat från GetLaboratoryOrderOutcome. Används i kombination med IneraEHDSDiagnosticReportLab.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-observation-maternity"
      },
      "name" : "SE EHDS Observation – Mödravård (GetMaternityMedicalHistory)",
      "description" : "Generisk profil för medicinsk historik inom mödravård mappat från RIVTA-tjänstekontraktet\nGetMaternityMedicalHistory (clinicalprocess:healthcond:actoutcome v2.0).\nTäcker NPÖ 2.0 och 1177 Journal 2.0.\n\nOBS: TKBn har tre separata sektioner (registrationRecord, pregnancyCheckupRecord,\npostDeliveryRecord) med egna sektionsspecifika fält. En Observation skapas per sektion\nmed Observation.code som diskriminator (se MAT-001 i mapping-issues). Fältnamnen\ni ^short nedan refererar till sektionsspecifika element – implementatören väljer rätt\nsektionselement baserat på Observation.code.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-observation-growth"
      },
      "name" : "SE EHDS Observation – Tillväxtkurva (GetObservations + IoÖ v3)",
      "description" : "Profil för tillväxtobservationer (längd, vikt, huvudomfång, beräknad\ngraviditetslängd) för barn och ungdom, baserad på:\n- GetObservations (clinicalprocess:healthcond:basic v2.0)\n- Interaktionsöverenskommelse Tillväxtkurva för barn och ungdom v3 (Inera, 2023-05-15)\n\nÄrver IneraEHDSObservationBase och lägger till:\n- code bunden till GrowthObservationTypeVS (IoÖ-specificerade SNOMED CT-koder)\n- value[x] begränsad till Quantity (pq-grenen; IoÖ anger alltid PQ-värden)\n- Enhet (UCUM) per mättyp: cm (längd/hC), kg (vikt), d (gestationslängd)\n- LOINC-kod-slice på code.coding för EHDS/EPS-interoperabilitet\n- category = vital-signs\n\nKodsystem för observationType.type: SNOMED CT SE, OID 1.2.752.116.2.1.1.\n\nTäcker NPÖ 1.2 och 1177 Journal 1.2.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-organization"
      },
      "name" : "SE EHDS Organization – Organisationsenhet",
      "description" : "Profil för organisationsenheter i EHDS-TK-mappningar (vårdenheter, juridiska vårdgivare m.fl.).\n\nIdentifier-slicen ger stöd för HSA-id och SMI-id (Folkhälsomyndighetens\nid för vaccinationsenheter i det nationella vaccinationsregistret).\nNamn, kontaktuppgifter och adress mappar fält som annars inte har plats\ni resurserna de refereras ifrån.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-patient"
      },
      "name" : "SE EHDS Patient",
      "description" : "Patientprofil för EHDS-TK IG. Ärver från IPS Patient och lägger till svenska identifierarslicar.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-provenance"
      },
      "name" : "SE EHDS Provenance",
      "description" : "Provenance-profil för EHDS-TK. Varje klinisk resurs åtföljs av en Provenance\nmed två agenter som speglar spärr-hierarkin enligt PDL:\n- custodian (yttre Sparr) — den juridiskt ansvariga vårdgivaren\n- author (inre Sparr) — den informationsägande vårdenheten\n\nOBS: Om den FHIR-server som tillhandahåller data själv hanterar åtkomstfiltrering\nbaserat på anropande vårdpersonals kontext eller patientens e-hälsotjänst, behöver\nProvenance-agenterna för spärr och `meta.security` för `approvedForPatient` inte\ninkluderas i svaret — filtreringen sker då redan på servernivå.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-service-request-referral"
      },
      "name" : "SE EHDS ServiceRequest – Konsultationsremiss (GetReferralOutcome)",
      "description" : "Profil för konsultationsremisser mappat från RIVTA-tjänstekontraktet GetReferralOutcome\n(clinicalprocess:healthcond:actoutcome v3.2). Täcker NPÖ 3.2 och 1177 Journal 3.2.\n\nNotera: GetReferralOutcome returnerar remissvaret, inte remissen i sig. Remissens\nmetadata finns under referralOutcomeBody.referral och är begränsad till id, orsak,\ntid och avsändare. Inget mottagarfält, prioritet, typ eller diagnos finns i TKBn\nför remissens del.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/inera-ehds-task"
      },
      "name" : "SE EHDS Task – Remisstatus (GetRequestActivities)",
      "description" : "Profil för remisstatus och processaktiviteter mappat från RIVTA-tjänstekontraktet GetRequestActivities (crm:requeststatus v2.0). Täcker NPÖ 2.0 och 1177 Journal 1.0, 2.0.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/se-observation-status-vs"
      },
      "name" : "SE Observation Status (SNOMED CT urval 56431000052106)",
      "description" : "Tillåtna statusvärden för GetObservations observationStatus.\nUrvals-id 56431000052106, SNOMED CT SE (OID 1.2.752.116.2.1.1).\nMappning till FHIR ObservationStatus via ConceptMap observation-status-map.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/sexcode-cs"
      },
      "name" : "SexCode",
      "description" : "Kodverk för kön (SexCodeEnum). Används i GetMaternityMedicalHistory för barnets kön. OBS: Överväg att använda HL7 AdministrativeGender istället.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/sexcode-vs"
      },
      "name" : "SexCode — ValueSet",
      "description" : "Tillåtna värden för kön i GetMaternityMedicalHistory.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/alert-asserted-date"
      },
      "name" : "Signeringstidpunkt för uppmärksamhetssignal",
      "description" : "Tidpunkt för signering av uppmärksamhetsinformation (alertInformationHeader.legalAuthenticator.signatureTime).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/alert-route-of-transmission"
      },
      "name" : "Smittväg",
      "description" : "Kod för hur sjukdomen smittar (alertInformationBody.communicableDisease.routeOfTransmission). KV Smittväg.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/alert-verified-time"
      },
      "name" : "Tidpunkt för verifiering",
      "description" : "Tidpunkt då uppmärksamhetssignalen verifierades i det lokala systemet (alertInformationBody.verifiedTime).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/growth-observation-type-vs"
      },
      "name" : "Tillväxtkurva – observationstyper (IoÖ Tillväxtkurva v3)",
      "description" : "SNOMED CT-koder för tillväxtmätningar enligt Interaktionsöverenskommelse\nTillväxtkurva för barn och ungdom v3 (Inera, 2023-05-15).\n\nAlla koder från kodsystemet SNOMED CT SE (OID 1.2.752.116.2.1.1).\n\nKoder:\n- 1153637007 | Kroppslängd | (primärkod för längd)\n- 50373000   | Mått på kroppslängd | (alternativkod för längd)\n- 248334005  | Längd i liggande | (bakåtkompatibel – ej för nyanslutning)\n- 27113001   | Kroppsvikt |\n- 363812007  | Huvudomfång |\n- 412726003  | Graviditetslängd vid födelse |",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/typeofcareplan-cs"
      },
      "name" : "TypeOfCarePlan",
      "description" : "Typ av vård- och omsorgsplan enligt clinicalprocess:logistics:logistics v3.0. Definierad i clinicalprocess_logistics_logistics_enum_3.0.xsd.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/typeofcareplan-vs"
      },
      "name" : "TypeOfCarePlan — ValueSet",
      "description" : "Tillåtna värden för typeOfCarePlan i GetCarePlans enligt clinicalprocess:logistics:logistics.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/typeofleavecode-cs"
      },
      "name" : "TypeOfLeaveCode",
      "description" : "Kodverk för typ av ledighet (TypeOfLeaveCodeEnum). Används i GetMaternityMedicalHistory.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/typeofleavecode-vs"
      },
      "name" : "TypeOfLeaveCode — ValueSet",
      "description" : "Tillåtna värden för typ av ledighet i GetMaternityMedicalHistory.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/typeofprescription-cs"
      },
      "name" : "TypeOfPrescription",
      "description" : "Kodverk för ordinationstyp i GetMedicationHistory. Anger om en ordination är en insättnings- eller utsättningsordination.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/typeofprescription-vs"
      },
      "name" : "TypeOfPrescription — ValueSet",
      "description" : "Tillåtna värden för typeOfPrescription i GetMedicationHistory.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/typeofresultcode-cs"
      },
      "name" : "TypeOfResultCode",
      "description" : "Kodverk för typ av resultat (TypeOfResultCodeEnum). Används i GetImagingOutcome och GetReferralOutcome.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/typeofresultcode-vs"
      },
      "name" : "TypeOfResultCode — ValueSet",
      "description" : "Tillåtna värden för typeOfResult i GetImagingOutcome.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/alert-degree-of-certainty"
      },
      "name" : "Visshet för överkänslighet",
      "description" : "Visshetsgrad för överkänsligheten (alertInformationBody.hypersensitivity.degreeOfCertainty). KV Visshetsgrad 1.2.752.129.2.2.3.11.",
      "exampleBoolean" : false
    }],
    "page" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
        "valueUrl" : "toc.html"
      }],
      "nameUrl" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "index.html"
        }],
        "nameUrl" : "index.html",
        "title" : "Introduction",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "workflow.html"
        }],
        "nameUrl" : "workflow.html",
        "title" : "Workflow",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "logical-models.html"
        }],
        "nameUrl" : "logical-models.html",
        "title" : "Logical Models",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "mappings.html"
        }],
        "nameUrl" : "mappings.html",
        "title" : "Mappings",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "mapping-getdiagnosis.html"
        }],
        "nameUrl" : "mapping-getdiagnosis.html",
        "title" : "GetDiagnosis – Diagnoser",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "mapping-getalertinformation.html"
        }],
        "nameUrl" : "mapping-getalertinformation.html",
        "title" : "GetAlertInformation – Uppmärksamhetsinformation",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "mapping-getmedicationhistory.html"
        }],
        "nameUrl" : "mapping-getmedicationhistory.html",
        "title" : "GetMedicationHistory – Läkemedel",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "mapping-getvaccinationhistory.html"
        }],
        "nameUrl" : "mapping-getvaccinationhistory.html",
        "title" : "GetVaccinationHistory – Vaccinationer",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "mapping-getfunctionalstatus.html"
        }],
        "nameUrl" : "mapping-getfunctionalstatus.html",
        "title" : "GetFunctionalStatus – Funktionstillstånd och ADL",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "mapping-getmaternitymedicalhistory.html"
        }],
        "nameUrl" : "mapping-getmaternitymedicalhistory.html",
        "title" : "GetMaternityMedicalHistory – Mödravård",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "mapping-getcareplans.html"
        }],
        "nameUrl" : "mapping-getcareplans.html",
        "title" : "GetCarePlans – Vårdplan",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "mapping-getcarecontacts.html"
        }],
        "nameUrl" : "mapping-getcarecontacts.html",
        "title" : "GetCareContacts – Vårdkontakter",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "mapping-getcaredocumentation.html"
        }],
        "nameUrl" : "mapping-getcaredocumentation.html",
        "title" : "GetCareDocumentation – Anteckningar",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "mapping-getlaboratoryorderoutcome.html"
        }],
        "nameUrl" : "mapping-getlaboratoryorderoutcome.html",
        "title" : "GetLaboratoryOrderOutcome – Provsvar",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "mapping-getimagingoutcome.html"
        }],
        "nameUrl" : "mapping-getimagingoutcome.html",
        "title" : "GetImagingOutcome – Bilddiagnostik",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "mapping-getreferraloutcome.html"
        }],
        "nameUrl" : "mapping-getreferraloutcome.html",
        "title" : "GetReferralOutcome – Remisser",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "mapping-getrequestactivities.html"
        }],
        "nameUrl" : "mapping-getrequestactivities.html",
        "title" : "GetRequestActivities – Remisstatus",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "mapping-getobservations.html"
        }],
        "nameUrl" : "mapping-getobservations.html",
        "title" : "GetObservations – Tillväxtkurva",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "mapping-getaccesslogforpatient.html"
        }],
        "nameUrl" : "mapping-getaccesslogforpatient.html",
        "title" : "GetAccessLogForPatient – Åtkomstloggar",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "search-parameters.html"
        }],
        "nameUrl" : "search-parameters.html",
        "title" : "Sökparametrar",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "mapping-issues.html"
        }],
        "nameUrl" : "mapping-issues.html",
        "title" : "Mappningsissues och Designbeslut",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "profiles.html"
        }],
        "nameUrl" : "profiles.html",
        "title" : "Profiles",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "terminology.html"
        }],
        "nameUrl" : "terminology.html",
        "title" : "Terminology",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "examples.html"
        }],
        "nameUrl" : "examples.html",
        "title" : "Examples",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "downloads.html"
        }],
        "nameUrl" : "downloads.html",
        "title" : "Downloads",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "version-history.html"
        }],
        "nameUrl" : "version-history.html",
        "title" : "Version History",
        "generation" : "markdown"
      }]
    },
    "parameter" : [{
      "code" : "path-resource",
      "value" : "input/capabilities"
    },
    {
      "code" : "path-resource",
      "value" : "input/examples"
    },
    {
      "code" : "path-resource",
      "value" : "input/extensions"
    },
    {
      "code" : "path-resource",
      "value" : "input/models"
    },
    {
      "code" : "path-resource",
      "value" : "input/operations"
    },
    {
      "code" : "path-resource",
      "value" : "input/profiles"
    },
    {
      "code" : "path-resource",
      "value" : "input/resources"
    },
    {
      "code" : "path-resource",
      "value" : "input/vocabulary"
    },
    {
      "code" : "path-resource",
      "value" : "input/maps"
    },
    {
      "code" : "path-resource",
      "value" : "input/testing"
    },
    {
      "code" : "path-resource",
      "value" : "input/history"
    },
    {
      "code" : "path-resource",
      "value" : "fsh-generated/resources"
    },
    {
      "code" : "path-pages",
      "value" : "template/config"
    },
    {
      "code" : "path-pages",
      "value" : "input/images"
    },
    {
      "code" : "path-tx-cache",
      "value" : "input-cache/txcache"
    }]
  }
}

```
