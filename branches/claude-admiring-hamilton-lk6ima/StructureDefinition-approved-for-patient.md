# Godkänd för patient - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Godkänd för patient**

## Extension: Godkänd för patient 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/approved-for-patient | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:ApprovedForPatient |

Anger om information är godkänd för delning med patient (approvedForPatient, Regel 3).

**Context of Use**

**Usage info**

**Användningar:**

* Använd denna Extension: [SE EHDS CarePlan – Vårdplan (GetCarePlans)](StructureDefinition-inera-ehds-care-plan.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/approved-for-patient)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-approved-for-patient.csv), [Excel](StructureDefinition-approved-for-patient.xlsx), [Schematron](StructureDefinition-approved-for-patient.sch) 

#### Begränsningar



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "approved-for-patient",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/approved-for-patient",
  "version" : "0.1.0",
  "name" : "ApprovedForPatient",
  "title" : "Godkänd för patient",
  "status" : "draft",
  "date" : "2026-06-24T12:10:33+00:00",
  "publisher" : "Inera AB",
  "contact" : [{
    "name" : "Inera AB",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.inera.se"
    }]
  }],
  "description" : "Anger om information är godkänd för delning med patient (approvedForPatient, Regel 3).",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Element"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Godkänd för patient",
      "definition" : "Anger om information är godkänd för delning med patient (approvedForPatient, Regel 3)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/approved-for-patient"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```
