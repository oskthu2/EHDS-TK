# MaternityMedicalSection - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MaternityMedicalSection**

## CodeSystem: MaternityMedicalSection 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/CodeSystem/maternity-section | *Version*:0.1.0 |
| Active as of 2026-06-24 | *Computable Name*:MaternityMedicalSectionCS |

 
Diskriminatorkoder för de tre sektionerna i mödravårdsjournalen (GetMaternityMedicalHistory v2.0). Varje Observation-resurs som skapas ur ett maternityMedicalRecord sätter Observation.code till en av dessa koder. 

 This Code system is referenced in the content logical definition of the following value sets: 

* Detta CodeSystem används inte här; det kan användas på andra ställen (t.ex. specifikationer och/eller implementationer som använder detta innehåll)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "maternity-section",
  "url" : "https://fhir.inera.se/ig/ehds-tk/CodeSystem/maternity-section",
  "version" : "0.1.0",
  "name" : "MaternityMedicalSectionCS",
  "title" : "MaternityMedicalSection",
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
  "description" : "Diskriminatorkoder för de tre sektionerna i mödravårdsjournalen (GetMaternityMedicalHistory v2.0). Varje Observation-resurs som skapas ur ett maternityMedicalRecord sätter Observation.code till en av dessa koder.",
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
    "code" : "registration",
    "display" : "Inskrivning mödravård",
    "definition" : "Inskrivningsuppgifter (maternityMedicalRecordBody.registrationRecord)"
  },
  {
    "code" : "checkup",
    "display" : "Graviditetskontroll",
    "definition" : "Graviditetskontrolldata (maternityMedicalRecordBody.pregnancyCheckupRecord)"
  },
  {
    "code" : "post-delivery",
    "display" : "Eftervård",
    "definition" : "Eftervårdsdata (maternityMedicalRecordBody.postDeliveryRecord)"
  }]
}

```
