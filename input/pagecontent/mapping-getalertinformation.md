# GetAlertInformation – Uppmärksamhetsinformation

**Tjänstekontrakt:** `clinicalprocess:healthcond:description` GetAlertInformation v2.0, 3.0  
**FHIR-profiler:** [SEEHDSAllergyIntolerance](StructureDefinition-se-ehds-allergy-intolerance.html) | [SEEHDSFlag](StructureDefinition-se-ehds-flag.html)  
**Logisk modell:** [SEEHDSLMAlertInformation](StructureDefinition-se-ehds-lm-alert-information.html)  
**Krävs för NPÖ:** Ja (v2.0, 3.0) | **Krävs för 1177 Journal:** Ja (v2.0, 3.0)  
**EHDS-koppling:** Patient Summary – Allergier, överkänslighet och varningsinformation

---

## Profilval baserat på alertType

| alertType (kv_uppmärksamhetstyp) | FHIR-profil |
|---|---|
| Allergi | `SEEHDSAllergyIntolerance` |
| Överkänslighet | `SEEHDSAllergyIntolerance` |
| Varning | `SEEHDSFlag` |

---

## Mappningstabell – SEEHDSAllergyIntolerance

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `alertHeader.patientId` | 1..1 | `AllergyIntolerance.patient.identifier` | OID→URI |
| `alertHeader.sourceSystemHSAId` | 1..1 | `AllergyIntolerance.meta.source` | |
| `alertHeader.documentTime` | 1..1 | `AllergyIntolerance.recordedDate` | |
| `alertHeader.accountableHealthcareProfessional` | 1..1 | `AllergyIntolerance.recorder` | |
| `alertHeader.legalAuthenticator` | 0..1 | `AllergyIntolerance.asserter` | |
| `alertHeader.careProviderHSAId` | 1..1 | `Provenance.agent[custodian]` | Yttre Sparr |
| `alertHeader.careUnitHSAId` | 1..1 | `Provenance.agent[author]` | Inre Sparr |
| `alertType` | 1..1 | `AllergyIntolerance.category` | Allergi→food/medication, Överkänslighet→environment |
| `alertCode` | 0..1 | `AllergyIntolerance.code` | |
| `alertStatus` | 1..1 | `AllergyIntolerance.clinicalStatus` | Aktuell→active, Historisk→resolved |
| `alertTimePeriod.start` | 0..1 | `AllergyIntolerance.onsetDateTime` | |
| `alertTimePeriod.end` | 0..1 | (ingen direkt mappning – dokumentera som note) | |
| `causeCode` | 0..1 | `AllergyIntolerance.reaction.substance` | |
| `reaction.description` | 0..* | `AllergyIntolerance.reaction.manifestation.text` | |
| `reaction.severity` | 0..1 | `AllergyIntolerance.reaction.severity` | |
| `alertComment` | 0..1 | `AllergyIntolerance.note.text` | |

---

## Mappningstabell – SEEHDSFlag

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `alertHeader.patientId` | 1..1 | `Flag.subject.identifier` | OID→URI |
| `alertHeader.documentTime` | 1..1 | `Flag.period.start` | |
| `alertHeader.accountableHealthcareProfessional` | 1..1 | `Flag.author` | |
| `alertType` | 1..1 | `Flag.category` | kv_uppmärksamhetstyp |
| `alertCode` | 1..1 | `Flag.code` | |
| `alertStatus` | 1..1 | `Flag.status` | Aktuell→active, Historisk→inactive |
| `alertTimePeriod` | 0..1 | `Flag.period` | |

---

## OID-till-URI-tabell

| OID | URI |
|---|---|
| `urn:oid:1.2.752.129.2.1.3.1` | `http://electronichealth.se/identifier/personnummer` |
| `urn:oid:1.2.752.129.2.1.3.3` | `http://electronichealth.se/identifier/samordningsnummer` |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `careProviderHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `careUnitHSAId` |
| `agent[assembler]` | EHDS-bryggan | `EHDS_BRIDGE_HSA_ID` |
