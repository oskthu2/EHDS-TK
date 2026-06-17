# GetMedicationHistory – Läkemedel

**Tjänstekontrakt:** `clinicalprocess:activityprescription:actoutcome` GetMedicationHistory v2.2  
**FHIR-profil:** [SEEHDSMedicationStatement](StructureDefinition-se-ehds-medication-statement.html)  
**Logisk modell:** [SEEHDSLMMedicationHistory](StructureDefinition-se-ehds-lm-medication-history.html)  
**Krävs för NPÖ:** Ja (v2.2) | **Krävs för 1177 Journal:** Ja (v2.2)  
**EHDS-koppling:** Patient Summary – Aktuella läkemedel. EHDS har även separata domäner för ePrescription och eDispensation.

---

## Mappningstabell

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `medicationHeader.patientId` | 1..1 | `MedicationStatement.subject.identifier` | OID→URI |
| `medicationHeader.sourceSystemHSAId` | 1..1 | `MedicationStatement.meta.source` | |
| `medicationHeader.documentTime` | 1..1 | `MedicationStatement.dateAsserted` | |
| `medicationHeader.accountableHealthcareProfessional` | 1..1 | `MedicationStatement.informationSource` | Reference(SEBasePractitionerRole) |
| `medicationHeader.careProviderHSAId` | 1..1 | `Provenance.agent[custodian]` | Yttre Sparr |
| `medicationHeader.careUnitHSAId` | 1..1 | `Provenance.agent[author]` | Inre Sparr |
| `drug.drugCode` | 0..1 | `MedicationStatement.medicationCodeableConcept.coding` | ATC-kod |
| `drug.drugName` | 1..1 | `MedicationStatement.medicationCodeableConcept.text` | |
| `drug.drugForm` | 0..1 | `MedicationStatement.medicationCodeableConcept.coding` | NPL-kod |
| `drug.drugStrength` | 0..1 | `MedicationStatement.medicationCodeableConcept.text` | Del av fritext |
| `treatmentStatus` | 1..1 | `MedicationStatement.status` | Aktuell→active, Avslutad→stopped, Utsatt→on-hold |
| `treatmentPeriod.start` | 0..1 | `MedicationStatement.effectivePeriod.start` | |
| `treatmentPeriod.end` | 0..1 | `MedicationStatement.effectivePeriod.end` | |
| `dosage.dosageInstruction` | 0..1 | `MedicationStatement.dosage.text` | |
| `dosage.administrationSchedule` | 0..1 | `MedicationStatement.dosage.timing` | |
| `dosage.administrationRoute` | 0..1 | `MedicationStatement.dosage.route` | kv_administrationssätt |
| `dosage.dose` | 0..1 | `MedicationStatement.dosage.doseAndRate.doseQuantity` | |
| `indication` | 0..* | `MedicationStatement.reasonCode` | |
| `treatmentComment` | 0..1 | `MedicationStatement.note.text` | |

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
