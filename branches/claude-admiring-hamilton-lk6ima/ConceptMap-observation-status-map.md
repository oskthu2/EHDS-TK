# GetObservations – observationStatus (SNOMED CT) → FHIR ObservationStatus - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **GetObservations – observationStatus (SNOMED CT) → FHIR ObservationStatus**

## ConceptMap: GetObservations – observationStatus (SNOMED CT) → FHIR ObservationStatus 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ConceptMap/observation-status-map | *Version*:0.1.0 |
| Active as of 2025-01-01 | *Computable Name*:ObservationStatusMap |

 
Mappar SNOMED CT-koder från urvals-id 56431000052106 till FHIR ObservationStatus. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "observation-status-map",
  "url" : "https://fhir.inera.se/ConceptMap/observation-status-map",
  "version" : "0.1.0",
  "name" : "ObservationStatusMap",
  "title" : "GetObservations observationStatus → FHIR ObservationStatus",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-01-01",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Mappar SNOMED CT-koder från urvals-id 56431000052106 till FHIR ObservationStatus.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "sourceUri" : "http://snomed.info/sct",
  "targetUri" : "http://hl7.org/fhir/observation-status",
  "group" : [{
    "source" : "http://snomed.info/sct",
    "target" : "http://hl7.org/fhir/observation-status",
    "element" : [{
      "code" : "385676005",
      "display" : "Under utförande",
      "target" : [{
        "code" : "preliminary",
        "display" : "Preliminary",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "385651009",
      "display" : "Slutlig",
      "target" : [{
        "code" : "final",
        "display" : "Final",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "272393004",
      "display" : "Korrigerad",
      "target" : [{
        "code" : "amended",
        "display" : "Amended",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "59776000",
      "display" : "Avbeställd/annullerad",
      "target" : [{
        "code" : "cancelled",
        "display" : "Cancelled",
        "equivalence" : "equivalent",
        "comment" : "Avbeställd/annullerad – observationen utfördes aldrig"
      }]
    },
    {
      "code" : "444301002",
      "display" : "Avböjd av patient",
      "target" : [{
        "code" : "cancelled",
        "display" : "Cancelled",
        "equivalence" : "narrower",
        "comment" : "Avböjd av patient – semantiken specificeras med dataAbsentReason om värderelevant"
      }]
    }],
    "unmapped" : {
      "mode" : "fixed",
      "code" : "unknown",
      "display" : "Unknown"
    }
  }]
}

```
