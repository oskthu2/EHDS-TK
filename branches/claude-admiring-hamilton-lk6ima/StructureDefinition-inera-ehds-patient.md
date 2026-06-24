# SE EHDS Patient - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS Patient**

## Resource Profile: SE EHDS Patient 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-patient | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSPatient |

 
Patientprofil för EHDS-TK IG. Ärver från IPS Patient och lägger till svenska identifierarslicar. 

**Användningar:**

* Referera till denna Profil: [SE EHDS AllergyIntolerance – Allergi/överkänslighet (GetAlertInformation)](StructureDefinition-inera-ehds-allergy-intolerance.md), [SE EHDS AuditEvent – Åtkomstloggar (GetAccessLogForPatient)](StructureDefinition-inera-ehds-audit-event.md), [SE EHDS CarePlan – Vårdplan (GetCarePlans)](StructureDefinition-inera-ehds-care-plan.md), [SE EHDS Condition – Diagnos (GetDiagnosis)](StructureDefinition-inera-ehds-condition-diagnosis.md)... Show 15 more, [SE EHDS Condition – Funktionstillstånd och ADL (GetFunctionalStatus)](StructureDefinition-inera-ehds-condition-functional.md), [SE EHDS DiagnosticReport – Bilddiagnostiskt utlåtande (GetImagingOutcome)](StructureDefinition-inera-ehds-diagnostic-report-imaging.md), [SE EHDS DiagnosticReport – Provsvar (GetLaboratoryOrderOutcome)](StructureDefinition-inera-ehds-diagnostic-report-lab.md), [SE EHDS DiagnosticReport – Konsultationssvar (GetReferralOutcome)](StructureDefinition-inera-ehds-diagnostic-report-referral.md), [SE EHDS DocumentReference – Anteckningar (GetCareDocumentation)](StructureDefinition-inera-ehds-document-reference.md), [SE EHDS Encounter – Vårdkontakter (GetCareContacts)](StructureDefinition-inera-ehds-encounter.md), [SE EHDS Flag – Uppmärksamhetsinformation (GetAlertInformation)](StructureDefinition-inera-ehds-flag.md), [SE EHDS ImagingStudy – Bilddiagnostik (GetImagingOutcome)](StructureDefinition-inera-ehds-imaging-study.md), [SE EHDS Immunization – Vaccinationer (GetVaccinationHistory)](StructureDefinition-inera-ehds-immunization.md), [SE EHDS MedicationStatement – Läkemedel (GetMedicationHistory)](StructureDefinition-inera-ehds-medication-statement.md), [SE EHDS Observation Base – GetObservations](StructureDefinition-inera-ehds-observation-base.md), [SE EHDS Observation – Laboratoriesvar (GetLaboratoryOrderOutcome)](StructureDefinition-inera-ehds-observation-lab.md), [SE EHDS Observation – Mödravård (GetMaternityMedicalHistory)](StructureDefinition-inera-ehds-observation-maternity.md), [SE EHDS ServiceRequest – Konsultationsremiss (GetReferralOutcome)](StructureDefinition-inera-ehds-service-request-referral.md) and [SE EHDS Task – Remisstatus (GetRequestActivities)](StructureDefinition-inera-ehds-task.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-patient)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-patient.csv), [Excel](StructureDefinition-inera-ehds-patient.xlsx), [Schematron](StructureDefinition-inera-ehds-patient.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-patient",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-patient",
  "version" : "0.1.0",
  "name" : "IneraEHDSPatient",
  "title" : "SE EHDS Patient",
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
  "description" : "Patientprofil för EHDS-TK IG. Ärver från IPS Patient och lägger till svenska identifierarslicar.",
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
    "identity" : "cda",
    "uri" : "http://hl7.org/v3/cda",
    "name" : "CDA (R2)"
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
  },
  {
    "identity" : "loinc",
    "uri" : "http://loinc.org",
    "name" : "LOINC code for the element"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Patient",
  "baseDefinition" : "http://hl7.org/fhir/uv/ips/StructureDefinition/Patient-uv-ips",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Patient",
      "path" : "Patient"
    },
    {
      "id" : "Patient.identifier",
      "path" : "Patient.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "rules" : "open"
      },
      "short" : "Patientidentifierare (patientId från RIVTA)"
    },
    {
      "id" : "Patient.identifier:personnummer",
      "path" : "Patient.identifier",
      "sliceName" : "personnummer",
      "short" : "Personnummer",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:personnummer.system",
      "path" : "Patient.identifier.system",
      "min" : 1,
      "patternUri" : "http://electronichealth.se/identifier/personnummer",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:personnummer.value",
      "path" : "Patient.identifier.value",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:samordningsnummer",
      "path" : "Patient.identifier",
      "sliceName" : "samordningsnummer",
      "short" : "Samordningsnummer",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:samordningsnummer.system",
      "path" : "Patient.identifier.system",
      "min" : 1,
      "patternUri" : "http://electronichealth.se/identifier/samordningsnummer",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:samordningsnummer.value",
      "path" : "Patient.identifier.value",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:nationelltReservnummer",
      "path" : "Patient.identifier",
      "sliceName" : "nationelltReservnummer",
      "short" : "Nationellt reservnummer",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:nationelltReservnummer.system",
      "path" : "Patient.identifier.system",
      "min" : 1,
      "patternUri" : "http://electronichealth.se/identifier/nationelltReservnummer",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:nationelltReservnummer.value",
      "path" : "Patient.identifier.value",
      "min" : 1,
      "mustSupport" : true
    }]
  }
}

```
