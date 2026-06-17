# GetCarePlans – Vårdplan

**Tjänstekontrakt:** `clinicalprocess:logistics:logistics` GetCarePlans v2.0  
**FHIR-profil:** [SEEHDSCarePlan](StructureDefinition-se-ehds-care-plan.html)  
**Logisk modell:** [SEEHDSLMCarePlans](StructureDefinition-se-ehds-lm-care-plans.html)  
**Krävs för NPÖ:** Ja (v2.0) | **Krävs för 1177 Journal:** Ja (v2.0)  
**EHDS-koppling:** Stödjande vårdplaneringsinformation (ej separat EHDS-huvudkategori)

---

## Mappningstabell

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `carePlanHeader.patientId` | 1..1 | `CarePlan.subject.identifier` | OID→URI |
| `carePlanHeader.sourceSystemHSAId` | 1..1 | `CarePlan.meta.source` | |
| `carePlanHeader.documentTime` | 1..1 | `CarePlan.created` | |
| `carePlanHeader.accountableHealthcareProfessional` | 1..1 | `CarePlan.author` | Reference(SEBasePractitionerRole) |
| `carePlanHeader.careProviderHSAId` | 1..1 | `Provenance.agent[custodian]` | Yttre Sparr |
| `carePlanHeader.careUnitHSAId` | 1..1 | `Provenance.agent[author]` | Inre Sparr |
| `carePlanTitle` | 0..1 | `CarePlan.title` | |
| `carePlanType` | 0..1 | `CarePlan.category` | kv_vardplanstyp |
| `carePlanStatus` | 1..1 | `CarePlan.status` | Aktuell→active |
| `carePlanTimePeriod.start` | 0..1 | `CarePlan.period.start` | |
| `carePlanTimePeriod.end` | 0..1 | `CarePlan.period.end` | |
| `carePlanDescription` | 0..1 | `CarePlan.description` | |
| `plannedActivity.activityCode` | 0..1 | `CarePlan.activity.detail.code` | |
| `plannedActivity.activityDescription` | 0..1 | `CarePlan.activity.detail.description` | |
| `plannedActivity.activityTime` | 0..1 | `CarePlan.activity.detail.scheduledPeriod` | |
| `carePlanComment` | 0..1 | `CarePlan.note.text` | |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `careProviderHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `careUnitHSAId` |
| `agent[assembler]` | EHDS-bryggan | `EHDS_BRIDGE_HSA_ID` |
