# Juridisk äkthetsintygsgivare för uppmärksamhetssignal - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Juridisk äkthetsintygsgivare för uppmärksamhetssignal**

## Extension: Juridisk äkthetsintygsgivare för uppmärksamhetssignal 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-asserter | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:AlertAsserter |

HSA-id för juridisk äkthetsintygsgivare (alertInformationHeader.legalAuthenticator.legalAuthenticatorHSAId).

**Context of Use**

**Usage info**

**Användningar:**

* Använd denna Extension: [SE EHDS Flag – Uppmärksamhetsinformation (GetAlertInformation)](StructureDefinition-inera-ehds-flag.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/alert-asserter)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-alert-asserter.csv), [Excel](StructureDefinition-alert-asserter.xlsx), [Schematron](StructureDefinition-alert-asserter.sch) 

#### Begränsningar



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "alert-asserter",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-asserter",
  "version" : "0.1.0",
  "name" : "AlertAsserter",
  "title" : "Juridisk äkthetsintygsgivare för uppmärksamhetssignal",
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
  "description" : "HSA-id för juridisk äkthetsintygsgivare (alertInformationHeader.legalAuthenticator.legalAuthenticatorHSAId).",
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
      "short" : "Juridisk äkthetsintygsgivare för uppmärksamhetssignal",
      "definition" : "HSA-id för juridisk äkthetsintygsgivare (alertInformationHeader.legalAuthenticator.legalAuthenticatorHSAId)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-asserter"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }]
    }]
  }
}

```
