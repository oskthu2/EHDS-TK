# SE EHDS Immunization – Vaccinationer (GetVaccinationHistory) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS Immunization – Vaccinationer (GetVaccinationHistory)**

## Resource Profile: SE EHDS Immunization – Vaccinationer (GetVaccinationHistory) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-immunization | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSImmunization |

 
Profil för vaccinationer mappat från RIVTA-tjänstekontraktet GetVaccinationHistory (clinicalprocess:activityprescription:actoutcome v2.0). Täcker NPÖ 2.0 och 1177 Journal 1.0, 2.0. 

**Användningar:**

* Denna Profil används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-immunization)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-immunization.csv), [Excel](StructureDefinition-inera-ehds-immunization.xlsx), [Schematron](StructureDefinition-inera-ehds-immunization.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-immunization",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-immunization",
  "version" : "0.1.0",
  "name" : "IneraEHDSImmunization",
  "title" : "SE EHDS Immunization – Vaccinationer (GetVaccinationHistory)",
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
  "description" : "Profil för vaccinationer mappat från RIVTA-tjänstekontraktet GetVaccinationHistory (clinicalprocess:activityprescription:actoutcome v2.0). Täcker NPÖ 2.0 och 1177 Journal 1.0, 2.0.",
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
    "identity" : "cda",
    "uri" : "http://hl7.org/v3/cda",
    "name" : "CDA (R2)"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Immunization",
  "baseDefinition" : "http://hl7.org/fhir/uv/ips/StructureDefinition/Immunization-uv-ips",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Immunization",
      "path" : "Immunization"
    },
    {
      "id" : "Immunization.meta.source",
      "path" : "Immunization.meta.source",
      "short" : "Källsystem HSA-id (vaccinationMedicalRecordHeader.sourceSystemHSAId)",
      "mustSupport" : true
    },
    {
      "id" : "Immunization.meta.security",
      "path" : "Immunization.meta.security",
      "short" : "PDL-kontroll (vaccinationMedicalRecordHeader.approvedForPatient) – se PDL-001",
      "mustSupport" : true
    },
    {
      "id" : "Immunization.extension",
      "path" : "Immunization.extension",
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
      "id" : "Immunization.extension:legalAuthenticator",
      "path" : "Immunization.extension",
      "sliceName" : "legalAuthenticator",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/immunization-legal-authenticator"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Immunization.extension:patientPostalCode",
      "path" : "Immunization.extension",
      "sliceName" : "patientPostalCode",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/immunization-patient-postal-code"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Immunization.extension:registrationDevice",
      "path" : "Immunization.extension",
      "sliceName" : "registrationDevice",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/immunization-registration-device"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Immunization.extension:isDoseComplete",
      "path" : "Immunization.extension",
      "sliceName" : "isDoseComplete",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/immunization-is-dose-complete"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Immunization.identifier",
      "path" : "Immunization.identifier",
      "short" : "Dokumentidentifierare (vaccinationMedicalRecordHeader.documentId)",
      "mustSupport" : true
    },
    {
      "id" : "Immunization.status",
      "path" : "Immunization.status",
      "short" : "Vaccinationsstatus – 'completed' normalt; 'entered-in-error' om nullified=true"
    },
    {
      "id" : "Immunization.statusReason",
      "path" : "Immunization.statusReason",
      "short" : "Makuleringsorsak (vaccinationMedicalRecordHeader.nullifiedReason)",
      "mustSupport" : true
    },
    {
      "id" : "Immunization.vaccineCode",
      "path" : "Immunization.vaccineCode",
      "short" : "Vaccin (administrationRecord.typeOfVaccine / administrationRecord.vaccineName)"
    },
    {
      "id" : "Immunization.patient",
      "path" : "Immunization.patient",
      "short" : "Patient (vaccinationMedicalRecordHeader.patientId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-patient"]
      }]
    },
    {
      "id" : "Immunization.encounter",
      "path" : "Immunization.encounter",
      "short" : "Kopplad vårdkontakt (vaccinationMedicalRecordHeader.careContactId)",
      "mustSupport" : true
    },
    {
      "id" : "Immunization.occurrence[x]",
      "path" : "Immunization.occurrence[x]",
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
      "id" : "Immunization.occurrence[x]:occurrenceDateTime",
      "path" : "Immunization.occurrence[x]",
      "sliceName" : "occurrenceDateTime",
      "short" : "Vaccinationstidpunkt: vaccinationMedicalRecordHeader.documentTime (primär) eller authorTime (fallback)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Immunization.recorded",
      "path" : "Immunization.recorded",
      "short" : "Registreringsdatum (vaccinationMedicalRecordBody.registrationRecord.date)",
      "mustSupport" : true
    },
    {
      "id" : "Immunization.primarySource",
      "path" : "Immunization.primarySource",
      "short" : "false om vaccinationen efterregistrerats (sourceDescription är satt)",
      "mustSupport" : true
    },
    {
      "id" : "Immunization.reportOrigin",
      "path" : "Immunization.reportOrigin",
      "short" : "Källa för efterregistrerad vaccination (administrationRecord.sourceDescription) – fritext i reportOrigin.text; originaltext för eventuell kod",
      "mustSupport" : true
    },
    {
      "id" : "Immunization.lotNumber",
      "path" : "Immunization.lotNumber",
      "short" : "Batchnummer (administrationRecord.vaccineBatchId)",
      "mustSupport" : true
    },
    {
      "id" : "Immunization.site",
      "path" : "Immunization.site",
      "short" : "Injektionsställe (administrationRecord.anatomicalSite)",
      "mustSupport" : true
    },
    {
      "id" : "Immunization.route",
      "path" : "Immunization.route",
      "short" : "Administreringssätt (administrationRecord.route)",
      "mustSupport" : true
    },
    {
      "id" : "Immunization.doseQuantity",
      "path" : "Immunization.doseQuantity",
      "short" : "Dos (administrationRecord.dose.quantity)",
      "mustSupport" : true
    },
    {
      "id" : "Immunization.performer",
      "path" : "Immunization.performer",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "function"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "Immunization.performer:administering",
      "path" : "Immunization.performer",
      "sliceName" : "administering",
      "min" : 0,
      "max" : "*",
      "mustSupport" : true
    },
    {
      "id" : "Immunization.performer:administering.function",
      "path" : "Immunization.performer.function",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0443",
          "code" : "AP"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Immunization.performer:administering.actor",
      "path" : "Immunization.performer.actor",
      "short" : "Administrerande yrkesutövare/enhet (administrationRecord.performer / performerOrg; registrationRecord.careGiverOrg)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole",
        "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-organization"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Immunization.performer:ordering",
      "path" : "Immunization.performer",
      "sliceName" : "ordering",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Immunization.performer:ordering.function",
      "path" : "Immunization.performer.function",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0443",
          "code" : "OP"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Immunization.performer:ordering.actor",
      "path" : "Immunization.performer.actor",
      "short" : "Förskrivande yrkesutövare/enhet (administrationRecord.prescriberPerson / prescriberOrg)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole",
        "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-organization"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Immunization.note",
      "path" : "Immunization.note",
      "short" : "Ostrukturerad anteckning (registrationRecord.vaccinationUnstructuredNote) / kommentar",
      "mustSupport" : true
    },
    {
      "id" : "Immunization.programEligibility",
      "path" : "Immunization.programEligibility",
      "short" : "Riskgrupp/programbehörighet (registrationRecord.riskCategory)",
      "mustSupport" : true
    },
    {
      "id" : "Immunization.reaction",
      "path" : "Immunization.reaction",
      "short" : "Biverkning (registrationRecord.patientAdverseEffect / administrationRecord.patientAdverseEffect)",
      "mustSupport" : true
    },
    {
      "id" : "Immunization.protocolApplied",
      "path" : "Immunization.protocolApplied",
      "short" : "Vaccinationsprotokoll (administrationRecord)",
      "mustSupport" : true
    },
    {
      "id" : "Immunization.protocolApplied.series",
      "path" : "Immunization.protocolApplied.series",
      "short" : "Vaccinationsprogram (administrationRecord.vaccinationProgramName)",
      "mustSupport" : true
    },
    {
      "id" : "Immunization.protocolApplied.targetDisease",
      "path" : "Immunization.protocolApplied.targetDisease",
      "short" : "Målsjukdom (administrationRecord.vaccineTargetDisease)",
      "mustSupport" : true
    },
    {
      "id" : "Immunization.protocolApplied.doseNumber[x]",
      "path" : "Immunization.protocolApplied.doseNumber[x]",
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
      "id" : "Immunization.protocolApplied.doseNumber[x]:doseNumberPositiveInt",
      "path" : "Immunization.protocolApplied.doseNumber[x]",
      "sliceName" : "doseNumberPositiveInt",
      "short" : "Dosnummer (administrationRecord.doseOrdinalNumber)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "positiveInt"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Immunization.protocolApplied.seriesDoses[x]",
      "path" : "Immunization.protocolApplied.seriesDoses[x]",
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
      "id" : "Immunization.protocolApplied.seriesDoses[x]:seriesDosesPositiveInt",
      "path" : "Immunization.protocolApplied.seriesDoses[x]",
      "sliceName" : "seriesDosesPositiveInt",
      "short" : "Antal ordinerade doser (administrationRecord.numberOfPrescribedDoses)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "positiveInt"
      }],
      "mustSupport" : true
    }]
  }
}

```
