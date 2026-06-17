# GetMaternityMedicalHistory – Mödravård

**Tjänstekontrakt:** `clinicalprocess:healthcond:actoutcome` GetMaternityMedicalHistory v2.0  
**FHIR-profil:** [SEEHDSObservationMaternity](StructureDefinition-se-ehds-observation-maternity.html)  
**Logisk modell:** [SEEHDSLMMaternityMedicalHistory](StructureDefinition-se-ehds-lm-maternity-medical-history.html)  
**Krävs för NPÖ:** Ja (v2.0) | **Krävs för 1177 Journal:** Ja (v2.0)  
**EHDS-koppling:** Bakgrundsinformation i Patient Summary (beroende på urval och scenario)

---

## Mappningstabell

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `maternityHeader.patientId` | 1..1 | `Observation.subject.identifier` | OID→URI |
| `maternityHeader.sourceSystemHSAId` | 1..1 | `Observation.meta.source` | |
| `maternityHeader.documentTime` | 1..1 | `Observation.issued` | |
| `maternityHeader.accountableHealthcareProfessional` | 1..1 | `Observation.performer` | Reference(SEBasePractitionerRole) |
| `maternityHeader.careProviderHSAId` | 1..1 | `Provenance.agent[custodian]` | Yttre Sparr |
| `maternityHeader.careUnitHSAId` | 1..1 | `Provenance.agent[author]` | Inre Sparr |
| `maternityMedicalHistoryType` | 1..1 | `Observation.category` | |
| `maternityMedicalHistoryCode` | 0..1 | `Observation.code` | |
| `maternityMedicalHistoryTime` | 0..1 | `Observation.effectiveDateTime` | |
| `maternityMedicalHistoryResult` | 0..1 | `Observation.valueString` | Eller lämplig value[x]-typ |
| `maternityMedicalHistoryComment` | 0..1 | `Observation.note.text` | |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `careProviderHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `careUnitHSAId` |
| `agent[assembler]` | EHDS-bryggan | `EHDS_BRIDGE_HSA_ID` |
