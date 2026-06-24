# SexCode - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SexCode**

## CodeSystem: SexCode 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/CodeSystem/sexcode | *Version*:0.1.0 |
| Active as of 2026-06-24 | *Computable Name*:SexCodeCS |

 
Kodverk för kön (SexCodeEnum). Används i GetMaternityMedicalHistory för barnets kön. OBS: Överväg att använda HL7 AdministrativeGender istället. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [SexCodeVS](ValueSet-sexcode-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "sexcode-cs",
  "url" : "https://fhir.inera.se/CodeSystem/sexcode",
  "version" : "0.1.0",
  "name" : "SexCodeCS",
  "title" : "SexCode",
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
  "description" : "Kodverk för kön (SexCodeEnum). Används i GetMaternityMedicalHistory för barnets kön. OBS: Överväg att använda HL7 AdministrativeGender istället.",
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
    "display" : "Okänt",
    "definition" : "Kön okänt"
  },
  {
    "code" : "1",
    "display" : "Man",
    "definition" : "Man"
  },
  {
    "code" : "2",
    "display" : "Kvinna",
    "definition" : "Kvinna"
  },
  {
    "code" : "9",
    "display" : "Ej tillämpligt",
    "definition" : "Kön ej tillämpligt"
  }]
}

```
