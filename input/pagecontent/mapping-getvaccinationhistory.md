# GetVaccinationHistory – Vaccinationer

**Tjänstekontrakt:** `clinicalprocess:activityprescription:actoutcome` GetVaccinationHistory v2.0  
**FHIR-profil:** [SEEHDSImmunization](StructureDefinition-se-ehds-immunization.html)  
**Logisk modell:** [SEEHDSLMVaccinationHistory](StructureDefinition-se-ehds-lm-vaccination-history.html)  
**Krävs för NPÖ:** Ja (v2.0) | **Krävs för 1177 Journal:** Ja (v1.0, 2.0)  
**EHDS-koppling:** Patient Summary – Vaccinationer

---

## Mappningstabell

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `vaccinationHeader.patientId` | 1..1 | `Immunization.patient.identifier` | OID→URI |
| `vaccinationHeader.sourceSystemHSAId` | 1..1 | `Immunization.meta.source` | |
| `vaccinationHeader.documentTime` | 1..1 | `Immunization.recorded` | |
| `vaccinationHeader.accountableHealthcareProfessional` | 1..1 | `Immunization.performer.actor` | Reference(SEBasePractitionerRole) |
| `vaccinationHeader.careProviderHSAId` | 1..1 | `Provenance.agent[custodian]` | Yttre Sparr |
| `vaccinationHeader.careUnitHSAId` | 1..1 | `Provenance.agent[author]` | Inre Sparr |
| `vaccineCode` | 1..1 | `Immunization.vaccineCode.coding` | ATC-kod |
| `vaccineName` | 0..1 | `Immunization.vaccineCode.text` | |
| `vaccinationTime` | 1..1 | `Immunization.occurrenceDateTime` | |
| `batchNumber` | 0..1 | `Immunization.lotNumber` | |
| `administrationSite` | 0..1 | `Immunization.site` | |
| `administrationRoute` | 0..1 | `Immunization.route` | |
| `dose` | 0..1 | `Immunization.doseQuantity` | |
| `doseNumber` | 0..1 | `Immunization.protocolApplied.doseNumberPositiveInt` | |
| `diseaseTarget` | 0..* | `Immunization.protocolApplied.targetDisease` | |
| `vaccinationComment` | 0..1 | `Immunization.note.text` | |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `careProviderHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `careUnitHSAId` |
| `agent[assembler]` | EHDS-bryggan | `EHDS_BRIDGE_HSA_ID` |
