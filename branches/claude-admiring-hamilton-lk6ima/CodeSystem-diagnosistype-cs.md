# DiagnosisType - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DiagnosisType**

## CodeSystem: DiagnosisType 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/clinicalprocess-healthcond-description/CodeSystem/diagnosistype-cs | *Version*:0.1.0 |
| Active as of 2026-06-24 | *Computable Name*:DiagnosisTypeCS |

 
Kodverk för typ av diagnos (huvud- respektive bidiagnos). Definierat i XSD för domänen. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [DiagnosisTypeVS](ValueSet-diagnosistype-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "diagnosistype-cs",
  "url" : "https://fhir.inera.se/clinicalprocess-healthcond-description/CodeSystem/diagnosistype-cs",
  "version" : "0.1.0",
  "name" : "DiagnosisTypeCS",
  "title" : "DiagnosisType",
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
  "description" : "Kodverk för typ av diagnos (huvud- respektive bidiagnos). Definierat i XSD för domänen.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "content" : "complete",
  "count" : 2,
  "concept" : [{
    "code" : "Huvuddiagnos",
    "display" : "Huvuddiagnos",
    "definition" : "Huvuddiagnos"
  },
  {
    "code" : "Bidiagnos",
    "display" : "Bidiagnos",
    "definition" : "Bidiagnos"
  }]
}

```
