# DeliveryCode - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DeliveryCode**

## CodeSystem: DeliveryCode 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/CodeSystem/deliverycode | *Version*:0.1.0 |
| Active as of 2026-06-24 | *Computable Name*:DeliveryCodeCS |

 
Kodverk för förlossningssätt (DeliveryCodeEnum). Används i GetMaternityMedicalHistory. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [DeliveryCodeVS](ValueSet-deliverycode-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "deliverycode-cs",
  "url" : "https://fhir.inera.se/CodeSystem/deliverycode",
  "version" : "0.1.0",
  "name" : "DeliveryCodeCS",
  "title" : "DeliveryCode",
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
  "description" : "Kodverk för förlossningssätt (DeliveryCodeEnum). Används i GetMaternityMedicalHistory.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 5,
  "concept" : [{
    "code" : "0",
    "display" : "Ej angivet",
    "definition" : "Förlossningssätt ej angivet"
  },
  {
    "code" : "1",
    "display" : "X-gravid",
    "definition" : "X-gravid"
  },
  {
    "code" : "2",
    "display" : "Spontan abort",
    "definition" : "Spontan abort"
  },
  {
    "code" : "4",
    "display" : "Dödfött",
    "definition" : "Dödfött barn"
  },
  {
    "code" : "5",
    "display" : "Levande fött",
    "definition" : "Levande fött barn"
  }]
}

```
