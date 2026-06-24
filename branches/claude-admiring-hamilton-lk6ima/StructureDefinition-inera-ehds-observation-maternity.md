# SE EHDS Observation – Mödravård (GetMaternityMedicalHistory) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS Observation – Mödravård (GetMaternityMedicalHistory)**

## Resource Profile: SE EHDS Observation – Mödravård (GetMaternityMedicalHistory) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-observation-maternity | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSObservationMaternity |

 
Generisk profil för medicinsk historik inom mödravård mappat från RIVTA-tjänstekontraktet GetMaternityMedicalHistory (clinicalprocess:healthcond:actoutcome v2.0). Täcker NPÖ 2.0 och 1177 Journal 2.0. 
OBS: TKBn har tre separata sektioner (registrationRecord, pregnancyCheckupRecord, postDeliveryRecord) med egna sektionsspecifika fält. En Observation skapas per sektion med Observation.code som diskriminator (se MAT-001 i mapping-issues). Fältnamnen i ^short nedan refererar till sektionsspecifika element – implementatören väljer rätt sektionselement baserat på Observation.code. 

**Användningar:**

* Denna Profil används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-observation-maternity)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-observation-maternity.csv), [Excel](StructureDefinition-inera-ehds-observation-maternity.xlsx), [Schematron](StructureDefinition-inera-ehds-observation-maternity.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-observation-maternity",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-observation-maternity",
  "version" : "0.1.0",
  "name" : "IneraEHDSObservationMaternity",
  "title" : "SE EHDS Observation – Mödravård (GetMaternityMedicalHistory)",
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
  "description" : "Generisk profil för medicinsk historik inom mödravård mappat från RIVTA-tjänstekontraktet\nGetMaternityMedicalHistory (clinicalprocess:healthcond:actoutcome v2.0).\nTäcker NPÖ 2.0 och 1177 Journal 2.0.\n\nOBS: TKBn har tre separata sektioner (registrationRecord, pregnancyCheckupRecord,\npostDeliveryRecord) med egna sektionsspecifika fält. En Observation skapas per sektion\nmed Observation.code som diskriminator (se MAT-001 i mapping-issues). Fältnamnen\ni ^short nedan refererar till sektionsspecifika element – implementatören väljer rätt\nsektionselement baserat på Observation.code.",
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
    "identity" : "sct-concept",
    "uri" : "http://snomed.info/conceptdomain",
    "name" : "SNOMED CT Concept Domain Binding"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
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
    "identity" : "sct-attr",
    "uri" : "http://snomed.org/attributebinding",
    "name" : "SNOMED CT Attribute Binding"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "http://hl7.org/fhir/uv/ips/StructureDefinition/Observation-results-uv-ips",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.meta.source",
      "path" : "Observation.meta.source",
      "short" : "Källsystem HSA-id (maternityMedicalRecordHeader.sourceSystemHSAId)",
      "mustSupport" : true
    },
    {
      "id" : "Observation.status",
      "path" : "Observation.status",
      "short" : "Status",
      "mustSupport" : true
    },
    {
      "id" : "Observation.category",
      "path" : "Observation.category",
      "short" : "Kategori – härledd från sektionstyp (registrationRecord/pregnancyCheckupRecord/postDeliveryRecord)",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "short" : "Sektionskod – diskriminator för vilken av de tre sektionerna som Observation representerar"
    },
    {
      "id" : "Observation.subject",
      "path" : "Observation.subject",
      "short" : "Patient (maternityMedicalRecordHeader.patientId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-patient"]
      }]
    },
    {
      "id" : "Observation.effective[x]",
      "path" : "Observation.effective[x]",
      "short" : "Tidpunkt för dokumentation (maternityMedicalRecordHeader.accountableHealthcareProfessional.authorTime)"
    },
    {
      "id" : "Observation.issued",
      "path" : "Observation.issued",
      "short" : "Dokumentets registreringstidpunkt (maternityMedicalRecordHeader.documentTime)",
      "mustSupport" : true
    },
    {
      "id" : "Observation.performer",
      "path" : "Observation.performer",
      "short" : "Ansvarig personal/enhet (maternityMedicalRecordHeader.accountableHealthcareProfessional)",
      "mustSupport" : true
    },
    {
      "id" : "Observation.value[x]",
      "path" : "Observation.value[x]",
      "short" : "Sektionsspecifikt mätvärde (t.ex. pregnancyCheckupRecord.bloodPressure, postDeliveryRecord.birthWeight)"
    },
    {
      "id" : "Observation.note",
      "path" : "Observation.note",
      "short" : "Sektionsspecifik kommentar",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component",
      "path" : "Observation.component",
      "short" : "Sektionsspecifika delfält kodas som component (se MAT-001)"
    }]
  }
}

```
