# SE EHDS Device – Källsystem (GetVaccinationHistory registrationRecord) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS Device – Källsystem (GetVaccinationHistory registrationRecord)**

## Resource Profile: SE EHDS Device – Källsystem (GetVaccinationHistory registrationRecord) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-device | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSDevice |

 
Profil för det källsystem som registrerat en vaccination i GetVaccinationHistory v2.0. 
Representerar vaccinationMedicalRecordBody.registrationRecord.sourceSystem* och sourceSystemContact. Refereras från IneraEHDSImmunization via extension[registrationDevice]. 
deviceName[systemName] = sourceSystemName (1..1, obligatorisk) deviceName[productName] = sourceSystemProductName (0..1) version = sourceSystemProductVersion (0..1) extension[sourceSystemContact] = sourceSystemContact.actorId/actorName (0..1) 

**Användningar:**

* Referera till denna Profil: [Källsystem för vaccinationsregistrering](StructureDefinition-immunization-registration-device.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-device)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-device.csv), [Excel](StructureDefinition-inera-ehds-device.xlsx), [Schematron](StructureDefinition-inera-ehds-device.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-device",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-device",
  "version" : "0.1.0",
  "name" : "IneraEHDSDevice",
  "title" : "SE EHDS Device – Källsystem (GetVaccinationHistory registrationRecord)",
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
  "description" : "Profil för det källsystem som registrerat en vaccination i GetVaccinationHistory v2.0.\n\nRepresenterar vaccinationMedicalRecordBody.registrationRecord.sourceSystem*\noch sourceSystemContact. Refereras från IneraEHDSImmunization via\nextension[registrationDevice].\n\ndeviceName[systemName]  = sourceSystemName     (1..1, obligatorisk)\ndeviceName[productName] = sourceSystemProductName (0..1)\nversion                 = sourceSystemProductVersion (0..1)\nextension[sourceSystemContact] = sourceSystemContact.actorId/actorName (0..1)",
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
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "udi",
    "uri" : "http://fda.gov/UDI",
    "name" : "UDI Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Device",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Device",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Device",
      "path" : "Device"
    },
    {
      "id" : "Device.extension",
      "path" : "Device.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Device.extension:sourceSystemContact",
      "path" : "Device.extension",
      "sliceName" : "sourceSystemContact",
      "short" : "Kontaktperson för källsystemet (registrationRecord.sourceSystemContact)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/device-source-system-contact"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Device.deviceName",
      "path" : "Device.deviceName",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "type"
        }],
        "rules" : "open"
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Device.deviceName:systemName",
      "path" : "Device.deviceName",
      "sliceName" : "systemName",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Device.deviceName:systemName.name",
      "path" : "Device.deviceName.name",
      "short" : "Källsystemets namn (registrationRecord.sourceSystemName)",
      "mustSupport" : true
    },
    {
      "id" : "Device.deviceName:systemName.type",
      "path" : "Device.deviceName.type",
      "patternCode" : "user-friendly-name"
    },
    {
      "id" : "Device.deviceName:productName",
      "path" : "Device.deviceName",
      "sliceName" : "productName",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Device.deviceName:productName.name",
      "path" : "Device.deviceName.name",
      "short" : "Källsystemets produktnamn (registrationRecord.sourceSystemProductName)",
      "mustSupport" : true
    },
    {
      "id" : "Device.deviceName:productName.type",
      "path" : "Device.deviceName.type",
      "patternCode" : "model-name"
    },
    {
      "id" : "Device.version",
      "path" : "Device.version",
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Device.version.value",
      "path" : "Device.version.value",
      "short" : "Källsystemets produktversion (registrationRecord.sourceSystemProductVersion)",
      "mustSupport" : true
    }]
  }
}

```
