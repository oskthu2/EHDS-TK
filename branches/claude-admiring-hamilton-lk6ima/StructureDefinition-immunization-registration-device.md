# Källsystem för vaccinationsregistrering - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Källsystem för vaccinationsregistrering**

## Extension: Källsystem för vaccinationsregistrering 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/immunization-registration-device | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:ImmunizationRegistrationDevice |

Referens till den Device-resurs som beskriver källsystemet varifrån vaccinationsregistreringen härstammar (registrationRecord.sourceSystemName/productName/productVersion/sourceSystemContact).

**Context of Use**

**Usage info**

**Användningar:**

* Använd denna Extension: [SE EHDS Immunization – Vaccinationer (GetVaccinationHistory)](StructureDefinition-inera-ehds-immunization.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/immunization-registration-device)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-immunization-registration-device.csv), [Excel](StructureDefinition-immunization-registration-device.xlsx), [Schematron](StructureDefinition-immunization-registration-device.sch) 

#### Begränsningar



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "immunization-registration-device",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/immunization-registration-device",
  "version" : "0.1.0",
  "name" : "ImmunizationRegistrationDevice",
  "title" : "Källsystem för vaccinationsregistrering",
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
  "description" : "Referens till den Device-resurs som beskriver källsystemet varifrån\nvaccinationsregistreringen härstammar\n(registrationRecord.sourceSystemName/productName/productVersion/sourceSystemContact).",
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
      "short" : "Källsystem för vaccinationsregistrering",
      "definition" : "Referens till den Device-resurs som beskriver källsystemet varifrån\nvaccinationsregistreringen härstammar\n(registrationRecord.sourceSystemName/productName/productVersion/sourceSystemContact)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/immunization-registration-device"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-device"]
      }]
    }]
  }
}

```
