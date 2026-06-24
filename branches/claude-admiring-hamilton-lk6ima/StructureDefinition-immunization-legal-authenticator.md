# Juridisk äkthetsintygsgivare för vaccination - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Juridisk äkthetsintygsgivare för vaccination**

## Extension: Juridisk äkthetsintygsgivare för vaccination 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/immunization-legal-authenticator | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:ImmunizationLegalAuthenticator |

Signeringstidpunkt och HSA-id för juridisk äkthetsintygsgivare (vaccinationMedicalRecordHeader.legalAuthenticator).

**Context of Use**

**Usage info**

**Användningar:**

* Använd denna Extension: [SE EHDS Immunization – Vaccinationer (GetVaccinationHistory)](StructureDefinition-inera-ehds-immunization.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/immunization-legal-authenticator)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-immunization-legal-authenticator.csv), [Excel](StructureDefinition-immunization-legal-authenticator.xlsx), [Schematron](StructureDefinition-immunization-legal-authenticator.sch) 

#### Begränsningar



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "immunization-legal-authenticator",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/immunization-legal-authenticator",
  "version" : "0.1.0",
  "name" : "ImmunizationLegalAuthenticator",
  "title" : "Juridisk äkthetsintygsgivare för vaccination",
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
  "description" : "Signeringstidpunkt och HSA-id för juridisk äkthetsintygsgivare (vaccinationMedicalRecordHeader.legalAuthenticator).",
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
      "short" : "Juridisk äkthetsintygsgivare för vaccination",
      "definition" : "Signeringstidpunkt och HSA-id för juridisk äkthetsintygsgivare (vaccinationMedicalRecordHeader.legalAuthenticator)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "min" : 1
    },
    {
      "id" : "Extension.extension:signatureTime",
      "path" : "Extension.extension",
      "sliceName" : "signatureTime",
      "short" : "Signeringstidpunkt (legalAuthenticator.signatureTime)",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:signatureTime.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:signatureTime.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "signatureTime"
    },
    {
      "id" : "Extension.extension:signatureTime.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "Extension.extension:hsaId",
      "path" : "Extension.extension",
      "sliceName" : "hsaId",
      "short" : "Signerarens HSA-id (legalAuthenticator.legalAuthenticatorHSAId)",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:hsaId.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:hsaId.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "hsaId"
    },
    {
      "id" : "Extension.extension:hsaId.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/immunization-legal-authenticator"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
