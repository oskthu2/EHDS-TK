# ReferralOutcomeTypeCode - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ReferralOutcomeTypeCode**

## CodeSystem: ReferralOutcomeTypeCode 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/CodeSystem/referraloutcometypecode | *Version*:0.1.0 |
| Active as of 2026-06-24 | *Computable Name*:ReferralOutcomeTypeCodeCS |

 
Kodverk för typ av remissvar (ReferralOutcomeTypeCodeEnum). Används i GetReferralOutcome. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ReferralOutcomeTypeCodeVS](ValueSet-referraloutcometypecode-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "referraloutcometypecode-cs",
  "url" : "https://fhir.inera.se/CodeSystem/referraloutcometypecode",
  "version" : "0.1.0",
  "name" : "ReferralOutcomeTypeCodeCS",
  "title" : "ReferralOutcomeTypeCode",
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
  "description" : "Kodverk för typ av remissvar (ReferralOutcomeTypeCodeEnum). Används i GetReferralOutcome.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 2,
  "concept" : [{
    "code" : "SS",
    "display" : "Slutsvar på remissfråga",
    "definition" : "Slutsvar på remissfråga"
  },
  {
    "code" : "SR",
    "display" : "Svar på remissfråga",
    "definition" : "Svar på remissfråga"
  }]
}

```
