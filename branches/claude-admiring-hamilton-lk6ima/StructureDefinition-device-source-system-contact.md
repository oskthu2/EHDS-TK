# Källsystemskontakt - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Källsystemskontakt**

## Extension: Källsystemskontakt 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/device-source-system-contact | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:DeviceSourceSystemContact |

Ansvarig kontaktperson för källsystemet (registrationRecord.sourceSystemContact.actorId/actorName).

**Context of Use**

**Usage info**

**Användningar:**

* Använd denna Extension: [SE EHDS Device – Källsystem (GetVaccinationHistory registrationRecord)](StructureDefinition-inera-ehds-device.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/device-source-system-contact)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-device-source-system-contact.csv), [Excel](StructureDefinition-device-source-system-contact.xlsx), [Schematron](StructureDefinition-device-source-system-contact.sch) 

#### Begränsningar



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "device-source-system-contact",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/device-source-system-contact",
  "version" : "0.1.0",
  "name" : "DeviceSourceSystemContact",
  "title" : "Källsystemskontakt",
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
  "description" : "Ansvarig kontaktperson för källsystemet (registrationRecord.sourceSystemContact.actorId/actorName).",
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
      "short" : "Källsystemskontakt",
      "definition" : "Ansvarig kontaktperson för källsystemet (registrationRecord.sourceSystemContact.actorId/actorName)."
    },
    {
      "id" : "Extension.extension:actorId",
      "path" : "Extension.extension",
      "sliceName" : "actorId",
      "short" : "Kontaktpersonens identifierare (sourceSystemContact.actorId)",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:actorId.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:actorId.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "actorId"
    },
    {
      "id" : "Extension.extension:actorId.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Extension.extension:actorName",
      "path" : "Extension.extension",
      "sliceName" : "actorName",
      "short" : "Kontaktpersonens namn (sourceSystemContact.actorName)",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:actorName.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:actorName.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "actorName"
    },
    {
      "id" : "Extension.extension:actorName.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/device-source-system-contact"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
