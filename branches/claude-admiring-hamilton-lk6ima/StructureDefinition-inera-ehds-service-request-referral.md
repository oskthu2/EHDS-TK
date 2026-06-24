# SE EHDS ServiceRequest – Konsultationsremiss (GetReferralOutcome) - Inera EHDS Tjänstekontrakt – FHIR Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SE EHDS ServiceRequest – Konsultationsremiss (GetReferralOutcome)**

## Resource Profile: SE EHDS ServiceRequest – Konsultationsremiss (GetReferralOutcome) 

| | |
| :--- | :--- |
| *Official URL*:https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-service-request-referral | *Version*:0.1.0 |
| Draft as of 2026-06-24 | *Computable Name*:IneraEHDSServiceRequestReferral |

 
Profil för konsultationsremisser mappat från RIVTA-tjänstekontraktet GetReferralOutcome (clinicalprocess:healthcond:actoutcome v3.2). Täcker NPÖ 3.2 och 1177 Journal 3.2. 
Notera: GetReferralOutcome returnerar remissvaret, inte remissen i sig. Remissens metadata finns under referralOutcomeBody.referral och är begränsad till id, orsak, tid och avsändare. Inget mottagarfält, prioritet, typ eller diagnos finns i TKBn för remissens del. 

**Användningar:**

* Referera till denna Profil: [SE EHDS DiagnosticReport – Konsultationssvar (GetReferralOutcome)](StructureDefinition-inera-ehds-diagnostic-report-referral.md) and [SE EHDS Task – Remisstatus (GetRequestActivities)](StructureDefinition-inera-ehds-task.md)

Du kan också kontrollera [användningar i FHIR IG-statistiken](https://packages2.fhir.org/xig/inera.ehds.tk|current/StructureDefinition/inera-ehds-service-request-referral)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-inera-ehds-service-request-referral.csv), [Excel](StructureDefinition-inera-ehds-service-request-referral.xlsx), [Schematron](StructureDefinition-inera-ehds-service-request-referral.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "inera-ehds-service-request-referral",
  "url" : "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-service-request-referral",
  "version" : "0.1.0",
  "name" : "IneraEHDSServiceRequestReferral",
  "title" : "SE EHDS ServiceRequest – Konsultationsremiss (GetReferralOutcome)",
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
  "description" : "Profil för konsultationsremisser mappat från RIVTA-tjänstekontraktet GetReferralOutcome\n(clinicalprocess:healthcond:actoutcome v3.2). Täcker NPÖ 3.2 och 1177 Journal 3.2.\n\nNotera: GetReferralOutcome returnerar remissvaret, inte remissen i sig. Remissens\nmetadata finns under referralOutcomeBody.referral och är begränsad till id, orsak,\ntid och avsändare. Inget mottagarfält, prioritet, typ eller diagnos finns i TKBn\nför remissens del.",
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
    "identity" : "quick",
    "uri" : "http://siframework.org/cqf",
    "name" : "Quality Improvement and Clinical Knowledge (QUICK)"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "ServiceRequest",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/ServiceRequest",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "ServiceRequest",
      "path" : "ServiceRequest"
    },
    {
      "id" : "ServiceRequest.meta.source",
      "path" : "ServiceRequest.meta.source",
      "short" : "Källsystem HSA-id (referralOutcomeHeader.sourceSystemHSAId)",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.identifier",
      "path" : "ServiceRequest.identifier",
      "short" : "Remissidentifierare (referralOutcomeBody.referral.referralId)",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.status",
      "path" : "ServiceRequest.status",
      "short" : "Alltid 'active' – härledd (remissdata i GetReferralOutcome representerar aktiva remisser)",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.intent",
      "path" : "ServiceRequest.intent",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.code",
      "path" : "ServiceRequest.code",
      "short" : "Ej direkt mappad – TKBn har inget kodat tjänstebegäransfält i remissblocket",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.subject",
      "path" : "ServiceRequest.subject",
      "short" : "Patient (referralOutcomeHeader.patientId)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.authoredOn",
      "path" : "ServiceRequest.authoredOn",
      "short" : "Remisstidpunkt (referralOutcomeBody.referral.referralTime)",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.requester",
      "path" : "ServiceRequest.requester",
      "short" : "Remitterande personal (referralOutcomeBody.referral.referralAuthor)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.note",
      "path" : "ServiceRequest.note",
      "short" : "Remissorsak (referralOutcomeBody.referral.referralReason)",
      "mustSupport" : true
    }]
  }
}

```
