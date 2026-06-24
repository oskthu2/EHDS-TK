# GetDiagnosis – Diagnoser

**Tjänstekontrakt:** `clinicalprocess:healthcond:description` GetDiagnosis v2.0  
**FHIR-profil:** [IneraEHDSConditionDiagnosis](StructureDefinition-inera-ehds-condition-diagnosis.html)  
**Logisk modell:** [IneraEHDSLMDiagnosis](StructureDefinition-inera-ehds-lm-diagnosis.html)  
**Krävs för NPÖ:** Ja (v2.0) | **Krävs för 1177 Journal:** Ja (v2.0)  
**EHDS-koppling:** Patient Summary – Problem/diagnoser

---

## Mappningstabell – diagnosisHeader

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `diagnosisHeader.documentId` | 1..1 | `Condition.identifier[0].value` | Källsystemets dokumentidentitet |
| `diagnosisHeader.sourceSystemHSAId` | 1..1 | `Condition.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `diagnosisHeader.patientId.extension` | 1..1 | `Condition.subject.identifier.value` | Personnummer eller samordningsnummer |
| `diagnosisHeader.patientId.root` | 1..1 | `Condition.subject.identifier.system` | OID→URI, se tabell nedan |
| `diagnosisHeader.accountableHealthcareProfessional.authorTime` | 1..1 | `Condition.recordedDate` | YYYYMMDDHHMMSS → ISO 8601 (Europe/Stockholm), se [GENERAL-001](#öppna-frågor) |
| `diagnosisHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId` | 0..1 | `Condition.recorder` (Reference(PractitionerRole)) | Logisk referens via HSA-id |
| `diagnosisHeader.accountableHealthcareProfessional.healthcareProfessionalName` | 0..1 | `PractitionerRole.practitioner.display` | Valfritt komplement till HSA-id |
| `diagnosisHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode` | 0..1 | `PractitionerRole.code` | Befattningskod |
| `diagnosisHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId` | 0..1 | `PractitionerRole.organization.identifier` | HSA-id för organisationsenhet |
| `diagnosisHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName` | 0..1 | `PractitionerRole.organization.display` | Namn på organisationsenhet |
| `diagnosisHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | 0..1 | `Provenance.agent[author].who.identifier` | Inre Sparr – vårdenhet |
| `diagnosisHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | 0..1 | `Provenance.agent[custodian].who.identifier` | Yttre Sparr – vårdgivare |
| `diagnosisHeader.legalAuthenticator.signatureTime` | 1..1 (om legalAuth) | `Condition.extension[assertedDate]` | Signeringstidpunkt; YYYYMMDDHHMMSS → ISO 8601 |
| `diagnosisHeader.legalAuthenticator.legalAuthenticatorHSAId` | 0..1 | `Condition.asserter.identifier` | Via asserter-referens (PractitionerRole) |
| `diagnosisHeader.legalAuthenticator.legalAuthenticatorName` | 0..1 | Ej mappad | Namn i klartext – HSA-id räcker för logisk referens |
| `diagnosisHeader.approvedForPatient` | 1..1 | `Condition.meta.security` | PDL-kontroll – se [PDL-001](#öppna-frågor) |
| `diagnosisHeader.careContactId` | 0..1 | `Condition.encounter.identifier` | Logisk referens till Encounter |

---

## Mappningstabell – diagnosisBody

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `diagnosisBody.typeOfDiagnosis` | 1..1 | `Condition.category[diagnostyp]` | Huvuddiagnos (HD) eller Bidiagnos (BY); se tabell nedan |
| `diagnosisBody.chronicDiagnosis` | 0..1 | Ej mappad (se [DIAG-001](#föreslagna-nya-issues)) | Boolean – inget direktmappat FHIR Condition-element |
| `diagnosisBody.diagnosisTime` | 0..1 | `Condition.onsetDateTime` | YYYYMMDDHHMMSS → ISO 8601 |
| `diagnosisBody.diagnosisCode` | 0..1 | `Condition.code` | Se underelement nedan |
| `diagnosisBody.diagnosisCode.code` | — | `Condition.code.coding.code` | ICD-10-SE kod, t.ex. `J18.9` |
| `diagnosisBody.diagnosisCode.codeSystem` | — | `Condition.code.coding.system` | OID `1.2.752.116.1.1.1.1.3` → `https://www.icd10.se/` |
| `diagnosisBody.diagnosisCode.displayName` | — | `Condition.code.coding.display` | Kodverkets officiella benämning |
| `diagnosisBody.diagnosisCode.originalText` | — | `Condition.code.text` | Fritext; fallback: `displayName` om saknad |
| `diagnosisBody.relatedDiagnosis.documentId` | 1..1 (om relatedDiagnosis) | Ej mappad (se [DIAG-002](#föreslagna-nya-issues)) | Referens till relaterad diagnos via dokumentid – inget standardelement |

---

## Mappningstabell – result

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `result.resultCode` | 1..1 | Ej mappad | Teknisk responskod – hanteras av transportlagret |
| `result.errorCode` | 0..1 | Ej mappad | Teknisk felkod – hanteras av transportlagret |
| `result.logId` | 1..1 | Ej mappad | Teknisk spårnings-UUID – hanteras av transportlagret |
| `result.message` | 0..1 | Ej mappad | Teknisk felbeskrivning – hanteras av transportlagret |

---

## Härledda fält

### clinicalStatus

Inget explicit statusfält och inget slutdatumfält finns i GetDiagnosis v2.0. LM innehåller `diagnosisBody.diagnosisTime` (single dateTime) men inget fält för avslutsdatum. Därför kan `clinicalStatus` inte härledas från ett slutdatum.

| Regel | `Condition.clinicalStatus` |
|---|---|
| Alltid | `active` |

`Condition.verificationStatus` sätts alltid till `confirmed` (RIVTA-svar representerar bekräftade journaluppgifter).

---

## healthcareProfessionalType → PractitionerRole

Både `accountableHealthcareProfessional` och `legalAuthenticator` är av RIVTA-typen `healthcareProfessionalType` och mappas till FHIR `PractitionerRole` som logisk referens via HSA-id:

| RIVTA-underelement | FHIR PractitionerRole-fält |
|---|---|
| `healthcareProfessionalHSAId` | `PractitionerRole.identifier.value` |
| `healthcareProfessionalHSAId.root` | `PractitionerRole.identifier.system` (OID→URI) |
| `healthcareProfessionalName` | `PractitionerRole.practitioner.display` |
| `healthcareProfessionalRoleCode` | `PractitionerRole.code` |
| `healthcareProfessionalOrgUnit.orgUnitHSAId` | `PractitionerRole.organization.identifier` |
| `healthcareProfessionalOrgUnit.orgUnitName` | `PractitionerRole.organization.display` |

`accountableHealthcareProfessional` → `Condition.recorder`  
`legalAuthenticator` → `Condition.asserter`  
`legalAuthenticator.signatureTime` → `Condition.extension[assertedDate]`

---

## EU-profiler i meta.profile

Varje producerad Condition bär **två profiler** i `meta.profile`:

| Profil | URL |
|---|---|
| IneraEHDSConditionDiagnosis | `https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-condition-diagnosis` |
| condition-obl-eu-eps | `http://hl7.eu/fhir/eps/StructureDefinition/condition-obl-eu-eps` |

---

## OID till URI-mappningar

| OID | URI | Beskrivning |
|---|---|---|
| `1.2.752.129.2.1.3.1` | `http://electronichealth.se/identifier/personnummer` | Personnummer |
| `1.2.752.129.2.1.3.3` | `http://electronichealth.se/identifier/samordningsnummer` | Samordningsnummer |
| `1.2.752.129.2.1.4.1` | `urn:oid:1.2.752.129.2.1.4.1` | HSA-id (Inera NTjP) |
| `1.2.752.29.4.19` | `urn:oid:1.2.752.29.4.19` | HSA-id (HL7 Sweden) |
| `1.2.752.116.1.1.1.1.3` | `https://www.icd10.se/` | ICD-10-SE |
| `2.16.840.1.113883.6.3` | `http://hl7.org/fhir/sid/icd-10` | ICD-10 (WHO) |
| `2.16.840.1.113883.6.96` | `http://snomed.info/sct` | SNOMED CT |

OID:er utan känd URI-mappning bevaras som `urn:oid:{oid}`.

---

## diagnosisType – kv_diagnostyp

`Condition.category[diagnostyp]` innehåller en kod från Ineras kodverk `kv_diagnostyp`:

| RIVTA typeOfDiagnosis | Kod | System |
|---|---|---|
| HD – Huvuddiagnos | `HD` | `https://terminologitjansten.inera.se/inera-kodverksforvaltning/kodverk/kv_diagnostyp` |
| BY – Bidiagnos | `BY` | `https://terminologitjansten.inera.se/inera-kodverksforvaltning/kodverk/kv_diagnostyp` |

---

## PDL och Sparr

PDL-styrning i GetDiagnosis utgår från `accountableHealthcareProfessional`-blockets HSA-id:n i headern:

| PDL-begrepp | RIVTA-källa | Hantering |
|---|---|---|
| Yttre Sparr (vårdgivare) | `diagnosisHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | `Provenance.agent[custodian].who.identifier` |
| Inre Sparr (vårdenhet) | `diagnosisHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | `Provenance.agent[author].who.identifier` |
| Patientgodkännande | `diagnosisHeader.approvedForPatient` (boolean) | `Condition.meta.security`; se [PDL-001](#öppna-frågor) |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `diagnosisHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `diagnosisHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` |

`Provenance.target` refererar Condition via `urn:uuid:{Condition.id}`.  
`Provenance.recorded` = `diagnosisHeader.accountableHealthcareProfessional.authorTime` (ISO 8601).

---

## Exempelresurs

### RIVTA XML (GetDiagnosis:2)

```xml
<ns1:diagnosisBody>
  <ns1:diagnosisCode>
    <ns1:code>J18.9</ns1:code>
    <ns1:codeSystem>1.2.752.116.1.1.1.1.3</ns1:codeSystem>
    <ns1:displayName>Pneumoni, ospecificerad</ns1:displayName>
  </ns1:diagnosisCode>
  <ns1:typeOfDiagnosis>HD</ns1:typeOfDiagnosis>
  <ns1:diagnosisTime>20230601120000</ns1:diagnosisTime>
</ns1:diagnosisBody>
```

### Resulterande FHIR Condition (JSON)

```json
{
  "resourceType": "Condition",
  "meta": {
    "source": "urn:oid:1.2.752.129.2.1.4.1#SE2321000016-4HK5",
    "profile": [
      "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/inera-ehds-condition-diagnosis",
      "http://hl7.eu/fhir/eps/StructureDefinition/condition-obl-eu-eps"
    ]
  },
  "identifier": [{ "value": "doc-12345" }],
  "clinicalStatus": { "coding": [{ "system": "http://terminology.hl7.org/CodeSystem/condition-clinical", "code": "active" }] },
  "verificationStatus": { "coding": [{ "system": "http://terminology.hl7.org/CodeSystem/condition-ver-status", "code": "confirmed" }] },
  "category": [{
    "coding": [{
      "system": "https://terminologitjansten.inera.se/inera-kodverksforvaltning/kodverk/kv_diagnostyp",
      "code": "HD", "display": "Huvuddiagnos"
    }]
  }],
  "code": {
    "coding": [{ "system": "https://www.icd10.se/", "code": "J18.9", "display": "Pneumoni, ospecificerad" }]
  },
  "subject": { "identifier": { "system": "http://electronichealth.se/identifier/personnummer", "value": "191212121212" } },
  "onsetDateTime": "2023-06-01T12:00:00+02:00",
  "recordedDate": "2023-06-01T12:00:00+02:00"
}
```

---

## Öppna frågor

| ID | Fråga |
|---|---|
| PDL-001 | **`approvedForPatient` (boolean) saknar direkt FHIR-motsvarighet.** Fältet finns i alla PatientSummaryHeader-kontrakt men `meta.security` i FHIR har inget standardkodsystem för detta begrepp. Nuvarande lösning: enkoda som `meta.security`-tagg med lokalt kodsystem. Behöver gemensamt beslut för alla TK:er. |
| GENERAL-001 | **Tidsstämpelformat.** RIVTA använder `YYYYMMDDhhmmss` utan tidszon; FHIR kräver ISO 8601 med tidszon. Konvertering ska anta `Europe/Stockholm` (CET/CEST). Gäller alla tidsfält i alla tjänstekontrakt. |

---

## Föreslagna nya issues

| ID | Fält | Beskrivning |
|---|---|---|
| DIAG-001 | `diagnosisBody.chronicDiagnosis` | Boolean – inget direktmappat FHIR Condition-element. Alternativ: (a) extension `Condition.extension[chronicDiagnosis]` med boolean, eller (b) `Condition.category` med en kod för kronisk diagnos från ett lokalt/nationellt kodsystem. Kräver designbeslut. |
| DIAG-002 | `diagnosisBody.relatedDiagnosis.documentId` | Referens till relaterad diagnos via dokumentid. Inget standardelement i Condition. Alternativ: (a) `Condition.extension[relatedCondition]` med logisk referens, eller (b) `Condition.note` med dokumentid i fritext. Kräver designbeslut. |
