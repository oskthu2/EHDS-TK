# TypeOfResultCode - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TypeOfResultCode**

## CodeSystem: TypeOfResultCode 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/CodeSystem/typeofresultcode | *Version*:0.1.0 |
| Active as of 2026-06-24 | *Computable Name*:TypeOfResultCodeCS |

 
Kodverk för typ av resultat (TypeOfResultCodeEnum). Används i GetImagingOutcome och GetReferralOutcome. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [TypeOfResultCodeVS](ValueSet-typeofresultcode-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "typeofresultcode-cs",
  "url" : "https://fhir.inera.se/CodeSystem/typeofresultcode",
  "version" : "0.1.0",
  "name" : "TypeOfResultCodeCS",
  "title" : "TypeOfResultCode",
  "status" : "active",
  "date" : "2026-06-24T12:10:33+00:00",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Kodverk för typ av resultat (TypeOfResultCodeEnum). Används i GetImagingOutcome och GetReferralOutcome.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 3,
  "concept" : [{
    "code" : "PREL",
    "display" : "Preliminärsvar",
    "definition" : "Preliminärt svar"
  },
  {
    "code" : "DEF",
    "display" : "Definitivsvar",
    "definition" : "Definitivt svar"
  },
  {
    "code" : "TILL",
    "display" : "Tilläggssvar",
    "definition" : "Tilläggssvar"
  }]
}

```
