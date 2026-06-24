# Allvarlighetsgrad för överkänslighet - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Allvarlighetsgrad för överkänslighet**

## Extension: Allvarlighetsgrad för överkänslighet 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-degree-of-severity | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:AlertDegreeOfSeverity |

Bedömning av överkänslighetens allvarlighetsgrad (alertInformationBody.hypersensitivity.degreeOfSeverity). KV Allvarlighetsgrad 1.2.752.129.2.2.3.3.

**Context of Use**

**Usage info**

**Användningar:**

* Använd denna Extension: [SE EHDS Flag – Uppmärksamhetsinformation (GetAlertInformation)](StructureDefinition-inera-ehds-flag.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/alert-degree-of-severity)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-alert-degree-of-severity.csv), [Excel](StructureDefinition-alert-degree-of-severity.xlsx), [Schematron](StructureDefinition-alert-degree-of-severity.sch) 

#### Begränsningar



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "alert-degree-of-severity",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-degree-of-severity",
  "version" : "0.1.0",
  "name" : "AlertDegreeOfSeverity",
  "title" : "Allvarlighetsgrad för överkänslighet",
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
  "description" : "Bedömning av överkänslighetens allvarlighetsgrad (alertInformationBody.hypersensitivity.degreeOfSeverity). KV Allvarlighetsgrad 1.2.752.129.2.2.3.3.",
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
      "short" : "Allvarlighetsgrad för överkänslighet",
      "definition" : "Bedömning av överkänslighetens allvarlighetsgrad (alertInformationBody.hypersensitivity.degreeOfSeverity). KV Allvarlighetsgrad 1.2.752.129.2.2.3.3."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-degree-of-severity"
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
