# Läkemedelsöverkänslighet – substansdetaljer - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Läkemedelsöverkänslighet – substansdetaljer**

## Extension: Läkemedelsöverkänslighet – substansdetaljer 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-pharmaceutical-hypersensitivity | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:AlertPharmaceuticalHypersensitivity |

Kompletterande substansdetaljer för läkemedelsöverkänslighet (alertInformationBody.hypersensitivity.pharmaceuticalHypersensitivity). Primär substans: atcSubstance → Flag.code.coding; nonATCSubstance → Flag.code.text. Denna extension bär kvarvarande detaljer: nonATCSubstanceComment och pharmaceuticalProductId.

**Context of Use**

**Usage info**

**Användningar:**

* Använd denna Extension: [SE EHDS Flag – Uppmärksamhetsinformation (GetAlertInformation)](StructureDefinition-inera-ehds-flag.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/alert-pharmaceutical-hypersensitivity)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-alert-pharmaceutical-hypersensitivity.csv), [Excel](StructureDefinition-alert-pharmaceutical-hypersensitivity.xlsx), [Schematron](StructureDefinition-alert-pharmaceutical-hypersensitivity.sch) 

#### Begränsningar



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "alert-pharmaceutical-hypersensitivity",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-pharmaceutical-hypersensitivity",
  "version" : "0.1.0",
  "name" : "AlertPharmaceuticalHypersensitivity",
  "title" : "Läkemedelsöverkänslighet – substansdetaljer",
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
  "description" : "Kompletterande substansdetaljer för läkemedelsöverkänslighet\n(alertInformationBody.hypersensitivity.pharmaceuticalHypersensitivity).\nPrimär substans: atcSubstance → Flag.code.coding; nonATCSubstance → Flag.code.text.\nDenna extension bär kvarvarande detaljer: nonATCSubstanceComment och pharmaceuticalProductId.",
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
      "short" : "Läkemedelsöverkänslighet – substansdetaljer",
      "definition" : "Kompletterande substansdetaljer för läkemedelsöverkänslighet\n(alertInformationBody.hypersensitivity.pharmaceuticalHypersensitivity).\nPrimär substans: atcSubstance → Flag.code.coding; nonATCSubstance → Flag.code.text.\nDenna extension bär kvarvarande detaljer: nonATCSubstanceComment och pharmaceuticalProductId."
    },
    {
      "id" : "Extension.extension:nonATCSubstanceComment",
      "path" : "Extension.extension",
      "sliceName" : "nonATCSubstanceComment",
      "short" : "Förklaring till avsaknad ATC-kod (pharmaceuticalHypersensitivity.nonATCSubstanceComment)",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:nonATCSubstanceComment.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:nonATCSubstanceComment.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "nonATCSubstanceComment"
    },
    {
      "id" : "Extension.extension:nonATCSubstanceComment.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Extension.extension:pharmaceuticalProductId",
      "path" : "Extension.extension",
      "sliceName" : "pharmaceuticalProductId",
      "short" : "Läkemedelsprodukt-id/NPL-id (pharmaceuticalHypersensitivity.pharmaceuticalProductId)",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Extension.extension:pharmaceuticalProductId.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:pharmaceuticalProductId.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "pharmaceuticalProductId"
    },
    {
      "id" : "Extension.extension:pharmaceuticalProductId.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-pharmaceutical-hypersensitivity"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
