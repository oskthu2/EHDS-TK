# GetObservations – Tillväxtkurva för barn och ungdom

**Tjänstekontrakt:** `clinicalprocess:healthcond:basic` GetObservations v1.2  
**FHIR-profil:** [SEEHDSObservationGrowth](StructureDefinition-se-ehds-observation-growth.html)  
**Logisk modell:** [SEEHDSLMObservations](StructureDefinition-se-ehds-lm-observations.html)  
**Krävs för NPÖ:** Ja (v1.2) | **Krävs för 1177 Journal:** Ja (v1.2)  
**EHDS-koppling:** Kliniska resultat/mätvärden i bred mening (ej tydlig egen EHDS-huvudkategori)

---

## Mappningstabell

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `observationHeader.patientId` | 1..1 | `Observation.subject.identifier` | OID→URI |
| `observationHeader.sourceSystemHSAId` | 1..1 | `Observation.meta.source` | |
| `observationHeader.documentTime` | 1..1 | `Observation.issued` | |
| `observationHeader.accountableHealthcareProfessional` | 1..1 | `Observation.performer` | Reference(SEBasePractitionerRole) |
| `observationHeader.careProviderHSAId` | 1..1 | `Provenance.agent[custodian]` | Yttre Sparr |
| `observationHeader.careUnitHSAId` | 1..1 | `Provenance.agent[author]` | Inre Sparr |
| `observationCode` | 1..1 | `Observation.code.coding[loinc]` | LOINC-kod |
| `observationTime` | 1..1 | `Observation.effectiveDateTime` | |
| `observationValue` | 1..1 | `Observation.valueQuantity` | Enhet i UCUM (kg, cm) |
| `observationInterpretation` | 0..1 | `Observation.interpretation` | |
| `observationComment` | 0..1 | `Observation.note.text` | |

---

## LOINC-koder för vanliga tillväxtparametrar

| Parameter | LOINC |
|---|---|
| Vikt | 29463-7 |
| Längd/kroppslängd | 8302-2 |
| Huvudomfång | 9843-4 |
| BMI | 39156-5 |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `careProviderHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `careUnitHSAId` |
| `agent[assembler]` | EHDS-bryggan | `EHDS_BRIDGE_HSA_ID` |
