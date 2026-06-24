# ExaminationStatusCode - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ExaminationStatusCode**

## CodeSystem: ExaminationStatusCode 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/CodeSystem/examinationstatuscode | *Version*:0.1.0 |
| Active as of 2026-06-24 | *Computable Name*:ExaminationStatusCodeCS |

 
Kodverk för undersökningsstatus (ExaminationStatusCodeEnum). Används i GetImagingOutcome. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ExaminationStatusCodeVS](ValueSet-examinationstatuscode-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "examinationstatuscode-cs",
  "url" : "https://fhir.inera.se/CodeSystem/examinationstatuscode",
  "version" : "0.1.0",
  "name" : "ExaminationStatusCodeCS",
  "title" : "ExaminationStatusCode",
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
  "description" : "Kodverk för undersökningsstatus (ExaminationStatusCodeEnum). Används i GetImagingOutcome.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 11,
  "concept" : [{
    "code" : "Initierad",
    "display" : "Initierad",
    "definition" : "Undersökning initierad"
  },
  {
    "code" : "Planerad",
    "display" : "Planerad (bevakad)",
    "definition" : "Undersökning planerad"
  },
  {
    "code" : "Tidbokad",
    "display" : "Tidbokad",
    "definition" : "Undersökning tidbokad"
  },
  {
    "code" : "Uppskjuten",
    "display" : "Uppskjuten",
    "definition" : "Undersökning uppskjuten"
  },
  {
    "code" : "Annullerad",
    "display" : "Annullerad",
    "definition" : "Undersökning annullerad"
  },
  {
    "code" : "Pagaende",
    "display" : "Pågående",
    "definition" : "Undersökning pågående"
  },
  {
    "code" : "Avvakta",
    "display" : "Avvakta",
    "definition" : "Undersökning avvakta"
  },
  {
    "code" : "Avbruten",
    "display" : "Avbruten",
    "definition" : "Undersökning avbruten"
  },
  {
    "code" : "Avklarad",
    "display" : "Avklarad",
    "definition" : "Undersökning avklarad"
  },
  {
    "code" : "Inaktuell",
    "display" : "Inaktuell",
    "definition" : "Undersökning inaktuell"
  },
  {
    "code" : "Makulerad",
    "display" : "Makulerad",
    "definition" : "Undersökning makulerad"
  }]
}

```
