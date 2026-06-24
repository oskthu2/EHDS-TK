# SE EHDS Encounter – Vårdkontakter (GetCareContacts) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS Encounter – Vårdkontakter (GetCareContacts)**

## Resource Profile: SE EHDS Encounter – Vårdkontakter (GetCareContacts) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-encounter | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSEncounter |

 
Profil för vårdkontakter mappat från RIVTA-tjänstekontraktet GetCareContacts (clinicalprocess:logistics:logistics v3.0). Täcker NPÖ 2.0, 3.0 och 1177 Journal 2.0, 3.0. 

**Användningar:**

* Referera till denna Profil: [SE EHDS DocumentReference – Anteckningar (GetCareDocumentation)](StructureDefinition-inera-ehds-document-reference.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-encounter)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-encounter.csv), [Excel](StructureDefinition-inera-ehds-encounter.xlsx), [Schematron](StructureDefinition-inera-ehds-encounter.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-encounter",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-encounter",
  "version" : "0.1.0",
  "name" : "IneraEHDSEncounter",
  "title" : "SE EHDS Encounter – Vårdkontakter (GetCareContacts)",
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
  "description" : "Profil för vårdkontakter mappat från RIVTA-tjänstekontraktet GetCareContacts (clinicalprocess:logistics:logistics v3.0). Täcker NPÖ 2.0, 3.0 och 1177 Journal 2.0, 3.0.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
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
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Encounter",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Encounter",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Encounter",
      "path" : "Encounter",
      "constraint" : [{
        "key" : "encounter-period-min-one",
        "severity" : "error",
        "human" : "careContactTimePeriod: minst ett av start och end måste anges",
        "expression" : "period.exists() implies (period.start.exists() or period.end.exists())",
        "source" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-encounter"
      }]
    },
    {
      "id" : "Encounter.meta.source",
      "path" : "Encounter.meta.source",
      "short" : "Källsystem HSA-id (sourceSystemHSAId)",
      "mustSupport" : true
    },
    {
      "id" : "Encounter.identifier",
      "path" : "Encounter.identifier",
      "short" : "Vårdkontaktens identitet (documentId)",
      "mustSupport" : true
    },
    {
      "id" : "Encounter.status",
      "path" : "Encounter.status",
      "short" : "Kontaktstatus (careContactStatus – SNOMED CT SE, SCTID 53761000052103)",
      "mustSupport" : true
    },
    {
      "id" : "Encounter.class",
      "path" : "Encounter.class",
      "short" : "Typ av vårdkontakt (careContactCode – KV Vårdkontakttyp OID 1.2.752.129.2.2.2.x)",
      "mustSupport" : true
    },
    {
      "id" : "Encounter.subject",
      "path" : "Encounter.subject",
      "short" : "Patient (patientId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Encounter.participant",
      "path" : "Encounter.participant",
      "mustSupport" : true
    },
    {
      "id" : "Encounter.participant.individual",
      "path" : "Encounter.participant.individual",
      "short" : "Ansvarig personal (accountableHealthcareProfessional)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Encounter.period",
      "path" : "Encounter.period",
      "short" : "Tidsintervall för vårdkontakten (careContactTimePeriod)",
      "mustSupport" : true
    },
    {
      "id" : "Encounter.period.start",
      "path" : "Encounter.period.start",
      "short" : "Starttidpunkt (careContactTimePeriod.start)",
      "mustSupport" : true
    },
    {
      "id" : "Encounter.period.end",
      "path" : "Encounter.period.end",
      "short" : "Sluttidpunkt (careContactTimePeriod.end)",
      "mustSupport" : true
    },
    {
      "id" : "Encounter.reasonCode",
      "path" : "Encounter.reasonCode",
      "short" : "Orsak till vårdkontakt (careContactReason)",
      "mustSupport" : true
    },
    {
      "id" : "Encounter.serviceProvider",
      "path" : "Encounter.serviceProvider",
      "short" : "Enhet för vårdkontakten (careContactOrgUnit – Regel 5: krävs för NPÖ)",
      "mustSupport" : true
    },
    {
      "id" : "Encounter.serviceProvider.identifier",
      "path" : "Encounter.serviceProvider.identifier",
      "short" : "HSA-id för kontaktenhet (careContactOrgUnit.orgUnitHSAId) – obligatorisk per Regel 4",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Encounter.serviceProvider.display",
      "path" : "Encounter.serviceProvider.display",
      "short" : "Namn på kontaktenhet (careContactOrgUnit.orgUnitName) – obligatorisk per Regel 4",
      "min" : 1,
      "mustSupport" : true
    }]
  }
}

```
