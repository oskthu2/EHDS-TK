# TypeOfCarePlan - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **TypeOfCarePlan**

## CodeSystem: TypeOfCarePlan 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/CodeSystem/typeofcareplan-cs | *Version*:0.1.0 |
| Active as of 2026-06-24 | *Computable Name*:TypeOfCarePlanCS |

 
Typ av vård- och omsorgsplan enligt clinicalprocess:logistics:logistics v3.0. Definierad i clinicalprocess_logistics_logistics_enum_3.0.xsd. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [TypeOfCarePlanVS](ValueSet-typeofcareplan-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "typeofcareplan-cs",
  "url" : "https://fhir.inera.se/CodeSystem/typeofcareplan-cs",
  "version" : "0.1.0",
  "name" : "TypeOfCarePlanCS",
  "title" : "TypeOfCarePlan",
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
  "description" : "Typ av vård- och omsorgsplan enligt clinicalprocess:logistics:logistics v3.0. Definierad i clinicalprocess_logistics_logistics_enum_3.0.xsd.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "content" : "complete",
  "count" : 8,
  "concept" : [{
    "code" : "SIP",
    "display" : "SIP",
    "definition" : "Samordnad individuell plan"
  },
  {
    "code" : "SPLPTLRV",
    "display" : "SPLPTLRV",
    "definition" : "Samordnad plan enligt LPT och LRV"
  },
  {
    "code" : "SPU",
    "display" : "SPU",
    "definition" : "Samordnad plan vid utskrivning"
  },
  {
    "code" : "VP",
    "display" : "VP",
    "definition" : "Vårdplan"
  },
  {
    "code" : "HP",
    "display" : "HP",
    "definition" : "Habiliteringsplan"
  },
  {
    "code" : "RP",
    "display" : "RP",
    "definition" : "Rehabiliteringsplan"
  },
  {
    "code" : "GP",
    "display" : "GP",
    "definition" : "Genomförandeplan"
  },
  {
    "code" : "SVP",
    "display" : "SVP",
    "definition" : "Standardiserad vårdplan"
  }]
}

```
