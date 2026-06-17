# GetDiagnosis – Diagnoser

**Tjänstekontrakt:** `clinicalprocess:healthcond:description` GetDiagnosis v2.0  
**FHIR-profil:** [SEEHDSConditionDiagnosis](StructureDefinition-se-ehds-condition-diagnosis.html)  
**Logisk modell:** [SEEHDSLMDiagnosis](StructureDefinition-se-ehds-lm-diagnosis.html)  
**Krävs för NPÖ:** Ja (v2.0) | **Krävs för 1177 Journal:** Ja (v2.0)  
**EHDS-koppling:** Patient Summary – Problem/diagnoser

---

## Mappningstabell

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `diagnosisHeader.patientId` | 1..1 | `Condition.subject.identifier` | OID→URI: `urn:oid:1.2.752.129.2.1.3.1` → `http://electronichealth.se/identifier/personnummer` |
| `diagnosisHeader.sourceSystemHSAId` | 1..1 | `Condition.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `diagnosisHeader.documentTime` | 1..1 | `Condition.recordedDate` | YYYYMMDDHHMMSS → ISO 8601, tolkas som Europe/Stockholm |
| `diagnosisHeader.accountableHealthcareProfessional` | 1..1 | `Condition.recorder` (Reference(SEBasePractitionerRole)) | Logisk referens via HSA-id |
| `diagnosisHeader.legalAuthenticator` | 0..1 | `Condition.asserter` (Reference(SEBasePractitionerRole)) | Logisk referens via HSA-id |
| `diagnosisHeader.legalAuthenticatorTime` | 0..1 | `Condition.extension[assertedDate]` | YYYYMMDD → YYYY-MM-DD |
| `diagnosisHeader.careProviderHSAId` | 1..1 | `Provenance.agent[custodian].who.identifier` | Yttre Sparr |
| `diagnosisHeader.careUnitHSAId` | 1..1 | `Provenance.agent[author].who.identifier` | Inre Sparr |
| `diagnosisCode` | 1..1 | `Condition.code.coding[icd10se]` | System: `https://www.icd10.se/` |
| `diagnosisCodeSystem` | 1..1 | `Condition.code.coding[icd10se].system` | Alltid ICD-10-SE |
| `diagnosisCodeDescription` | 0..1 | `Condition.code.text` | Fritext beskrivning |
| `diagnosisType` | 0..1 | `Condition.category` | kv_diagnostyp → SEDiagnosisTypeVS |
| `diagnosisStatus` | 1..1 | `Condition.clinicalStatus` | Aktuell → `active`, Historisk → `resolved` |
| `diagnosisTimePeriod.start` | 0..1 | `Condition.onsetDateTime` | YYYYMMDD → YYYY-MM-DD |
| `diagnosisTimePeriod.end` | 0..1 | `Condition.abatementDateTime` | YYYYMMDD → YYYY-MM-DD |
| `diagnosisComment` | 0..1 | `Condition.note.text` | Fritext |

---

## PatientSummaryHeader-mappning (standardmönster)

Se README:ns avsnitt 6. Alla header-fält mappas enligt detta mönster.

---

## OID-till-URI-tabell

| OID | URI |
|---|---|
| `urn:oid:1.2.752.129.2.1.3.1` | `http://electronichealth.se/identifier/personnummer` |
| `urn:oid:1.2.752.129.2.1.3.3` | `http://electronichealth.se/identifier/samordningsnummer` |
| `urn:oid:1.2.752.129.2.1.4.1` | `urn:oid:1.2.752.129.2.1.4.1` (NTjP HSA-id, behålls som OID i meta.source) |
| `urn:oid:1.2.752.29.4.19` | `urn:oid:1.2.752.29.4.19` (HL7 Sweden HSA-id) |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `careProviderHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `careUnitHSAId` |
| `agent[assembler]` | EHDS-bryggan | `EHDS_BRIDGE_HSA_ID` (env-variabel) |

---

## Sparr

- **Yttre Sparr:** `careProviderHSAId` styr om vårdgivaren är spärrad
- **Inre Sparr:** `careUnitHSAId` styr om vårdenhetens post är spärrad
