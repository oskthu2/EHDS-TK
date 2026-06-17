# GetDiagnosis – Diagnoser

**Tjänstekontrakt:** `clinicalprocess:healthcond:description` GetDiagnosis v2.0  
**FHIR-profil:** [SEEHDSConditionDiagnosis](StructureDefinition-se-ehds-condition-diagnosis.html)  
**Logisk modell:** [SEEHDSLMDiagnosis](StructureDefinition-se-ehds-lm-diagnosis.html)  
**Krävs för NPÖ:** Ja (v2.0) | **Krävs för 1177 Journal:** Ja (v2.0)  
**EHDS-koppling:** Patient Summary – Problem/diagnoser

---

## Mappningstabell

| RIVTA-element | FHIR-element | Kommentar |
|---|---|---|
| `diagnosisHeader.patientId.extension` | `Condition.subject.identifier.value` | Personnummer eller samordningsnummer |
| `diagnosisHeader.patientId.root` | `Condition.subject.identifier.system` | OID→URI, se tabell nedan |
| `diagnosisHeader.sourceSystemHSAId` | `Condition.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `diagnosisHeader.documentTime` | `Condition.recordedDate` | YYYYMMDDHHMMSS → ISO 8601 (Europe/Stockholm) |
| `diagnosisBody.diagnosisCode.code` | `Condition.code.coding.code` | ICD-10-SE kod, t.ex. `J18.9` |
| `diagnosisBody.diagnosisCode.codeSystem` | `Condition.code.coding.system` | OID `1.2.752.116.1.1.1.1.3` → `https://www.icd10.se/` |
| `diagnosisBody.diagnosisCode.displayName` | `Condition.code.coding.display` | Kodverkets officiella benämning |
| `diagnosisBody.diagnosisCode.originalText` | `Condition.code.text` | Fritext; fallback: `displayName` om saknad |
| `diagnosisBody.diagnosisType` (HD) | `Condition.category[diagnostyp].coding.code = HD` | Huvuddiagnos – kv_diagnostyp |
| `diagnosisBody.diagnosisType` (BY) | `Condition.category[diagnostyp].coding.code = BY` | Bidiagnos – kv_diagnostyp |
| `diagnosisBody.diagnosisTimePeriod.start` | `Condition.onsetDateTime` | YYYYMMDD → YYYY-MM-DD |
| `diagnosisBody.diagnosisTimePeriod.end` | `Condition.abatementDateTime` | Sätts clinicalStatus = `resolved` |
| `diagnosisHeader.accountableHealthcareProfessional` | `Condition.recorder` (Reference(PractitionerRole)) | Logisk referens via HSA-id |
| `diagnosisHeader.legalAuthenticator` | `Condition.asserter` (Reference(PractitionerRole)) | Logisk referens via HSA-id |
| `diagnosisHeader.legalAuthenticator.signatureDate` | `Condition.extension[assertedDate]` | YYYYMMDD → YYYY-MM-DD |
| `diagnosisHeader.careProviderHSAId` | `Provenance.agent[custodian].who.identifier` | Yttre Sparr |
| `diagnosisHeader.careUnitHSAId` | `Provenance.agent[author].who.identifier` | Inre Sparr |
| `diagnosisHeader.documentTime` | `Provenance.recorded` | Tidsstämpel för Provenance |

---

## Härledda fält

### clinicalStatus

Inget explicit statusfält finns i GetDiagnosis:2. `Condition.clinicalStatus` härleds från `diagnosisTimePeriod.end`:

| `diagnosisTimePeriod.end` | `Condition.clinicalStatus` |
|---|---|
| Inte satt (null) | `active` |
| Satt (datum finns) | `resolved` |

`Condition.verificationStatus` sätts alltid till `confirmed` (RIVTA-svar representerar bekräftade journaluppgifter).

---

## healthcareProfessionalType → PractitionerRole

Både `accountableHealthcareProfessional` och `legalAuthenticator` är av RIVTA-typen `healthcareProfessionalType` och mappas till FHIR `PractitionerRole` som logisk referens via HSA-id:

| RIVTA-underelement | FHIR PractitionerRole-fält |
|---|---|
| `healthcareProfessional.personId` | `PractitionerRole.identifier.value` |
| `healthcareProfessional.personId.root` | `PractitionerRole.identifier.system` (OID→URI) |
| `roleAtTime` | `PractitionerRole.code` |

`accountableHealthcareProfessional` → `Condition.recorder`  
`legalAuthenticator` → `Condition.asserter`  
`legalAuthenticator.signatureDate` → `Condition.extension[assertedDate]`

---

## EU-profiler i meta.profile

Varje producerad Condition bär **två profiler** i `meta.profile`:

| Profil | URL |
|---|---|
| SEEHDSConditionDiagnosis | `https://fhir.inera.se/ig/ehds-tk/StructureDefinition/se-ehds-condition-diagnosis` |
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

| RIVTA diagnosisType | Kod | System |
|---|---|---|
| HD – Huvuddiagnos | `HD` | `https://terminologitjansten.inera.se/inera-kodverksforvaltning/kodverk/kv_diagnostyp` |
| BY – Bidiagnos | `BY` | `https://terminologitjansten.inera.se/inera-kodverksforvaltning/kodverk/kv_diagnostyp` |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `diagnosisHeader.careProviderHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `diagnosisHeader.careUnitHSAId` |

`Provenance.target` refererar Condition via `urn:uuid:{Condition.id}`.  
`Provenance.recorded` = `diagnosisHeader.documentTime` (ISO 8601).

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
  <ns1:diagnosisType>HD</ns1:diagnosisType>
  <ns1:diagnosisTimePeriod>
    <ns1:start>20230601</ns1:start>
  </ns1:diagnosisTimePeriod>
</ns1:diagnosisBody>
```

### Resulterande FHIR Condition (JSON)

```json
{
  "resourceType": "Condition",
  "meta": {
    "source": "urn:oid:1.2.752.129.2.1.4.1#SE2321000016-4HK5",
    "profile": [
      "https://fhir.inera.se/ig/ehds-tk/StructureDefinition/se-ehds-condition-diagnosis",
      "http://hl7.eu/fhir/eps/StructureDefinition/condition-obl-eu-eps"
    ]
  },
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
  "onsetDateTime": "2023-06-01",
  "recordedDate": "2023-06-01T12:00:00"
}
```
