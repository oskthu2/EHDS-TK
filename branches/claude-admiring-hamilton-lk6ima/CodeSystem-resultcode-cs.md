# ResultCode - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ResultCode**

## CodeSystem: ResultCode 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/CodeSystem/resultcode-actoutcome | *Version*:0.1.0 |
| Active as of 2026-06-24 | *Computable Name*:ResultCodeCS |

 
Kodverk för resultatkod i svar från tjänstekontrakten i domänen clinicalprocess:activityprescription:actoutcome. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ResultCodeVS](ValueSet-resultcode-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "resultcode-cs",
  "url" : "https://fhir.inera.se/CodeSystem/resultcode-actoutcome",
  "version" : "0.1.0",
  "name" : "ResultCodeCS",
  "title" : "ResultCode",
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
  "description" : "Kodverk för resultatkod i svar från tjänstekontrakten i domänen clinicalprocess:activityprescription:actoutcome.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "content" : "complete",
  "count" : 3,
  "concept" : [{
    "code" : "OK",
    "display" : "OK",
    "definition" : "Begäran genomfördes utan fel"
  },
  {
    "code" : "INFO",
    "display" : "Info",
    "definition" : "Begäran genomfördes men med informationsmeddelande"
  },
  {
    "code" : "ERROR",
    "display" : "Fel",
    "definition" : "Begäran misslyckades med logiskt fel"
  }]
}

```
