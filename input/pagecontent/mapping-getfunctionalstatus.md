# GetFunctionalStatus – Funktionstillstånd och ADL

**Tjänstekontrakt:** `clinicalprocess:healthcond:description` GetFunctionalStatus v2.0  
**FHIR-profil:** [SEEHDSConditionFunctional](StructureDefinition-se-ehds-condition-functional.html)  
**Logisk modell:** [SEEHDSLMFunctionalStatus](StructureDefinition-se-ehds-lm-functional-status.html)  
**Krävs för NPÖ:** Ja (v2.0) | **Krävs för 1177 Journal:** Ja (v2.0)  
**EHDS-koppling:** Kan stödja funktionsstatus i Patient Summary (ICF-baserad)

---

## Mappningstabell

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `functionalStatusHeader.patientId` | 1..1 | `Condition.subject.identifier` | OID→URI |
| `functionalStatusHeader.sourceSystemHSAId` | 1..1 | `Condition.meta.source` | |
| `functionalStatusHeader.documentTime` | 1..1 | `Condition.recordedDate` | |
| `functionalStatusHeader.accountableHealthcareProfessional` | 1..1 | `Condition.recorder` | |
| `functionalStatusHeader.legalAuthenticator` | 0..1 | `Condition.asserter` | |
| `functionalStatusHeader.careProviderHSAId` | 1..1 | `Provenance.agent[custodian]` | Yttre Sparr |
| `functionalStatusHeader.careUnitHSAId` | 1..1 | `Provenance.agent[author]` | Inre Sparr |
| `functionalStatusTypeCode` | 1..1 | `Condition.code` | ICF-kod |
| `functionalStatusType` | 0..1 | `Condition.category` | |
| `functionalStatusStatus` | 1..1 | `Condition.clinicalStatus` | Aktuell→active |
| `functionalStatusSeverity` | 0..1 | `Condition.severity` | |
| `functionalStatusTimePeriod.start` | 0..1 | `Condition.onsetDateTime` | |
| `functionalStatusTimePeriod.end` | 0..1 | `Condition.abatementDateTime` | |
| `functionalStatusComment` | 0..1 | `Condition.note.text` | |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `careProviderHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `careUnitHSAId` |
| `agent[assembler]` | EHDS-bryggan | `EHDS_BRIDGE_HSA_ID` |
