# GetReferralOutcome – Konsultationsremiss

**Tjänstekontrakt:** `clinicalprocess:healthcond:actoutcome` GetReferralOutcome v3.1  
**FHIR-profiler:** [SEEHDSServiceRequestReferral](StructureDefinition-se-ehds-service-request-referral.html) | [SEEHDSDiagnosticReportReferral](StructureDefinition-se-ehds-diagnostic-report-referral.html)  
**Logisk modell:** [SEEHDSLMReferralOutcome](StructureDefinition-se-ehds-lm-referral-outcome.html)  
**Krävs för NPÖ:** Ja (v3.1) | **Krävs för 1177 Journal:** Ja (v3.1)  
**EHDS-koppling:** Relaterar till vårdprocess och resultat (ej separat EHDS-huvudkategori)

---

## Resurshierarki

```
SEEHDSServiceRequestReferral (remiss)
  └── SEEHDSDiagnosticReportReferral (konsultationssvar)
```

---

## Mappningstabell – SEEHDSServiceRequestReferral

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `referralHeader.patientId` | 1..1 | `ServiceRequest.subject.identifier` | OID→URI |
| `referralHeader.sourceSystemHSAId` | 1..1 | `ServiceRequest.meta.source` | |
| `referralHeader.documentTime` | 1..1 | `ServiceRequest.authoredOn` | |
| `referralHeader.referralAuthor` | 1..1 | `ServiceRequest.requester` | Reference(SEBasePractitionerRole) |
| `referralHeader.careProviderHSAId` | 1..1 | `Provenance.agent[custodian]` | Yttre Sparr |
| `referralHeader.careUnitHSAId` | 1..1 | `Provenance.agent[author]` | Inre Sparr |
| `referralType` | 0..1 | `ServiceRequest.category` | kv_remisstyp |
| `referralStatus` | 1..1 | `ServiceRequest.status` | |
| `referralPriority` | 0..1 | `ServiceRequest.priority` | |
| `referralReason` | 1..1 | `ServiceRequest.code.text` | Frågeställning |
| `referralDiagnosis` | 0..* | `ServiceRequest.reasonCode` | |
| `referralBody` | 0..1 | `ServiceRequest.note.text` | |
| `referralReceiver` | 0..1 | `ServiceRequest.performer` | Reference(SEBaseOrganization) |

---

## Mappningstabell – SEEHDSDiagnosticReportReferral

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `referralOutcome.referralOutcomeAuthor` | 0..1 | `DiagnosticReport.performer` | |
| `referralOutcome.outcomeTime` | 0..1 | `DiagnosticReport.issued` | |
| `referralOutcome.referralOutcomeStatus` | 0..1 | `DiagnosticReport.status` | |
| `referralOutcome.referralOutcomeBody` | 0..1 | `DiagnosticReport.conclusion` | |
| `referralOutcome.referralOutcomeComment` | 0..1 | `DiagnosticReport.note.text` | |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `careProviderHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `careUnitHSAId` |
| `agent[assembler]` | EHDS-bryggan | `EHDS_BRIDGE_HSA_ID` |
