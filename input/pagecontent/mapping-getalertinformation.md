# GetAlertInformation – Uppmärksamhetsinformation

**Tjänstekontrakt:** `clinicalprocess:healthcond:description` GetAlertInformation v2.0  
**FHIR-profiler:** [SEEHDSFlag](StructureDefinition-se-ehds-flag.html) | [SEEHDSAllergyIntolerance](StructureDefinition-se-ehds-allergy-intolerance.html)  
**Logisk modell:** [SEEHDSLMAlertInformation](StructureDefinition-se-ehds-lm-alert-information.html)  
**Krävs för NPÖ:** Ja (v2.0) | **Krävs för 1177 Journal:** Ja (v2.0)  
**EHDS-koppling:** Patient Summary – Allergier, överkänslighet och varningsinformation

---

> **VIKTIGT – Avvikelse mot tidigare stubmodell**
>
> Den verkliga TKB:n för GetAlertInformation v2.0 innehåller i kroppen (`alertInformationBody`) **enbart elementet `typeOfAlertInformation 1..1`**. Tidigare stub-dokumentation innehöll elementen `alertCode`, `alertStatus`, `alertTimePeriod`, `causeCode`, `reaction` och `alertComment` – **dessa element existerar inte i det riktiga tjänstekontraktet** och ska inte mappas. Se [ALERT-001](#öppna-frågor).

---

## Härledda fält / Designbeslut

### Profilval – alltid Flag, ibland även AllergyIntolerance

`Flag` skapas **alltid** för varje `alertInformation`-post, oavsett typ av uppmärksamhetssignal.

Om `typeOfAlertInformation` anger en allergityp skapas **dessutom** en `AllergyIntolerance`-resurs. I det fallet pekar `Flag` på `AllergyIntolerance` via en extension `Flag.extension[allergyReference]`.

| Scenario | Resurser som skapas |
|---|---|
| `typeOfAlertInformation` = allergi-kod | `Flag` + `AllergyIntolerance` (länkad via extension) |
| `typeOfAlertInformation` = annan typ | `Flag` (enbart) |

Gränsen för vilka koder som räknas som "allergi" är beroende av kodsystemet för `typeOfAlertInformation`, vars OID ännu inte är fastställt – se [ALERT-001](#öppna-frågor) och [ALERT-002](#öppna-frågor).

### Flag.status

Inget explicit statusfält finns i TKB:n. `Flag.status` sätts alltid till `active` (posterna som returneras av tjänsten är per definition aktiva uppmärksamhetssignaler för patienten vid svarstillfället).

### approvedForPatient

Fältet `alertInformationHeader.approvedForPatient 1..1 boolean` har ingen direkt motsvarighet i FHIR:s säkerhetsmodell. Se [PDL-001](#öppna-frågor).

---

## Mappningstabell – alertInformationHeader

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `alertInformationHeader.documentId` | 1..1 | `Flag.identifier.value` | Källsystemets dokumentidentifierare |
| `alertInformationHeader.sourceSystemHSAId` | 1..1 | `Flag.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `alertInformationHeader.patientId.extension` | 1..1 | `Flag.subject.identifier.value` | Personnummer eller samordningsnummer |
| `alertInformationHeader.patientId.root` | 1..1 | `Flag.subject.identifier.system` | OID→URI, se tabell nedan |
| `alertInformationHeader.accountableHealthcareProfessional.authorTime` | 1..1 | `Flag.period.start` | YYYYMMDDHHMMSS → ISO 8601 (Europe/Stockholm), se [GENERAL-001](#öppna-frågor) |
| `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId` | 0..1 | `Flag.author` (Reference(PractitionerRole)) | Logisk referens via HSA-id |
| `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalName` | 0..1 | `PractitionerRole.practitioner.display` | Visningsnamn |
| `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode` | 0..1 | `PractitionerRole.code` | Yrkesrollskod |
| `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId` | 0..1 | `PractitionerRole.organization.identifier.value` | Organisationsenhetens HSA-id |
| `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName` | 0..1 | `PractitionerRole.organization.display` | Organisationsenhetens namn |
| `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | 0..1 | `Provenance.agent[custodian].who.identifier` | Yttre Sparr |
| `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | 0..1 | `Provenance.agent[author].who.identifier` | Inre Sparr |
| `alertInformationHeader.legalAuthenticator.signatureTime` | 1..1 (om legalAuth) | `Flag.extension[assertedDate]` | Signeringstidpunkt; YYYYMMDDHHMMSS → ISO 8601 |
| `alertInformationHeader.legalAuthenticator.legalAuthenticatorHSAId` | 0..1 | (ingen direkt Flag-mappning) | Används ej i Flag; ingår i AllergyIntolerance.asserter om allergi |
| `alertInformationHeader.legalAuthenticator.legalAuthenticatorName` | 0..1 | (ingen direkt Flag-mappning) | Visningsnamn; se ovan |
| `alertInformationHeader.approvedForPatient` | 1..1 | (ej mappad) | Inget standardiserat FHIR-fält; se [PDL-001](#öppna-frågor) |
| `alertInformationHeader.careContactId` | 0..1 | `Flag.encounter.identifier.value` | Logisk referens till vårdkontakt |

---

## Mappningstabell – alertInformationBody

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `alertInformationBody.typeOfAlertInformation` | 1..1 | `Flag.category` | Kodsystem okänt/lokalt; se [ALERT-001](#öppna-frågor) och [ALERT-002](#öppna-frågor) |
| `alertInformationBody.typeOfAlertInformation` | 1..1 | `Flag.code` | Samma värde används för både category och code |
| (härledd från `typeOfAlertInformation`) | — | `Flag.extension[allergyReference]` | Sätts om typen bedöms vara allergi; pekar på skapad AllergyIntolerance |

> **Obs:** `alertInformationBody` innehåller **enbart** `typeOfAlertInformation`. Det finns inga ytterligare element att mappa. Se [ALERT-001](#öppna-frågor).

---

## Mappningstabell – AllergyIntolerance (om allergi-typ)

AllergyIntolerance skapas enbart när `typeOfAlertInformation` indikerar en allergityp. Eftersom TKB:n inte innehåller klinisk detaljinformation om allergin (substans, reaktion, svårighetsgrad) kan endast metadata fyllas i.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `alertInformationHeader.patientId.extension` | 1..1 | `AllergyIntolerance.patient.identifier.value` | Personnummer eller samordningsnummer |
| `alertInformationHeader.patientId.root` | 1..1 | `AllergyIntolerance.patient.identifier.system` | OID→URI, se tabell nedan |
| `alertInformationHeader.sourceSystemHSAId` | 1..1 | `AllergyIntolerance.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `alertInformationHeader.accountableHealthcareProfessional.authorTime` | 1..1 | `AllergyIntolerance.recordedDate` | YYYYMMDDHHMMSS → ISO 8601 |
| `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId` | 0..1 | `AllergyIntolerance.recorder` (Reference(PractitionerRole)) | Logisk referens via HSA-id |
| `alertInformationHeader.legalAuthenticator.legalAuthenticatorHSAId` | 0..1 | `AllergyIntolerance.asserter` (Reference(PractitionerRole)) | Logisk referens via HSA-id |
| `alertInformationBody.typeOfAlertInformation` | 1..1 | `AllergyIntolerance.code` | Typ av allergi; kodsystem se [ALERT-002](#öppna-frågor) |
| (härledd – alltid active) | — | `AllergyIntolerance.clinicalStatus` | `active`; inget statusfält i TKB |
| (härledd – alltid confirmed) | — | `AllergyIntolerance.verificationStatus` | `confirmed`; journaluppgifter anses bekräftade |

---

## PDL och Sparr

PDL-styrning i GetAlertInformation utgår från `accountableHealthcareProfessional`-blockets HSA-id:n i headern:

| PDL-begrepp | RIVTA-källa | Hantering |
|---|---|---|
| Yttre Sparr (vårdgivare) | `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | `Provenance.agent[custodian].who.identifier` |
| Inre Sparr (vårdenhet) | `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | `Provenance.agent[author].who.identifier` |
| Patientgodkännande | `alertInformationHeader.approvedForPatient` (boolean) | Inget standardiserat FHIR-fält; se [PDL-001](#öppna-frågor) |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` |

`Provenance.target` refererar Flag (och eventuell AllergyIntolerance) via `urn:uuid:{resurs.id}`.  
`Provenance.recorded` = `alertInformationHeader.accountableHealthcareProfessional.authorTime` (ISO 8601).

---

## Öppna frågor

| ID | Fråga |
|---|---|
| ALERT-001 | **Avsaknad av klinisk detaljinformation i TKB.** `alertInformationBody` innehåller enbart `typeOfAlertInformation 1..1`. Gamla stub-modellen innehöll `alertCode`, `alertStatus`, `alertTimePeriod`, `causeCode`, `reaction` och `alertComment` – **ingen** av dessa element finns i det verkliga tjänstekontraktet v2.0. Innebörden är att det är omöjligt att skapa meningsfulla AllergyIntolerance-resurser med substans, reaktion eller svårighetsgrad från denna TK. Behöver eskaleras till TKB-förvaltningen. |
| ALERT-002 | **Okänt kodsystem för `typeOfAlertInformation`.** OID och URI för kodsystemet är inte dokumenterat i TKB:n. Avgör vilka koder som ska styra om Flag eller AllergyIntolerance (eller båda) skapas. |
| PDL-001 | **`approvedForPatient` (boolean) saknar FHIR-motsvarighet.** Fältet finns i alla PatientSummaryHeader-kontrakt men `meta.security` i FHIR har inget standardkodsystem för detta begrepp. Behöver gemensamt beslut för alla TK:er. |
| GENERAL-001 | **Tidsstämpelformat.** RIVTA använder `YYYYMMDDhhmmss` utan tidszon; FHIR kräver ISO 8601 med tidszon. Konvertering ska anta `Europe/Stockholm` (CET/CEST). Gäller alla tidsfält i alla tjänstekontrakt. |

---

## OID-till-URI-tabell

| OID | URI |
|---|---|
| `1.2.752.129.2.1.3.1` | `http://electronichealth.se/identifier/personnummer` |
| `1.2.752.129.2.1.3.3` | `http://electronichealth.se/identifier/samordningsnummer` |
| `1.2.752.129.2.1.4.1` | `urn:oid:1.2.752.129.2.1.4.1` |

OID:er utan känd URI-mappning bevaras som `urn:oid:{oid}`.
