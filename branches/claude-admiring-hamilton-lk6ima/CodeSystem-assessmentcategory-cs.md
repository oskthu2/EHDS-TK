# AssessmentCategory - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **AssessmentCategory**

## CodeSystem: AssessmentCategory 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/clinicalprocess-healthcond-description/CodeSystem/assessmentcategory-cs | *Version*:0.1.0 |
| Active as of 2026-06-24 | *Computable Name*:AssessmentCategoryCS |

 
Bedömningskategori för funktionsstatus. Tillåtna värden är 'pad-pad' (PADL-bedömning) och 'fun-fun' (funktionsnedsättningsbedömning). Definierat i enum XSD v2.1 för domänen. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [AssessmentCategoryVS](ValueSet-assessmentcategory-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "assessmentcategory-cs",
  "url" : "https://fhir.inera.se/clinicalprocess-healthcond-description/CodeSystem/assessmentcategory-cs",
  "version" : "0.1.0",
  "name" : "AssessmentCategoryCS",
  "title" : "AssessmentCategory",
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
  "description" : "Bedömningskategori för funktionsstatus. Tillåtna värden är 'pad-pad' (PADL-bedömning) och 'fun-fun' (funktionsnedsättningsbedömning). Definierat i enum XSD v2.1 för domänen.",
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
    "code" : "pad-pad",
    "display" : "pad-pad",
    "definition" : "PADL-bedömning"
  },
  {
    "code" : "fun-fun",
    "display" : "fun-fun",
    "definition" : "Funktionsnedsättningsbedömning"
  }]
}

```
