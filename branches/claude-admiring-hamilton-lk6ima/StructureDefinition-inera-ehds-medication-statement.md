# SE EHDS MedicationStatement – Läkemedel (GetMedicationHistory) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS MedicationStatement – Läkemedel (GetMedicationHistory)**

## Resource Profile: SE EHDS MedicationStatement – Läkemedel (GetMedicationHistory) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-medication-statement | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSMedicationStatement |

 
Profil för läkemedelsordinationer, förskrivningar och administrerade läkemedel mappat från RIVTA-tjänstekontraktet GetMedicationHistory (clinicalprocess:activityprescription:actoutcome v2.2). Täcker NPÖ 2.2 och 1177 Journal 2.2. 

**Användningar:**

* Denna Profil används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-medication-statement)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-medication-statement.csv), [Excel](StructureDefinition-inera-ehds-medication-statement.xlsx), [Schematron](StructureDefinition-inera-ehds-medication-statement.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-medication-statement",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-medication-statement",
  "version" : "0.1.0",
  "name" : "IneraEHDSMedicationStatement",
  "title" : "SE EHDS MedicationStatement – Läkemedel (GetMedicationHistory)",
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
  "description" : "Profil för läkemedelsordinationer, förskrivningar och administrerade läkemedel mappat från RIVTA-tjänstekontraktet GetMedicationHistory (clinicalprocess:activityprescription:actoutcome v2.2). Täcker NPÖ 2.2 och 1177 Journal 2.2.",
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
  "type" : "MedicationStatement",
  "baseDefinition" : "http://hl7.org/fhir/uv/ips/StructureDefinition/MedicationStatement-uv-ips",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "MedicationStatement",
      "path" : "MedicationStatement"
    },
    {
      "id" : "MedicationStatement.meta.source",
      "path" : "MedicationStatement.meta.source",
      "short" : "Källsystem HSA-id (medicationMedicalRecordHeader.sourceSystemHSAId)",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.status",
      "path" : "MedicationStatement.status",
      "short" : "Ordinationsstatus (medicationMedicalRecordBody.medicationPrescription.prescriptionStatus – Active/Inactive)",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.medication[x]",
      "path" : "MedicationStatement.medication[x]",
      "short" : "Läkemedel (medicationMedicalRecordBody.medicationPrescription.drug – XOR: unstructured/merchandise/drugArticle/drug/generics, se MED-003)"
    },
    {
      "id" : "MedicationStatement.subject",
      "path" : "MedicationStatement.subject",
      "short" : "Patient (medicationMedicalRecordHeader.patientId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-patient"]
      }]
    },
    {
      "id" : "MedicationStatement.effective[x]",
      "path" : "MedicationStatement.effective[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "MedicationStatement.effective[x]:effectivePeriod",
      "path" : "MedicationStatement.effective[x]",
      "sliceName" : "effectivePeriod",
      "short" : "Behandlingsperiod (startOfTreatment / endOfTreatment)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Period"
      }],
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.effective[x]:effectivePeriod.start",
      "path" : "MedicationStatement.effective[x].start",
      "short" : "Insättningstidpunkt (medicationMedicalRecordBody.medicationPrescription.startOfTreatment)",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.effective[x]:effectivePeriod.end",
      "path" : "MedicationStatement.effective[x].end",
      "short" : "Utsättningstidpunkt (medicationMedicalRecordBody.medicationPrescription.endOfTreatment)",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.dateAsserted",
      "path" : "MedicationStatement.dateAsserted",
      "short" : "Dokumentationstidpunkt (medicationMedicalRecordHeader.accountableHealthcareProfessional.authorTime)",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.informationSource",
      "path" : "MedicationStatement.informationSource",
      "short" : "Ansvarig hälso- och sjukvårdspersonal (medicationMedicalRecordHeader.accountableHealthcareProfessional)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.reasonCode",
      "path" : "MedicationStatement.reasonCode",
      "short" : "Ordinationsorsak (medicationMedicalRecordBody.medicationPrescription.principalPrescriptionReason.reason)",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.note",
      "path" : "MedicationStatement.note",
      "short" : "Notat om ordination (medicationMedicalRecordBody.medicationPrescription.prescriptionNote)",
      "mustSupport" : true
    },
    {
      "id" : "MedicationStatement.dosage",
      "path" : "MedicationStatement.dosage",
      "short" : "Dosering (medicationMedicalRecordBody.medicationPrescription.dosage)"
    },
    {
      "id" : "MedicationStatement.dosage.text",
      "path" : "MedicationStatement.dosage.text",
      "short" : "Doseringsinstruktion i fritext (medicationMedicalRecordBody.medicationPrescription.dosage.dosageInstruction)"
    },
    {
      "id" : "MedicationStatement.dosage.timing",
      "path" : "MedicationStatement.dosage.timing",
      "short" : "Doseringsschemat (medicationMedicalRecordBody.medicationPrescription.dosage – fastdosering/villkorsdosering)"
    },
    {
      "id" : "MedicationStatement.dosage.route",
      "path" : "MedicationStatement.dosage.route",
      "short" : "Administreringssätt (medicationMedicalRecordBody.medicationPrescription.drug.drug.routeOfAdministration)",
      "mustSupport" : true
    }]
  }
}

```
