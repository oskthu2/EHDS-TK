# FetalPositionCode - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **FetalPositionCode**

## CodeSystem: FetalPositionCode 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/CodeSystem/fetalpositioncode | *Version*:0.1.0 |
| Active as of 2026-06-24 | *Computable Name*:FetalPositionCodeCS |

 
Kodverk för fosterläge (FetalPositionCodeEnum). Används i GetMaternityMedicalHistory. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [FetalPositionCodeVS](ValueSet-fetalpositioncode-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "fetalpositioncode-cs",
  "url" : "https://fhir.inera.se/CodeSystem/fetalpositioncode",
  "version" : "0.1.0",
  "name" : "FetalPositionCodeCS",
  "title" : "FetalPositionCode",
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
  "description" : "Kodverk för fosterläge (FetalPositionCodeEnum). Används i GetMaternityMedicalHistory.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 4,
  "concept" : [{
    "code" : "0",
    "display" : "Huvudläge",
    "definition" : "Fostret ligger med huvudet nedåt"
  },
  {
    "code" : "1",
    "display" : "Sätesläge",
    "definition" : "Fostret ligger med sätet nedåt"
  },
  {
    "code" : "2",
    "display" : "Snedläge",
    "definition" : "Fostret ligger snett"
  },
  {
    "code" : "3",
    "display" : "Tvärläge",
    "definition" : "Fostret ligger tvärs"
  }]
}

```
