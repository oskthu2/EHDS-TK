# SE Observation Status (SNOMED CT urval 56431000052106) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE Observation Status (SNOMED CT urval 56431000052106)**

## ValueSet: SE Observation Status (SNOMED CT urval 56431000052106) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/ValueSet/se-observation-status-vs | *Version*:0.1.0 |
| Active as of 2026-06-24 | *Computable Name*:SEObservationStatusVS |

 
Tillåtna statusvärden för GetObservations observationStatus. Urvals-id 56431000052106, SNOMED CT SE (OID 1.2.752.116.2.1.1). Mappning till FHIR ObservationStatus via ConceptMap observation-status-map. 

 **References** 

* [GetObservations](StructureDefinition-inera-ehds-lm-observations.md)
* [SE EHDS Observation Base – GetObservations](StructureDefinition-inera-ehds-observation-base.md)

### Logisk definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "se-observation-status-vs",
  "url" : "https://fhir.inera.se/ig/ehds-tk/ValueSet/se-observation-status-vs",
  "version" : "0.1.0",
  "name" : "SEObservationStatusVS",
  "title" : "SE Observation Status (SNOMED CT urval 56431000052106)",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-06-24T12:10:33+00:00",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Tillåtna statusvärden för GetObservations observationStatus.\nUrvals-id 56431000052106, SNOMED CT SE (OID 1.2.752.116.2.1.1).\nMappning till FHIR ObservationStatus via ConceptMap observation-status-map.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "385676005",
        "display" : "Under utförande"
      },
      {
        "code" : "385651009",
        "display" : "Slutlig"
      },
      {
        "code" : "272393004",
        "display" : "Korrigerad"
      },
      {
        "code" : "59776000",
        "display" : "Avbeställd/annullerad"
      },
      {
        "code" : "444301002",
        "display" : "Avböjd av patient"
      }]
    }]
  }
}

```
