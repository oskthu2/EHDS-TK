# NonReplaceable - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NonReplaceable**

## CodeSystem: NonReplaceable 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/CodeSystem/nonreplaceable-actoutcome | *Version*:0.1.0 |
| Active as of 2026-06-24 | *Computable Name*:NonReplaceableCS |

 
Kodverk för aktör som har angett att ett läkemedel inte är utbytbart i GetMedicationHistory (DispensationAuthorizationType). 

 This Code system is referenced in the content logical definition of the following value sets: 

* Detta CodeSystem används inte här; det kan användas på andra ställen (t.ex. specifikationer och/eller implementationer som använder detta innehåll)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "nonreplaceable-cs",
  "url" : "https://fhir.inera.se/CodeSystem/nonreplaceable-actoutcome",
  "version" : "0.1.0",
  "name" : "NonReplaceableCS",
  "title" : "NonReplaceable",
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
  "description" : "Kodverk för aktör som har angett att ett läkemedel inte är utbytbart i GetMedicationHistory (DispensationAuthorizationType).",
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
    "code" : "Prescriber",
    "display" : "Förskrivare",
    "definition" : "Förskrivaren har angett att läkemedlet inte är utbytbart"
  },
  {
    "code" : "Patient",
    "display" : "Patient",
    "definition" : "Patienten har begärt att läkemedlet inte ska bytas ut"
  }]
}

```
