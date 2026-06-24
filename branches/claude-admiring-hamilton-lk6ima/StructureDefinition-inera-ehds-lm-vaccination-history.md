# GetVaccinationHistory - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **GetVaccinationHistory**

## Logical Model: GetVaccinationHistory 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-vaccination-history | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSLMVaccinationHistory |

 
Logisk modell för tjänstekontraktet GetVaccinationHistory (RIV-TA urn:riv:clinicalprocess:activityprescription:actoutcome:GetVaccinationHistoryResponder:2). Representerar responsens informationsstruktur — vaccinationsjournal per patient. 

**Användningar:**

* Denna Logisk modell används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-lm-vaccination-history)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-lm-vaccination-history.csv), [Excel](StructureDefinition-inera-ehds-lm-vaccination-history.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-lm-vaccination-history",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-be-target"
  }],
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-vaccination-history",
  "version" : "0.1.0",
  "name" : "IneraEHDSLMVaccinationHistory",
  "title" : "GetVaccinationHistory",
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
  "description" : "Logisk modell för tjänstekontraktet GetVaccinationHistory\n(RIV-TA urn:riv:clinicalprocess:activityprescription:actoutcome:GetVaccinationHistoryResponder:2).\nRepresenterar responsens informationsstruktur — vaccinationsjournal per patient.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "SE",
      "display" : "Sweden"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-vaccination-history",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "inera-ehds-lm-vaccination-history",
      "path" : "inera-ehds-lm-vaccination-history",
      "short" : "GetVaccinationHistory",
      "definition" : "Logisk modell för tjänstekontraktet GetVaccinationHistory\n(RIV-TA urn:riv:clinicalprocess:activityprescription:actoutcome:GetVaccinationHistoryResponder:2).\nRepresenterar responsens informationsstruktur — vaccinationsjournal per patient."
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord",
      "short" : "En strukturerad vaccinationsjournal",
      "definition" : "En strukturerad vaccinationsjournal. Kan innehålla en eller flera administreringsposter.\nKardinalitet: Valfri, lista.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader",
      "short" : "Basinformation om dokumentet",
      "definition" : "Basinformation om dokumentet",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.documentId",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.documentId",
      "short" : "Identifierare för uppgift i patientjournal",
      "definition" : "Identifieraren ska vara konsistent och beständig mellan anrop.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.sourceSystemHSAId",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.sourceSystemHSAId",
      "short" : "Det källsystem som uppgiften lagras i",
      "definition" : "Sätts till OID för HSA-katalogen (1.2.752.129.2.1.4.1).",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.documentTitle",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.documentTitle",
      "short" : "Titel som beskriver informationen",
      "definition" : "Titel som beskriver informationen",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.documentTime",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.documentTime",
      "short" : "Händelsetidpunkt (vaccinationstidpunkt)",
      "definition" : "Händelsetidpunkt (vaccinationstidpunkt)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.patientId",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.patientId",
      "short" : "Personidentifierare för patienten",
      "definition" : "id = patientens identifierare (12 tecken utan avskiljare).\ntype = OID för typ av personidentifierare.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional",
      "short" : "Dokumentationsansvarig",
      "definition" : "Dokumentationsansvarig",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.authorTime",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.authorTime",
      "short" : "Tidpunkt för dokumentation",
      "definition" : "Tidpunkt för dokumentation",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalHSAId",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalHSAId",
      "short" : "HSA-id för personal",
      "definition" : "HSA-id för personal",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalName",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalName",
      "short" : "Namn på personal",
      "definition" : "Namn på personal",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalRoleCode",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalRoleCode",
      "short" : "Befattning",
      "definition" : "Befattning",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalOrgUnit",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalOrgUnit",
      "short" : "Organisationsenhet",
      "definition" : "Organisationsenhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId",
      "short" : "HSA-id för organisationsenhet",
      "definition" : "HSA-id för organisationsenhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalOrgUnit.orgUnitName",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalOrgUnit.orgUnitName",
      "short" : "Namn på organisationsenhet",
      "definition" : "Namn på organisationsenhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom",
      "short" : "Telefon till organisationsenhet",
      "definition" : "Telefon till organisationsenhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail",
      "short" : "E-post till organisationsenhet",
      "definition" : "E-post till organisationsenhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress",
      "short" : "Postadress till organisationsenhet",
      "definition" : "Postadress till organisationsenhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation",
      "short" : "Plats/ort för organisationens fysiska placering",
      "definition" : "Plats/ort för organisationens fysiska placering",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalCareUnitHSAId",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalCareUnitHSAId",
      "short" : "HSA-id för vårdenhet",
      "definition" : "HSA-id för vårdenhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalCareGiverHSAId",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalCareGiverHSAId",
      "short" : "HSA-id/id för vårdgivare",
      "definition" : "HSA-id/id för vårdgivare",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.legalAuthenticator",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.legalAuthenticator",
      "short" : "Information om signering",
      "definition" : "Information om signering",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.legalAuthenticator.signatureTime",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.legalAuthenticator.signatureTime",
      "short" : "Tidpunkt för signering",
      "definition" : "Tidpunkt för signering",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.legalAuthenticator.legalAuthenticatorHSAId",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.legalAuthenticator.legalAuthenticatorHSAId",
      "short" : "HSA-id för signerande personal",
      "definition" : "HSA-id för signerande personal",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.legalAuthenticator.legalAuthenticatorName",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.legalAuthenticator.legalAuthenticatorName",
      "short" : "Namn på signerande personal",
      "definition" : "Namn på signerande personal",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.approvedForPatient",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.approvedForPatient",
      "short" : "Beslut om synlighet för patient (PDL-prövning)",
      "definition" : "Beslut om synlighet för patient (PDL-prövning)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.careContactId",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.careContactId",
      "short" : "Identitet för vård- och omsorgskontakt",
      "definition" : "Identitet för vård- och omsorgskontakt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.nullified",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.nullified",
      "short" : "Anger om dokumentet makulerats i källsystemet",
      "definition" : "Anger om dokumentet makulerats i källsystemet",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.nullifiedReason",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordHeader.nullifiedReason",
      "short" : "Orsak till makulering. Villkor: Får ENBART anges om nullified = true.",
      "definition" : "Orsak till makulering. Villkor: Får ENBART anges om nullified = true.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody",
      "short" : "Vaccinationsjournalens innehåll",
      "definition" : "Vaccinationsjournalens innehåll",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord",
      "short" : "Administrativ information om vaccinationstillfället",
      "definition" : "Administrativ information om vaccinationstillfället",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.date",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.date",
      "short" : "Datum då vaccination(er) gavs",
      "definition" : "Datum då vaccination(er) gavs",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.patientPostalCode",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.patientPostalCode",
      "short" : "Postnummer för patientens senast kända bostadsadress",
      "definition" : "Postnummer för patientens senast kända bostadsadress",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.vaccinationUnstructuredNote",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.vaccinationUnstructuredNote",
      "short" : "Fritextsammanfattning av strukturerad information",
      "definition" : "Fritextsammanfattning av strukturerad information",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.riskCategory",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.riskCategory",
      "short" : "Patientens riskgruppstillhörighet vid vaccinationstillfället",
      "definition" : "Patientens riskgruppstillhörighet vid vaccinationstillfället",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.patientAdverseEffect",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.patientAdverseEffect",
      "short" : "Reaktioner hos patienten vid vaccinationstillfället",
      "definition" : "Reaktioner hos patienten vid vaccinationstillfället",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careGiverOrg",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careGiverOrg",
      "short" : "Information om juridisk vårdgivare",
      "definition" : "Information om juridisk vårdgivare",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careGiverOrg.orgUnitHSAId",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careGiverOrg.orgUnitHSAId",
      "short" : "HSA-id för organisationsenhet",
      "definition" : "HSA-id för organisationsenhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careGiverOrg.orgUnitName",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careGiverOrg.orgUnitName",
      "short" : "Namn på organisationsenhet",
      "definition" : "Namn på organisationsenhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careGiverOrg.orgUnitTelecom",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careGiverOrg.orgUnitTelecom",
      "short" : "Telefon",
      "definition" : "Telefon",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careGiverOrg.orgUnitEmail",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careGiverOrg.orgUnitEmail",
      "short" : "E-post",
      "definition" : "E-post",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careGiverOrg.orgUnitAddress",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careGiverOrg.orgUnitAddress",
      "short" : "Postadress",
      "definition" : "Postadress",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careGiverOrg.orgUnitLocation",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careGiverOrg.orgUnitLocation",
      "short" : "Plats/ort",
      "definition" : "Plats/ort",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careGiverContact",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careGiverContact",
      "short" : "Kontaktperson hos juridiskt ansvarig vårdgivare",
      "definition" : "Kontaktperson hos juridiskt ansvarig vårdgivare",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careGiverContact.actorId",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careGiverContact.actorId",
      "short" : "Identifierare för aktören",
      "definition" : "Identifierare för aktören",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careGiverContact.actorName",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careGiverContact.actorName",
      "short" : "Namn på aktören",
      "definition" : "Namn på aktören",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.sourceSystemName",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.sourceSystemName",
      "short" : "Klartextnamn på källsystemet/organisationen",
      "definition" : "Klartextnamn på källsystemet/organisationen",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.sourceSystemProductName",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.sourceSystemProductName",
      "short" : "Källsystemets produktnamn",
      "definition" : "Källsystemets produktnamn",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.sourceSystemProductVersion",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.sourceSystemProductVersion",
      "short" : "Källsystemets produktversion",
      "definition" : "Källsystemets produktversion",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.sourceSystemContact",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.sourceSystemContact",
      "short" : "Kontaktuppgifter till källsystemsansvarig",
      "definition" : "Kontaktuppgifter till källsystemsansvarig",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.sourceSystemContact.actorId",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.sourceSystemContact.actorId",
      "short" : "Identifierare",
      "definition" : "Identifierare",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.sourceSystemContact.actorName",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.sourceSystemContact.actorName",
      "short" : "Namn",
      "definition" : "Namn",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careUnitSmiId",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.registrationRecord.careUnitSmiId",
      "short" : "Utförande vårdenhetens registreringsId hos SMI (Folkhälsomyndigheten)",
      "definition" : "Utförande vårdenhetens registreringsId hos SMI (Folkhälsomyndigheten)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord",
      "short" : "Information om utförd vaccination",
      "definition" : "Information om utförd vaccination",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.vaccinationProgramName",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.vaccinationProgramName",
      "short" : "Information om vaccinationsprogram",
      "definition" : "Information om vaccinationsprogram",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.prescriberOrg",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.prescriberOrg",
      "short" : "Information om var vaccinationen ordinerats",
      "definition" : "Information om var vaccinationen ordinerats",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.prescriberOrg.orgUnitHSAId",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.prescriberOrg.orgUnitHSAId",
      "short" : "HSA-id",
      "definition" : "HSA-id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.prescriberOrg.orgUnitName",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.prescriberOrg.orgUnitName",
      "short" : "Namn",
      "definition" : "Namn",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.prescriberPerson",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.prescriberPerson",
      "short" : "Information om vem som ordinerat/förskrivit",
      "definition" : "Information om vem som ordinerat/förskrivit",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.prescriberPerson.actorId",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.prescriberPerson.actorId",
      "short" : "Identifierare",
      "definition" : "Identifierare",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.prescriberPerson.actorName",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.prescriberPerson.actorName",
      "short" : "Namn",
      "definition" : "Namn",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.performerOrg",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.performerOrg",
      "short" : "Information om vårdenhet som utfört vaccinationen",
      "definition" : "Information om vårdenhet som utfört vaccinationen",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.performerOrg.orgUnitHSAId",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.performerOrg.orgUnitHSAId",
      "short" : "HSA-id",
      "definition" : "HSA-id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.performerOrg.orgUnitName",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.performerOrg.orgUnitName",
      "short" : "Namn",
      "definition" : "Namn",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.performer",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.performer",
      "short" : "Information om vem som administrerat vaccineringen",
      "definition" : "Information om vem som administrerat vaccineringen",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.performer.actorId",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.performer.actorId",
      "short" : "Identifierare",
      "definition" : "Identifierare",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.performer.actorName",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.performer.actorName",
      "short" : "Namn",
      "definition" : "Namn",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.anatomicalSite",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.anatomicalSite",
      "short" : "Var på kroppen vaccinet givits",
      "definition" : "Var på kroppen vaccinet givits",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.route",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.route",
      "short" : "Hur vaccinet givits (administrationsväg)",
      "definition" : "Hur vaccinet givits (administrationsväg)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.dose",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.dose",
      "short" : "Mängd vaccin som givits",
      "definition" : "Mängd vaccin som givits",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.dose.quantity",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.dose.quantity",
      "short" : "Mängd preparat som givits (strukturerad form)",
      "definition" : "Mängd preparat som givits (strukturerad form)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.dose.displayName",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.dose.displayName",
      "short" : "Fritextbeskrivning av mängd vaccin, t.ex. '1 ml'",
      "definition" : "Fritextbeskrivning av mängd vaccin, t.ex. '1 ml'",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.isDoseComplete",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.isDoseComplete",
      "short" : "True om vaccinering räknas som hel dos",
      "definition" : "True om vaccinering räknas som hel dos",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.doseOrdinalNumber",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.doseOrdinalNumber",
      "short" : "Anger vilken dos i ordningen",
      "definition" : "Anger vilken dos i ordningen",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.numberOfPrescribedDoses",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.numberOfPrescribedDoses",
      "short" : "Antal delvaccinationer för hel dos",
      "definition" : "Antal delvaccinationer för hel dos",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.sourceDescription",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.sourceDescription",
      "short" : "Fritext om källa för efterregistrerad vaccinering",
      "definition" : "Fritext om källa för efterregistrerad vaccinering",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.commentPrescription",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.commentPrescription",
      "short" : "Fritext: instruktioner från ordination",
      "definition" : "Fritext: instruktioner från ordination",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.commentAdministration",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.commentAdministration",
      "short" : "Fritext: kommentarer vid vaccinering",
      "definition" : "Fritext: kommentarer vid vaccinering",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.patientAdverseEffect",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.patientAdverseEffect",
      "short" : "Reaktioner för det specifika administreringstillfället",
      "definition" : "Reaktioner för det specifika administreringstillfället",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.typeOfVaccine",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.typeOfVaccine",
      "short" : "Vaccintyp (vilka sjukdomar vaccinet skyddar emot)",
      "definition" : "Vaccintyp (vilka sjukdomar vaccinet skyddar emot)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.vaccineName",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.vaccineName",
      "short" : "Vaccinets produktnamn (NPL-id rekommenderas)",
      "definition" : "Vaccinets produktnamn (NPL-id rekommenderas)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.vaccineBatchId",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.vaccineBatchId",
      "short" : "Batchnummer för vaccinets tillverkning",
      "definition" : "Batchnummer för vaccinets tillverkning",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.vaccineManufacturer",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.vaccineManufacturer",
      "short" : "Namn på vaccintillverkaren",
      "definition" : "Namn på vaccintillverkaren",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.vaccineTargetDisease",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.vaccineTargetDisease",
      "short" : "Sjukdomar vaccinet skyddar emot",
      "definition" : "Sjukdomar vaccinet skyddar emot",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.vaccinationUniqueReference",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.administrationRecord.vaccinationUniqueReference",
      "short" : "Unik referens till källsystemets vaccinationsinformation",
      "definition" : "Unik referens till källsystemets vaccinationsinformation",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.additionalPatientInformation",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.additionalPatientInformation",
      "short" : "Ytterligare patientinformation",
      "definition" : "Ytterligare patientinformation",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.additionalPatientInformation.dateOfBirth",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.additionalPatientInformation.dateOfBirth",
      "short" : "Patientens födelsedatum",
      "definition" : "Patientens födelsedatum",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.additionalPatientInformation.gender",
      "path" : "inera-ehds-lm-vaccination-history.vaccinationMedicalRecord.vaccinationMedicalRecordBody.additionalPatientInformation.gender",
      "short" : "Patientens kön. KV Kön (OID 1.2.752.129.2.2.1.1) bör användas. CVType-begränsning (Regel): originalText är förbjudet (0..0) — code, codeSystem och displayName ska anges.",
      "definition" : "Patientens kön. KV Kön (OID 1.2.752.129.2.2.1.1) bör användas. CVType-begränsning (Regel): originalText är förbjudet (0..0) — code, codeSystem och displayName ska anges.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.result",
      "path" : "inera-ehds-lm-vaccination-history.result",
      "short" : "Svarsstatus",
      "definition" : "Svarsstatus",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.result.resultCode",
      "path" : "inera-ehds-lm-vaccination-history.result.resultCode",
      "short" : "OK, INFO eller ERROR",
      "definition" : "OK, INFO eller ERROR",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://fhir.inera.se/ig/ehds-tk/ValueSet/resultcode-vs"
      }
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.result.errorCode",
      "path" : "inera-ehds-lm-vaccination-history.result.errorCode",
      "short" : "Sätts om resultCode är ERROR",
      "definition" : "Sätts om resultCode är ERROR",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://fhir.inera.se/ig/ehds-tk/ValueSet/errorcode-vs"
      }
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.result.subcode",
      "path" : "inera-ehds-lm-vaccination-history.result.subcode",
      "short" : "Inga subkoder specificerade",
      "definition" : "Inga subkoder specificerade",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.result.logId",
      "path" : "inera-ehds-lm-vaccination-history.result.logId",
      "short" : "UUID för felsökning hos producent",
      "definition" : "UUID för felsökning hos producent",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-vaccination-history.result.message",
      "path" : "inera-ehds-lm-vaccination-history.result.message",
      "short" : "Beskrivande text för användaren",
      "definition" : "Beskrivande text för användaren",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
