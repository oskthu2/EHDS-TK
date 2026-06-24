# GetMedicationHistory - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **GetMedicationHistory**

## Logical Model: GetMedicationHistory 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-medication-history | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSLMMedicationHistory |

 
Logisk modell för tjänstekontraktet GetMedicationHistory (RIV-TA urn:riv:clinicalprocess:activityprescription:actoutcome:GetMedicationHistoryResponder:2). Representerar responsens informationsstruktur — läkemedelshistorik per patient. 
OBS: Kontraktet är tämligen omfattande. Se tillämpningsanvisningen (AB_clinicalprocess_activityprescription_actoutcome.docx) för implementationsdetaljer. 

**Användningar:**

* Denna Logisk modell används inte av några profiler i denna implementationsguide

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-lm-medication-history)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-lm-medication-history.csv), [Excel](StructureDefinition-inera-ehds-lm-medication-history.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-lm-medication-history",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-be-target"
  }],
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-medication-history",
  "version" : "0.1.0",
  "name" : "IneraEHDSLMMedicationHistory",
  "title" : "GetMedicationHistory",
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
  "description" : "Logisk modell för tjänstekontraktet GetMedicationHistory\n(RIV-TA urn:riv:clinicalprocess:activityprescription:actoutcome:GetMedicationHistoryResponder:2).\nRepresenterar responsens informationsstruktur — läkemedelshistorik per patient.\n\nOBS: Kontraktet är tämligen omfattande. Se tillämpningsanvisningen\n(AB_clinicalprocess_activityprescription_actoutcome.docx) för implementationsdetaljer.",
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
  "type" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-lm-medication-history",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "inera-ehds-lm-medication-history",
      "path" : "inera-ehds-lm-medication-history",
      "short" : "GetMedicationHistory",
      "definition" : "Logisk modell för tjänstekontraktet GetMedicationHistory\n(RIV-TA urn:riv:clinicalprocess:activityprescription:actoutcome:GetMedicationHistoryResponder:2).\nRepresenterar responsens informationsstruktur — läkemedelshistorik per patient.\n\nOBS: Kontraktet är tämligen omfattande. Se tillämpningsanvisningen\n(AB_clinicalprocess_activityprescription_actoutcome.docx) för implementationsdetaljer."
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord",
      "short" : "Patientens läkemedelshistorik",
      "definition" : "En läkemedelsjournalpost per ordination. En patient kan ha många poster.\nKardinalitet: Valfri, lista.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader",
      "short" : "Basinformation om dokumentet",
      "definition" : "Basinformation om dokumentet",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.documentId",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.documentId",
      "short" : "Identifierare för uppgift (vanligtvis ordinations-id)",
      "definition" : "Vanligtvis ordinations-id eller ordinations-id kompletterat med löpnummer.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.sourceSystemHSAId",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.sourceSystemHSAId",
      "short" : "Källsystemets HSA-id",
      "definition" : "Källsystemets HSA-id",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.documentTitle",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.documentTitle",
      "short" : "Titel (ej tillämpligt — 0..0 per TKB)",
      "definition" : "Titel (ej tillämpligt — 0..0 per TKB)",
      "min" : 0,
      "max" : "0",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.patientId",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.patientId",
      "short" : "Personidentifierare för patienten",
      "definition" : "Personidentifierare för patienten",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional",
      "short" : "Dokumentationsansvarig",
      "definition" : "Dokumentationsansvarig",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.authorTime",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.authorTime",
      "short" : "Tidpunkt för dokumentation",
      "definition" : "Tidpunkt för dokumentation",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId",
      "short" : "HSA-id för personal",
      "definition" : "HSA-id för personal",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalName",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalName",
      "short" : "Namn på personal",
      "definition" : "Namn på personal",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode",
      "short" : "Befattning (KV Befattning OID 1.2.752.129.2.2.1.4)",
      "definition" : "Befattning (KV Befattning OID 1.2.752.129.2.2.1.4)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit",
      "short" : "Organisationsenhet",
      "definition" : "Organisationsenhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId",
      "short" : "HSA-id för organisationsenhet",
      "definition" : "HSA-id för organisationsenhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName",
      "short" : "Namn på organisationsenhet",
      "definition" : "Namn på organisationsenhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom",
      "short" : "Telefon",
      "definition" : "Telefon",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail",
      "short" : "E-post",
      "definition" : "E-post",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress",
      "short" : "Postadress",
      "definition" : "Postadress",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation",
      "short" : "Plats/ort",
      "definition" : "Plats/ort",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalcareUnitHSAId",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalcareUnitHSAId",
      "short" : "HSA-id för vårdenhet",
      "definition" : "HSA-id för vårdenhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalcareGiverHSAId",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalcareGiverHSAId",
      "short" : "HSA-id/id för vårdgivare",
      "definition" : "HSA-id/id för vårdgivare",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.legalAuthenticator",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.legalAuthenticator",
      "short" : "Information om signering",
      "definition" : "Information om signering",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.legalAuthenticator.signatureTime",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.legalAuthenticator.signatureTime",
      "short" : "Tidpunkt för signering",
      "definition" : "Tidpunkt för signering",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.legalAuthenticator.legalAuthenticatorHSAId",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.legalAuthenticator.legalAuthenticatorHSAId",
      "short" : "HSA-id för signerande personal",
      "definition" : "HSA-id för signerande personal",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.legalAuthenticator.legalAuthenticatorName",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.legalAuthenticator.legalAuthenticatorName",
      "short" : "Namn på signerande personal",
      "definition" : "Namn på signerande personal",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.legalAuthenticator.legalAuthenticatorRoleCode",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.legalAuthenticator.legalAuthenticatorRoleCode",
      "short" : "Signerandes befattning (ej tillämpligt)",
      "definition" : "N/A — legalAuthenticatorRoleCode är 0..0 per TKB för GetMedicationHistory.",
      "min" : 0,
      "max" : "0",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.approvedForPatient",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.approvedForPatient",
      "short" : "Ansvarig vårdpersonals beslut om synlighet (PDL-prövning)",
      "definition" : "Ansvarig vårdpersonals beslut om synlighet (PDL-prövning)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.careContactId",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.careContactId",
      "short" : "Identitet för vård- och omsorgskontakt",
      "definition" : "Identitet för vård- och omsorgskontakt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.nullified",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.nullified",
      "short" : "Makulerat (ej tillämpligt)",
      "definition" : "N/A — GetMedicationHistory stödjer inte nullified. Elementet är 0..0 per TKB.",
      "min" : 0,
      "max" : "0",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.nullifiedReason",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordHeader.nullifiedReason",
      "short" : "Makuleringsskäl (ej tillämpligt)",
      "definition" : "N/A — GetMedicationHistory stödjer inte nullifiedReason. Elementet är 0..0 per TKB.",
      "min" : 0,
      "max" : "0",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody",
      "short" : "Läkemedelshistorikens innehåll",
      "definition" : "Läkemedelshistorikens innehåll",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription",
      "short" : "Läkemedelsordination",
      "definition" : "Läkemedelsordination",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriptionId",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriptionId",
      "short" : "Ordinations-id",
      "definition" : "Unik identifierare för aktuell läkemedelsordination.\nroot = UUID eller OID som pekar på källsystem.\nextension = ordinations-id unikt inom källsystemet.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.typeOfPrescription",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.typeOfPrescription",
      "short" : "Ordinationstyp (I=insättning, U=utsättning)",
      "definition" : "Ordinationstyp (I=insättning, U=utsättning)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://fhir.inera.se/ig/ehds-tk/ValueSet/typeofprescription-vs"
      }
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriptionStatus",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriptionStatus",
      "short" : "Ordinationsstatus (Active/Inactive)",
      "definition" : "Ordinationsstatus (Active/Inactive)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://fhir.inera.se/ig/ehds-tk/ValueSet/prescriptionstatus-vs"
      }
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriptionNote",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriptionNote",
      "short" : "Notat om ordinationen (del av Läkemedelsberättelse)",
      "definition" : "Notat om ordinationen (del av Läkemedelsberättelse)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.principalPrescriptionReason",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.principalPrescriptionReason",
      "short" : "Ordinationshuvudorsak",
      "definition" : "Den eller de viktigaste av de ordinationsorsaker som anges.\nAnges med Socialstyrelsens kodsystem för ordinationsorsaker.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.principalPrescriptionReason.reason",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.principalPrescriptionReason.reason",
      "short" : "Ordinationsorsak (Socialstyrelsens kodsystem)",
      "definition" : "Ordinationsorsak (Socialstyrelsens kodsystem)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.principalPrescriptionReason.otherReason",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.principalPrescriptionReason.otherReason",
      "short" : "Beskrivning om 'Annan ordinationsorsak' väljs",
      "definition" : "Beskrivning om 'Annan ordinationsorsak' väljs",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.additionalPrescriptionReason",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.additionalPrescriptionReason",
      "short" : "Övriga ordinationsorsaker",
      "definition" : "Anges en övrig ordinationsorsak måste minst en ordinationshuvudorsak vara angiven.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.additionalPrescriptionReason.reason",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.additionalPrescriptionReason.reason",
      "short" : "Ordinationsorsak",
      "definition" : "Ordinationsorsak",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.additionalPrescriptionReason.otherReason",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.additionalPrescriptionReason.otherReason",
      "short" : "Beskrivning om 'Annan ordinationsorsak' väljs",
      "definition" : "Beskrivning om 'Annan ordinationsorsak' väljs",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.evaluationTime",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.evaluationTime",
      "short" : "Nästa planerade utvärderingstidpunkt",
      "definition" : "Nästa planerade utvärderingstidpunkt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.treatmentPurpose",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.treatmentPurpose",
      "short" : "Behandlingsändamål",
      "definition" : "Behandlingsändamål",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriptionChainId",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriptionChainId",
      "short" : "Ordinationskedje-id",
      "definition" : "Ordinationskedje-id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.precedingPrescriptionId",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.precedingPrescriptionId",
      "short" : "Föregående ordinations-id",
      "definition" : "Föregående ordinations-id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.succeedingPrescriptionId",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.succeedingPrescriptionId",
      "short" : "Efterföljande ordinations-id",
      "definition" : "Efterföljande ordinations-id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber",
      "short" : "Ordinatör",
      "definition" : "Icke att beblandas med accountableHealthcareProfessional (den som registrerat).\nVillkor (Regel 1.8): Obligatorisk om selfMedication = false.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.authorTime",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.authorTime",
      "short" : "Beslutstidpunkt/ordinationstidpunkt",
      "definition" : "Beslutstidpunkt/ordinationstidpunkt",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalHSAId",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalHSAId",
      "short" : "Ordinatörens HSA-id",
      "definition" : "Ordinatörens HSA-id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalName",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalName",
      "short" : "Namn på ordinatören",
      "definition" : "Namn på ordinatören",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalRoleCode",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalRoleCode",
      "short" : "Ordinatörens befattning",
      "definition" : "Ordinatörens befattning",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalOrgUnit",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalOrgUnit",
      "short" : "Organisation ordinatören är uppdragstagare på",
      "definition" : "Organisation ordinatören är uppdragstagare på",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalOrgUnit.orgUnitHSAId",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalOrgUnit.orgUnitHSAId",
      "short" : "HSA-id",
      "definition" : "HSA-id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalOrgUnit.orgUnitName",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalOrgUnit.orgUnitName",
      "short" : "Namn",
      "definition" : "Namn",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalOrgUnit.orgUnitTelecom",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalOrgUnit.orgUnitTelecom",
      "short" : "Telefon",
      "definition" : "Telefon",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalOrgUnit.orgUnitEmail",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalOrgUnit.orgUnitEmail",
      "short" : "E-post",
      "definition" : "E-post",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalOrgUnit.orgUnitAddress",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalOrgUnit.orgUnitAddress",
      "short" : "Postadress",
      "definition" : "Postadress",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalOrgUnit.orgUnitLocation",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalOrgUnit.orgUnitLocation",
      "short" : "Plats/ort",
      "definition" : "Plats/ort",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.evaluator",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.evaluator",
      "short" : "'Utvärderat av' — person som utvärderat utfallet",
      "definition" : "'Utvärderat av' — person som utvärderat utfallet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.evaluator.authorTime",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.evaluator.authorTime",
      "short" : "Faktisk utvärderingstidpunkt",
      "definition" : "Faktisk utvärderingstidpunkt",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.evaluator.healthcareProfessionalHSAId",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.evaluator.healthcareProfessionalHSAId",
      "short" : "Utvärderande persons HSA-id",
      "definition" : "Utvärderande persons HSA-id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.evaluator.healthcareProfessionalName",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.evaluator.healthcareProfessionalName",
      "short" : "Namn på utvärderande person",
      "definition" : "Namn på utvärderande person",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.evaluator.healthcareProfessionalRoleCode",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.evaluator.healthcareProfessionalRoleCode",
      "short" : "Utvärderande persons befattning",
      "definition" : "Utvärderande persons befattning",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.evaluator.healthcareProfessionalOrgUnit",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.evaluator.healthcareProfessionalOrgUnit",
      "short" : "Utvärderande persons organisation",
      "definition" : "Utvärderande persons organisation",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.evaluator.healthcareProfessionalOrgUnit.orgUnitHSAId",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.evaluator.healthcareProfessionalOrgUnit.orgUnitHSAId",
      "short" : "HSA-id",
      "definition" : "HSA-id",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.evaluator.healthcareProfessionalOrgUnit.orgUnitName",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.evaluator.healthcareProfessionalOrgUnit.orgUnitName",
      "short" : "Namn",
      "definition" : "Namn",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.startOfFirstTreatment",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.startOfFirstTreatment",
      "short" : "Första insättningstidpunkt (beräknad från ordinationskedjan)",
      "definition" : "Första insättningstidpunkt (beräknad från ordinationskedjan)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.startOfTreatment",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.startOfTreatment",
      "short" : "Insättningstidpunkt. Villkor (Regel 1.8): Obligatorisk om typeOfPrescription = 'I' (insättning).",
      "definition" : "Insättningstidpunkt. Villkor (Regel 1.8): Obligatorisk om typeOfPrescription = 'I' (insättning).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.endOfTreatment",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.endOfTreatment",
      "short" : "Utsättningstidpunkt",
      "definition" : "Utsättningstidpunkt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.endOfTreatmentReason",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.endOfTreatmentReason",
      "short" : "Utsättningsorsak",
      "definition" : "Utsättningsorsak",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.selfMedication",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.selfMedication",
      "short" : "Anger om ordination är utfärdad av patienten själv",
      "definition" : "Anger om ordination är utfärdad av patienten själv",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug",
      "short" : "Läkemedelsval (ett av: unstructured/merchandise/drugArticle/drug/generics)",
      "definition" : "OBS: Ett och endast ett av följande alternativ ska anges.\nASSUME-ACT-003: XOR-villkor kan inte uttryckas direkt i FSH-kardinaliteten (alla är 0..1).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.comment",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.comment",
      "short" : "Kommentar om läkemedelsval",
      "definition" : "Kommentar om läkemedelsval",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.unstructuredDrugInformation",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.unstructuredDrugInformation",
      "short" : "Fritextval (extemporeberedning, licensläkemedel m.m.)",
      "definition" : "Fritextval (extemporeberedning, licensläkemedel m.m.)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.unstructuredDrugInformation.unstructuredInformation",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.unstructuredDrugInformation.unstructuredInformation",
      "short" : "Fritextbeskrivning",
      "definition" : "Fritextbeskrivning",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.merchandise",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.merchandise",
      "short" : "Handelsvara",
      "definition" : "Handelsvara",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.merchandise.articleNumber",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.merchandise.articleNumber",
      "short" : "Varunummer (från SIL)",
      "definition" : "Varunummer (från SIL)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.drugArticle",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.drugArticle",
      "short" : "Läkemedelsartikel",
      "definition" : "Läkemedelsartikel",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.drugArticle.nplPackId",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.drugArticle.nplPackId",
      "short" : "NPL pack-id (OID 1.2.752.129.2.1.5.2)",
      "definition" : "NPL pack-id (OID 1.2.752.129.2.1.5.2)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.drug",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.drug",
      "short" : "Läkemedelsprodukt",
      "definition" : "Läkemedelsprodukt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.drug.nplId",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.drug.nplId",
      "short" : "NPL-id (OID 1.2.752.129.2.1.5.1)",
      "definition" : "NPL-id (OID 1.2.752.129.2.1.5.1)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.drug.atcCode",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.drug.atcCode",
      "short" : "ATC-kod (OID 1.2.752.129.2.2.3.1.1)",
      "definition" : "ATC-kod (OID 1.2.752.129.2.2.3.1.1)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.drug.routeOfAdministration",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.drug.routeOfAdministration",
      "short" : "Administreringssätt",
      "definition" : "Administreringssätt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.drug.pharmaceuticalForm",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.drug.pharmaceuticalForm",
      "short" : "Läkemedelsform (t.ex. Tablett)",
      "definition" : "Läkemedelsform (t.ex. Tablett)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.drug.strength",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.drug.strength",
      "short" : "Styrka (t.ex. 20.0)",
      "definition" : "Styrka (t.ex. 20.0)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "decimal"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.drug.strengthUnit",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.drug.strengthUnit",
      "short" : "Enhet på styrka (t.ex. mg)",
      "definition" : "Enhet på styrka (t.ex. mg)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.generics",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.generics",
      "short" : "Generiskt läkemedelsval",
      "definition" : "Generiskt läkemedelsval",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.generics.substance",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.generics.substance",
      "short" : "Substansgrupp",
      "definition" : "Substansgrupp",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.generics.strength",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.generics.strength",
      "short" : "Önskad styrka",
      "definition" : "Önskad styrka",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.generics.form",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.drug.generics.form",
      "short" : "Läkemedelsform",
      "definition" : "Läkemedelsform",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage",
      "short" : "Dosering",
      "definition" : "Dosering",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage.lengthOfTreatment",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage.lengthOfTreatment",
      "short" : "Behandlingstid",
      "definition" : "Behandlingstid",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage.lengthOfTreatment.treatmentInterval",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage.lengthOfTreatment.treatmentInterval",
      "short" : "Tidsintervall för behandling (PQIntervalType)",
      "definition" : "Tidsintervall för behandling (PQIntervalType)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Range"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage.lengthOfTreatment.isMaximumTreatmentTime",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage.lengthOfTreatment.isMaximumTreatmentTime",
      "short" : "Om true: maximalt tillåten tid",
      "definition" : "Om true: maximalt tillåten tid",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage.dosageInstruction",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage.dosageInstruction",
      "short" : "Doseringsanvisning",
      "definition" : "Doseringsanvisning",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage.unitDose",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage.unitDose",
      "short" : "Doseringsenhet",
      "definition" : "Doseringsenhet",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage.shortNotation",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage.shortNotation",
      "short" : "Kortnotation, t.ex. '1x2'",
      "definition" : "Kortnotation, t.ex. '1x2'",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage.setDosage",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage.setDosage",
      "short" : "Fastdosering",
      "definition" : "Dosering där ordinatören har bestämt mängd och periodicitet.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage.maximumDosage",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage.maximumDosage",
      "short" : "Maxdosering",
      "definition" : "Den högsta tillåtna mängden under en viss period.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage.conditionalDosage",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage.conditionalDosage",
      "short" : "Villkorsdosering",
      "definition" : "Ordinerad mängd och periodicitet som gäller om ett visst villkor är uppfyllt.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage.conditionalDosage.conditionDescription",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dosage.conditionalDosage.conditionDescription",
      "short" : "Villkorstext",
      "definition" : "Villkorstext",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dispensationAuthorization",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.dispensationAuthorization",
      "short" : "Förskrivning",
      "definition" : "Se XSD DispensationAuthorizationType för fullständig struktur.\nNyckelfält: dispensationAuthorizationId (1..1), dispensationAuthorizer (1..1,\ncareUnitHSAId/careGiverHSAId=0..0), prescriptionSignatura (1..1),\ndrug (0..1 XOR: unstructured/merchandise/drugArticle/drug/generics, samma mönster som ordination),\ntotalAmount/packageUnit (båda eller ingetdera — Regel 1.8), validUntil (0..1),\nnonReplaceable (0..1, enum Prescriber/Patient).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.administration",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.administration",
      "short" : "Information om administrering av läkemedel",
      "definition" : "Bara administreringstillfällen som faktiskt ägt rum kan anges.\nSe XSD AdministrationType för fullständig struktur.\nNyckelfält: administrationId (1..1), administrationTime (1..1, start/end —\nminst ett av start/end — Regel 1.8), administeringHealthcareProfessional (1..1,\ncareUnitHSAId/careGiverHSAId=0..0), routeOfAdministration (0..1),\ndrug (0..1 XOR), administrationComment (0..1).",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.relation",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.medicationPrescription.relation",
      "short" : "Sambandsklass",
      "definition" : "Alla meddelandeposter som i ordinationen pekas ut med samma relationstyp.\nSe XSD RelationType för fullständig struktur.\nNyckelfält: code (1..1 CVType), referredInformation (1..*:\nid/IIType 1..1, type/CVType 1..1 originalText 'caa-ga'/'chb-go',\ninformationOwner/InformationOwnerType 1..1).",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.additionalPatientInformation",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.additionalPatientInformation",
      "short" : "Ytterligare patientinformation",
      "definition" : "Ytterligare patientinformation",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.additionalPatientInformation.dateOfBirth",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.additionalPatientInformation.dateOfBirth",
      "short" : "Patientens födelsedatum",
      "definition" : "Patientens födelsedatum",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.additionalPatientInformation.gender",
      "path" : "inera-ehds-lm-medication-history.medicationMedicalRecord.medicationMedicalRecordBody.additionalPatientInformation.gender",
      "short" : "Patientens kön. KV Kön (OID 1.2.752.129.2.2.1.1) bör användas. CVType-begränsning (Regel 1.6): originalText är förbjudet (0..0) för könsfältet — code, codeSystem och displayName ska anges.",
      "definition" : "Patientens kön. KV Kön (OID 1.2.752.129.2.2.1.1) bör användas. CVType-begränsning (Regel 1.6): originalText är förbjudet (0..0) för könsfältet — code, codeSystem och displayName ska anges.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.result",
      "path" : "inera-ehds-lm-medication-history.result",
      "short" : "Svarsstatus",
      "definition" : "Svarsstatus",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.result.resultCode",
      "path" : "inera-ehds-lm-medication-history.result.resultCode",
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
      "id" : "inera-ehds-lm-medication-history.result.errorCode",
      "path" : "inera-ehds-lm-medication-history.result.errorCode",
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
      "id" : "inera-ehds-lm-medication-history.result.subcode",
      "path" : "inera-ehds-lm-medication-history.result.subcode",
      "short" : "Inga subkoder specificerade",
      "definition" : "Inga subkoder specificerade",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.result.logId",
      "path" : "inera-ehds-lm-medication-history.result.logId",
      "short" : "UUID för felsökning hos producent",
      "definition" : "UUID för felsökning hos producent",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "inera-ehds-lm-medication-history.result.message",
      "path" : "inera-ehds-lm-medication-history.result.message",
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
