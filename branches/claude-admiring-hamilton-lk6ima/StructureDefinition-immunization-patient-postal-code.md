# Patientens postnummer vid vaccination - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Patientens postnummer vid vaccination**

## Extension: Patientens postnummer vid vaccination 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/immunization-patient-postal-code | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:ImmunizationPatientPostalCode |

Patientens postnummer vid vaccinationstillfället (registrationRecord.patientPostalCode).

**Context of Use**

**Usage info**

**Användningar:**

* Använd denna Extension: [SE EHDS Immunization – Vaccinationer (GetVaccinationHistory)](StructureDefinition-inera-ehds-immunization.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/immunization-patient-postal-code)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-immunization-patient-postal-code.csv), [Excel](StructureDefinition-immunization-patient-postal-code.xlsx), [Schematron](StructureDefinition-immunization-patient-postal-code.sch) 

#### Begränsningar



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "immunization-patient-postal-code",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/immunization-patient-postal-code",
  "version" : "0.1.0",
  "name" : "ImmunizationPatientPostalCode",
  "title" : "Patientens postnummer vid vaccination",
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
  "description" : "Patientens postnummer vid vaccinationstillfället (registrationRecord.patientPostalCode).",
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
      "short" : "Patientens postnummer vid vaccination",
      "definition" : "Patientens postnummer vid vaccinationstillfället (registrationRecord.patientPostalCode)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/immunization-patient-postal-code"
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
