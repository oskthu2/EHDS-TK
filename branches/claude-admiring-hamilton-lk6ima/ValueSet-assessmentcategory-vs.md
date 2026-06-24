# AssessmentCategory — ValueSet - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **AssessmentCategory — ValueSet**

## ValueSet: AssessmentCategory — ValueSet 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/ValueSet/assessmentcategory-vs | *Version*:0.1.0 |
| Active as of 2026-06-24 | *Computable Name*:AssessmentCategoryVS |

 
Tillåtna värden för fältet assessmentCategory i GetFunctionalStatus. 

 **References** 

* [GetFunctionalStatus](StructureDefinition-inera-ehds-lm-functional-status.md)

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
  "id" : "assessmentcategory-vs",
  "url" : "https://fhir.inera.se/ig/ehds-tk/ValueSet/assessmentcategory-vs",
  "version" : "0.1.0",
  "name" : "AssessmentCategoryVS",
  "title" : "AssessmentCategory — ValueSet",
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
  "description" : "Tillåtna värden för fältet assessmentCategory i GetFunctionalStatus.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "https://fhir.inera.se/clinicalprocess-healthcond-description/CodeSystem/assessmentcategory-cs"
    }]
  }
}

```
