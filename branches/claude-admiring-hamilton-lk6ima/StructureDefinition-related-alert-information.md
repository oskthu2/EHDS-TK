# Relaterad uppmärksamhetssignal - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Relaterad uppmärksamhetssignal**

## Extension: Relaterad uppmärksamhetssignal 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/related-alert-information | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:RelatedAlertInformation |

Information om samband med andra uppmärksamhetssignaler (alertInformationBody.relatedAlertInformation).

**Context of Use**

**Usage info**

**Användningar:**

* Använd denna Extension: [SE EHDS Flag – Uppmärksamhetsinformation (GetAlertInformation)](StructureDefinition-inera-ehds-flag.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/related-alert-information)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-related-alert-information.csv), [Excel](StructureDefinition-related-alert-information.xlsx), [Schematron](StructureDefinition-related-alert-information.sch) 

#### Begränsningar



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "related-alert-information",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/related-alert-information",
  "version" : "0.1.0",
  "name" : "RelatedAlertInformation",
  "title" : "Relaterad uppmärksamhetssignal",
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
  "description" : "Information om samband med andra uppmärksamhetssignaler (alertInformationBody.relatedAlertInformation).",
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
      "short" : "Relaterad uppmärksamhetssignal",
      "definition" : "Information om samband med andra uppmärksamhetssignaler (alertInformationBody.relatedAlertInformation)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "min" : 2
    },
    {
      "id" : "Extension.extension:typeOfRelationship",
      "path" : "Extension.extension",
      "sliceName" : "typeOfRelationship",
      "short" : "Typ av samband (relatedAlertInformation.typeOfAlertInformationRelationship)",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:typeOfRelationship.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:typeOfRelationship.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "typeOfRelationship"
    },
    {
      "id" : "Extension.extension:typeOfRelationship.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "Extension.extension:relationComment",
      "path" : "Extension.extension",
      "sliceName" : "relationComment",
      "short" : "Kommentar till samband (relatedAlertInformation.relationComment)",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:relationComment.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:relationComment.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "relationComment"
    },
    {
      "id" : "Extension.extension:relationComment.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Extension.extension:documentId",
      "path" : "Extension.extension",
      "sliceName" : "documentId",
      "short" : "Relaterat dokumentid (relatedAlertInformation.documentId)",
      "min" : 1,
      "max" : "*"
    },
    {
      "id" : "Extension.extension:documentId.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:documentId.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "documentId"
    },
    {
      "id" : "Extension.extension:documentId.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/related-alert-information"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
