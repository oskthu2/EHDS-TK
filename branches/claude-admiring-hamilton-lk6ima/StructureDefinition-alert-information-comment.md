# Kommentar till uppmärksamhetssignal - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Kommentar till uppmärksamhetssignal**

## Extension: Kommentar till uppmärksamhetssignal 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-information-comment | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:AlertInformationComment |

Kommentar angående uppmärksamhetssignalen (alertInformationBody.alertInformationComment). Om obsoleteComment är angivet konkateneras det med prefix 'Inaktiveringskommentar: {obsoleteComment}'. För body = unstructuredAlertInformation: unstructuredAlertInformationContent läggs här.

**Context of Use**

**Usage info**

**Användningar:**

* Använd denna Extension: [SE EHDS Flag – Uppmärksamhetsinformation (GetAlertInformation)](StructureDefinition-inera-ehds-flag.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/alert-information-comment)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-alert-information-comment.csv), [Excel](StructureDefinition-alert-information-comment.xlsx), [Schematron](StructureDefinition-alert-information-comment.sch) 

#### Begränsningar



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "alert-information-comment",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-information-comment",
  "version" : "0.1.0",
  "name" : "AlertInformationComment",
  "title" : "Kommentar till uppmärksamhetssignal",
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
  "description" : "Kommentar angående uppmärksamhetssignalen (alertInformationBody.alertInformationComment).\nOm obsoleteComment är angivet konkateneras det med prefix 'Inaktiveringskommentar: {obsoleteComment}'.\nFör body = unstructuredAlertInformation: unstructuredAlertInformationContent läggs här.",
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
      "short" : "Kommentar till uppmärksamhetssignal",
      "definition" : "Kommentar angående uppmärksamhetssignalen (alertInformationBody.alertInformationComment).\nOm obsoleteComment är angivet konkateneras det med prefix 'Inaktiveringskommentar: {obsoleteComment}'.\nFör body = unstructuredAlertInformation: unstructuredAlertInformationContent läggs här."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-information-comment"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
