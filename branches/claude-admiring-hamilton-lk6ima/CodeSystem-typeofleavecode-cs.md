# TypeOfLeaveCode - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TypeOfLeaveCode**

## CodeSystem: TypeOfLeaveCode 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/CodeSystem/typeofleavecode | *Version*:0.1.0 |
| Active as of 2026-06-24 | *Computable Name*:TypeOfLeaveCodeCS |

 
Kodverk för typ av ledighet (TypeOfLeaveCodeEnum). Används i GetMaternityMedicalHistory. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [TypeOfLeaveCodeVS](ValueSet-typeofleavecode-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "typeofleavecode-cs",
  "url" : "https://fhir.inera.se/CodeSystem/typeofleavecode",
  "version" : "0.1.0",
  "name" : "TypeOfLeaveCodeCS",
  "title" : "TypeOfLeaveCode",
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
  "description" : "Kodverk för typ av ledighet (TypeOfLeaveCodeEnum). Används i GetMaternityMedicalHistory.",
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
    "code" : "0",
    "display" : "Sjukskrivning",
    "definition" : "Sjukskrivning under graviditet"
  },
  {
    "code" : "1",
    "display" : "Havandekapsledighet",
    "definition" : "Havandekapsledighet"
  },
  {
    "code" : "2",
    "display" : "Föräldrarledighet",
    "definition" : "Föräldrarledighet"
  }]
}

```
