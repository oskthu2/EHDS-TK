# Visshet för överkänslighet - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Visshet för överkänslighet**

## Extension: Visshet för överkänslighet 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-degree-of-certainty | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:AlertDegreeOfCertainty |

Visshetsgrad för överkänsligheten (alertInformationBody.hypersensitivity.degreeOfCertainty). KV Visshetsgrad 1.2.752.129.2.2.3.11.

**Context of Use**

**Usage info**

**Användningar:**

* Använd denna Extension: [SE EHDS Flag – Uppmärksamhetsinformation (GetAlertInformation)](StructureDefinition-inera-ehds-flag.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/alert-degree-of-certainty)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-alert-degree-of-certainty.csv), [Excel](StructureDefinition-alert-degree-of-certainty.xlsx), [Schematron](StructureDefinition-alert-degree-of-certainty.sch) 

#### Begränsningar



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "alert-degree-of-certainty",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-degree-of-certainty",
  "version" : "0.1.0",
  "name" : "AlertDegreeOfCertainty",
  "title" : "Visshet för överkänslighet",
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
  "description" : "Visshetsgrad för överkänsligheten (alertInformationBody.hypersensitivity.degreeOfCertainty). KV Visshetsgrad 1.2.752.129.2.2.3.11.",
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
      "short" : "Visshet för överkänslighet",
      "definition" : "Visshetsgrad för överkänsligheten (alertInformationBody.hypersensitivity.degreeOfCertainty). KV Visshetsgrad 1.2.752.129.2.2.3.11."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-degree-of-certainty"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    }]
  }
}

```
