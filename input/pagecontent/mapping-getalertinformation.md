# GetAlertInformation – Uppmärksamhetsinformation

**Tjänstekontrakt:** `clinicalprocess:healthcond:description` GetAlertInformation v2.0  
**FHIR-profiler:** [IneraEHDSFlag](StructureDefinition-inera-ehds-flag.html) | [IneraEHDSAllergyIntolerance](StructureDefinition-inera-ehds-allergy-intolerance.html)  
**Logisk modell:** [IneraEHDSLMAlertInformation](StructureDefinition-inera-ehds-lm-alert-information.html)  
**Krävs för NPÖ:** Ja (v2.0) | **Krävs för 1177 Journal:** Ja (v2.0)  
**EHDS-koppling:** Patient Summary – Allergier, överkänslighet och varningsinformation

---

## Profilval – alltid Flag, ibland även AllergyIntolerance

`Flag` skapas **alltid** för varje `alertInformation`-post, oavsett typ av uppmärksamhetssignal (beslut GENERAL-004, ALERT-003).

Om body-typen är `hypersensitivity` skapas **dessutom** en `AllergyIntolerance`-resurs. I det fallet pekar `Flag` på `AllergyIntolerance` via `Flag.extension[flag-detail]` (standard R4-extension; kallas `supportingInfo` i R5).

| Scenario | Resurser som skapas |
|---|---|
| body = `hypersensitivity` | `Flag` + `AllergyIntolerance` (länkad via `extension[flag-detail]`) |
| body = `seriousDisease` | `Flag` (enbart) |
| body = `treatment` | `Flag` (enbart) |
| body = `communicableDisease` | `Flag` (enbart) |
| body = `restrictionOfCare` | `Flag` (enbart) |
| body = `unstructuredAlertInformation` | `Flag` (enbart) |

Body-typen avgörs av vilket XOR-element som anges i `alertInformationBody`.

---

## Mappning av Flag.category och Flag.code

`Flag.category` bär alltid body-typen (obligatorisk) och, vid överkänslighet, även preciseringstypen:

| Slice | Källa | Kommentar |
|---|---|---|
| `Flag.category[alertType]` | `alertInformationBody.typeOfAlertInformation` | Alltid obligatorisk (1..1) |
| `Flag.category[hypersensitivityType]` | `alertInformationBody.hypersensitivity.typeOfHypersensitivity` | Enbart när body = hypersensitivity (0..1) |

`Flag.code` bär den kliniska koden specifik för varje body-typ:

| Body-typ | Flag.code | Kommentar |
|---|---|---|
| `hypersensitivity` | `atcSubstance` (code.coding) eller `hypersensitivityAgentCode` (code.coding); fritext i code.text | XOR: pharmaceuticalHypersensitivity eller otherHypersensitivity |
| `seriousDisease` | `seriousDisease.disease` (ICD10/SNOMED) | |
| `treatment` | `treatment.treatmentCode` (KVÅ) | Tomt CodeableConcept om enbart treatmentDescription finns |
| `communicableDisease` | `communicableDiseaseCode` (ICD10) | |
| `unstructuredAlertInformation` | `unstructuredAlertInformationHeading` som code.text | Ingen strukturerad kod |
| `restrictionOfCare` | Tomt CodeableConcept | Ingen strukturerad kod |

---

## Flag.status

Inget explicit statusfält finns i TKB:n. `Flag.status` sätts alltid till `active` (poster som returneras av tjänsten är per definition aktiva uppmärksamhetssignaler vid svarstillfället).

---

## Mappningstabell – alertInformationHeader

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `alertInformationHeader.documentId` | 1..1 | `Flag.identifier.value` | Källsystemets dokumentidentifierare |
| `alertInformationHeader.sourceSystemHSAId` | 1..1 | `Flag.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `alertInformationHeader.patientId.extension` | 1..1 | `Flag.subject.identifier.value` | Personnummer eller samordningsnummer |
| `alertInformationHeader.patientId.root` | 1..1 | `Flag.subject.identifier.system` | OID→URI, se tabell nedan |
| `alertInformationHeader.accountableHealthcareProfessional.authorTime` | 1..1 | `Provenance.recorded` | YYYYMMDDHHMMSS → ISO 8601 (Europe/Stockholm); se [GENERAL-001](#öppna-frågor) |
| `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId` | 0..1 | `Flag.author` (Reference(PractitionerRole)) | Logisk referens via HSA-id |
| `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalName` | 0..1 | `PractitionerRole.practitioner.display` | Visningsnamn |
| `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode` | 0..1 | `PractitionerRole.code` | Yrkesrollskod |
| `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId` | 0..1 | `PractitionerRole.organization.identifier.value` | Organisationsenhetens HSA-id |
| `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName` | 0..1 | `PractitionerRole.organization.display` | Organisationsenhetens namn |
| `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom` | 0..1 | Ej mappad | Kontaktinfo på enhetsnivå – hanteras ej i FHIR-resursen |
| `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail` | 0..1 | Ej mappad | Kontaktinfo på enhetsnivå – hanteras ej i FHIR-resursen |
| `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress` | 0..1 | Ej mappad | Kontaktinfo på enhetsnivå – hanteras ej i FHIR-resursen |
| `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation` | 0..1 | Ej mappad | Kontaktinfo på enhetsnivå – hanteras ej i FHIR-resursen |
| `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | 0..1 | `Provenance.agent[author].who.identifier` | Inre Sparr – vårdenhet |
| `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | 0..1 | `Provenance.agent[custodian].who.identifier` | Yttre Sparr – vårdgivare |
| `alertInformationHeader.legalAuthenticator.signatureTime` | 1..1 (om legalAuth) | `Flag.extension[alertAssertedDate]` | Signeringstidpunkt; YYYYMMDDHHMMSS → ISO 8601 |
| `alertInformationHeader.legalAuthenticator.legalAuthenticatorHSAId` | 0..1 | `Flag.extension[alertAsserter].identifier` | Ingår även i `AllergyIntolerance.asserter` om allergi |
| `alertInformationHeader.legalAuthenticator.legalAuthenticatorName` | 0..1 | Ej mappad | Namn i klartext – HSA-id räcker för logisk referens |
| `alertInformationHeader.approvedForPatient` | 1..1 | `Flag.meta.security` | PDL-kontroll – se [PDL-001](#öppna-frågor) |
| `alertInformationHeader.careContactId` | 0..1 | `Flag.encounter.identifier.value` | Logisk referens till vårdkontakt |

---

## Mappningstabell – alertInformationBody (gemensamma fält)

Följande fält är gemensamma för alla body-typer (förekommer oberoende av XOR-val):

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `alertInformationBody.typeOfAlertInformation` | 1..1 | `Flag.category[alertType]` | Kodsystem se [ALERT-002](#öppna-frågor) |
| `alertInformationBody.validityTimePeriod.start` | 1..1 | `Flag.period.start` | YYYYMMDDHHMMSS → ISO 8601 |
| `alertInformationBody.validityTimePeriod.end` | 0..1 | `Flag.period.end` | Planerat giltighetsslutt; se nedan om obsoleteTime |
| `alertInformationBody.obsoleteTime` | 0..1 | `Flag.period.end` | Faktisk inaktivering; används om ≤ validityTimePeriod.end eller om period.end ej är satt |
| `alertInformationBody.obsoleteComment` | 0..1 | `Flag.extension[alertInformationComment]` | Konkateneras: "Inaktiveringskommentar: {obsoleteComment}" |
| `alertInformationBody.ascertainedDate` | 0..1 | `Flag.extension[alertAscertainedDate]` | Datum för konstaterande |
| `alertInformationBody.verifiedTime` | 0..1 | `Flag.extension[alertVerifiedTime]` | Tidpunkt för verifiering i källsystem |
| `alertInformationBody.alertInformationComment` | 0..1 | `Flag.extension[alertInformationComment]` | Klinisk kommentar; vid allergi även `AllergyIntolerance.note.text` |

> **Notering om period.end och obsoleteTime:** Båda mappar till `Flag.period.end`. Om båda är satta används det minsta värdet (= faktisk giltighetstid). `obsoleteComment` konkateneras i `alertInformationComment`.

> **OBS:** `alertInformationHeader.documentTitle`, `documentTime`, `nullified` och `nullifiedReason` är N/A (0..0) för detta tjänstekontrakt och mappas inte.

---

## Body XOR-sektion 1: hypersensitivity (överkänslighet)

Gäller när `alertInformationBody.hypersensitivity` är angivet. Skapar Flag **och** AllergyIntolerance.

### Flag-fält (hypersensitivity)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `alertInformationBody.hypersensitivity.typeOfHypersensitivity` | 0..1 | `Flag.category[hypersensitivityType]` | Precisering av överkänslighetstyp (ICD10/SNOMED) |
| `alertInformationBody.hypersensitivity.degreeOfSeverity` | 0..1 | `Flag.extension[degreeOfSeverity]` | KV Allvarlighetsgrad (1.2.752.129.2.2.3.3) |
| `alertInformationBody.hypersensitivity.degreeOfCertainty` | 0..1 | `Flag.extension[degreeOfCertainty]` | KV Visshetsgrad (1.2.752.129.2.2.3.11) |
| `alertInformationBody.hypersensitivity.pharmaceuticalHypersensitivity.atcSubstance` | 0..1 | `Flag.code.coding` | ATC-kod (1.2.752.129.2.2.3.1.1). XOR med otherHypersensitivity |
| `alertInformationBody.hypersensitivity.pharmaceuticalHypersensitivity.nonATCSubstance` | 0..1 | `Flag.code.text` | Substansnamn utan ATC-kod |
| `alertInformationBody.hypersensitivity.pharmaceuticalHypersensitivity.nonATCSubstanceComment` | 0..1 | `Flag.extension[pharmaceuticalHypersensitivity].nonATCSubstanceComment` | Förklaring till avsaknad ATC-kod |
| `alertInformationBody.hypersensitivity.pharmaceuticalHypersensitivity.pharmaceuticalProductId` | 0..* | `Flag.extension[pharmaceuticalHypersensitivity].pharmaceuticalProductId` | NPL-id (1.2.752.129.2.1.5.1); lista |
| `alertInformationBody.hypersensitivity.otherHypersensitivity.hypersensitivityAgentCode` | 0..1 | `Flag.code.coding` | Agenskod (LMK-kod, CAS-kod m.fl.). XOR med pharmaceuticalHypersensitivity |
| `alertInformationBody.hypersensitivity.otherHypersensitivity.hypersensitivityAgent` | 0..1 | `Flag.code.text` | Agens i fritext |

### AllergyIntolerance-fält (hypersensitivity)

AllergyIntolerance skapas enbart när body = hypersensitivity. Fält från header och hypersensitivity-blocket mappas:

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `alertInformationHeader.documentId` | 1..1 | `AllergyIntolerance.identifier.value` | Samma dokumentid som Flag |
| `alertInformationHeader.patientId.extension` | 1..1 | `AllergyIntolerance.patient.identifier.value` | Personnummer eller samordningsnummer |
| `alertInformationHeader.patientId.root` | 1..1 | `AllergyIntolerance.patient.identifier.system` | OID→URI, se tabell nedan |
| `alertInformationHeader.sourceSystemHSAId` | 1..1 | `AllergyIntolerance.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `alertInformationHeader.accountableHealthcareProfessional.authorTime` | 1..1 | `AllergyIntolerance.recordedDate` | YYYYMMDDHHMMSS → ISO 8601 |
| `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId` | 0..1 | `AllergyIntolerance.recorder` (Reference(PractitionerRole)) | Logisk referens via HSA-id |
| `alertInformationHeader.legalAuthenticator.legalAuthenticatorHSAId` | 0..1 | `AllergyIntolerance.asserter` (Reference(PractitionerRole)) | Logisk referens via HSA-id |
| `alertInformationBody.ascertainedDate` | 0..1 | `AllergyIntolerance.onsetDateTime` | Datum för konstaterande av överkänslighet |
| `alertInformationBody.alertInformationComment` | 0..1 | `AllergyIntolerance.note.text` | Klinisk kommentar |
| `alertInformationBody.hypersensitivity.typeOfHypersensitivity` | 0..1 | `AllergyIntolerance.category` | Härleds från typeOfHypersensitivity; se [ALERT-002](#öppna-frågor) |
| `alertInformationBody.hypersensitivity.degreeOfCertainty` | 0..1 | `AllergyIntolerance.verificationStatus` | Kräver ConceptMap KV Visshetsgrad → FHIR verificationStatus; se [ALERT-004](#öppna-frågor) |
| `alertInformationBody.hypersensitivity.degreeOfSeverity` | 0..1 | `AllergyIntolerance.reaction.severity` | Kräver ConceptMap KV Allvarlighetsgrad → FHIR severity; se [ALERT-004](#öppna-frågor) |
| `alertInformationBody.hypersensitivity.pharmaceuticalHypersensitivity.atcSubstance` | 0..1 | `AllergyIntolerance.code.coding` | ATC-kod som primär substanskod |
| `alertInformationBody.hypersensitivity.pharmaceuticalHypersensitivity.nonATCSubstance` | 0..1 | `AllergyIntolerance.code.text` | Fritext substansnamn (fallback om atcSubstance saknas) |
| `alertInformationBody.hypersensitivity.pharmaceuticalHypersensitivity.pharmaceuticalProductId` | 0..* | `AllergyIntolerance.reaction.substance.coding` | NPL-id (1.2.752.129.2.1.5.1) |
| `alertInformationBody.hypersensitivity.otherHypersensitivity.hypersensitivityAgentCode` | 0..1 | `AllergyIntolerance.code.coding` | Agenskod (LMK, CAS m.fl.) |
| `alertInformationBody.hypersensitivity.otherHypersensitivity.hypersensitivityAgent` | 0..1 | `AllergyIntolerance.code.text` | Agens i fritext (fallback om agenskod saknas) |
| (härledd – alltid active) | — | `AllergyIntolerance.clinicalStatus` | `active`; inget statusfält i TKBn |
| (härledd – alltid allergy) | — | `AllergyIntolerance.type` | `allergy`; härledd av att body = hypersensitivity |

---

## Body XOR-sektion 2: seriousDisease (allvarlig sjukdom)

Gäller när `alertInformationBody.seriousDisease` är angivet. Skapar enbart Flag.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `alertInformationBody.seriousDisease.disease` | 1..1 | `Flag.code` | Sjukdomskod (ICD10/SNOMED); se [ALERT-002](#öppna-frågor) |

---

## Body XOR-sektion 3: treatment (behandling)

Gäller när `alertInformationBody.treatment` är angivet. Skapar enbart Flag.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `alertInformationBody.treatment.treatmentCode` | 0..1 | `Flag.code` | KVÅ-kod (1.2.752.116.1.3.2.1.4); tomt CodeableConcept om enbart treatmentDescription |
| `alertInformationBody.treatment.treatmentDescription` | 1..1 | `Flag.extension[treatmentDescription]` | Fritextbeskrivning av behandlingen |
| `alertInformationBody.treatment.pharmaceuticalTreatment` | 0..* | `Flag.extension[pharmaceuticalTreatment]` | ATC-kod (1.2.752.129.2.2.3.1.1); lista – ryms ej i Flag.code (1..1) |

---

## Body XOR-sektion 4: communicableDisease (smittsam sjukdom)

Gäller när `alertInformationBody.communicableDisease` är angivet. Skapar enbart Flag.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `alertInformationBody.communicableDisease.communicableDiseaseCode` | 1..1 | `Flag.code` | ICD10-kod; se [ALERT-002](#öppna-frågor) |
| `alertInformationBody.communicableDisease.routeOfTransmission` | 0..1 | `Flag.extension[routeOfTransmission]` | KV Smittväg |

---

## Body XOR-sektion 5: restrictionOfCare (vårdbegränsning)

Gäller när `alertInformationBody.restrictionOfCare` är angivet. Skapar enbart Flag.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `alertInformationBody.restrictionOfCare.restrictionOfCareComment` | 1..1 | `Flag.extension[restrictionOfCareComment]` | Fritext om vårdbegränsning; ingen strukturerad kod finns |

> `Flag.code` sätts till ett tomt `CodeableConcept` (obligatorisk i FHIR) vid restrictionOfCare.

---

## Body XOR-sektion 6: unstructuredAlertInformation (ostrukturerad varning)

Gäller när `alertInformationBody.unstructuredAlertInformation` är angivet. Skapar enbart Flag.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `alertInformationBody.unstructuredAlertInformation.unstructuredAlertInformationHeading` | 1..1 | `Flag.code.text` | Rubrik för varningen; `category[alertType]` = unstructuredAlertInformation |
| `alertInformationBody.unstructuredAlertInformation.unstructuredAlertInformationContent` | 1..1 | `Flag.extension[alertInformationComment]` | Innehåll/beskrivning konkateneras i kommentarsfältet |

---

## Mappningstabell – relatedAlertInformation

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `alertInformationBody.relatedAlertInformation` | 0..* | `Flag.extension[relatedAlertInformation]` | En extension-instans per relaterad signal |
| `alertInformationBody.relatedAlertInformation.typeOfAlertInformationRelationship` | 1..1 | `Flag.extension[relatedAlertInformation].typeOfRelationship` | KV Samband (1.2.752.129.2.2.2.4) |
| `alertInformationBody.relatedAlertInformation.relationComment` | 0..1 | `Flag.extension[relatedAlertInformation].relationComment` | Kommentar till sambandet |
| `alertInformationBody.relatedAlertInformation.documentId` | 1..* | `Flag.extension[relatedAlertInformation].documentId` | Relaterat dokumentid; en per post |

---

## Mappningstabell – result

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `result.resultCode` | 1..1 | Ej mappad | Teknisk responskod – hanteras av transportlagret |
| `result.errorCode` | 0..1 | Ej mappad | Teknisk felkod – hanteras av transportlagret |
| `result.subcode` | 0..1 | Ej mappad | Teknisk subkod – hanteras av transportlagret |
| `result.logId` | 1..1 | Ej mappad | Teknisk spårnings-UUID – hanteras av transportlagret |
| `result.message` | 0..1 | Ej mappad | Teknisk felbeskrivning – hanteras av transportlagret |

---

## PDL och Sparr

PDL-styrning i GetAlertInformation utgår från `accountableHealthcareProfessional`-blockets HSA-id:n i headern:

| PDL-begrepp | RIVTA-källa | Hantering |
|---|---|---|
| Yttre Sparr (vårdgivare) | `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` | `Provenance.agent[custodian].who.identifier` |
| Inre Sparr (vårdenhet) | `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` | `Provenance.agent[author].who.identifier` |
| Patientgodkännande | `alertInformationHeader.approvedForPatient` (boolean) | `Flag.meta.security`; se [PDL-001](#öppna-frågor) |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalCareGiverHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `alertInformationHeader.accountableHealthcareProfessional.healthcareProfessionalCareUnitHSAId` |

`Provenance.target` refererar Flag (och eventuell AllergyIntolerance) via `urn:uuid:{resurs.id}`.  
`Provenance.recorded` = `alertInformationHeader.accountableHealthcareProfessional.authorTime` (ISO 8601).

---

## OID-till-URI-tabell

| OID | URI |
|---|---|
| `1.2.752.129.2.1.3.1` | `http://electronichealth.se/identifier/personnummer` |
| `1.2.752.129.2.1.3.3` | `http://electronichealth.se/identifier/samordningsnummer` |
| `1.2.752.129.2.1.4.1` | `urn:oid:1.2.752.129.2.1.4.1` |
| `1.2.752.129.2.2.3.1.1` | `urn:oid:1.2.752.129.2.2.3.1.1` (ATC) |
| `1.2.752.129.2.1.5.1` | `urn:oid:1.2.752.129.2.1.5.1` (NPL-id) |

OID:er utan känd URI-mappning bevaras som `urn:oid:{oid}`.

---

## Öppna frågor

| ID | Fråga |
|---|---|
| ALERT-002 | **Okänt kodsystem för `typeOfAlertInformation`.** OID och URI för kodsystemet är inte dokumenterat i TKB:n. Avgör vilka koder som styr om AllergyIntolerance skapas och hur de mappas till `AllergyIntolerance.category`. |
| ALERT-004 | **ConceptMap saknas: degreeOfCertainty/degreeOfSeverity → FHIR.** `hypersensitivity.degreeOfCertainty` (KV Visshetsgrad 1.2.752.129.2.2.3.11) behöver ConceptMap till `AllergyIntolerance.verificationStatus`. `hypersensitivity.degreeOfSeverity` (KV Allvarlighetsgrad 1.2.752.129.2.2.3.3) behöver ConceptMap till `AllergyIntolerance.reaction.severity`. Sätt temporärt `confirmed` tills ConceptMap finns. |
| PDL-001 | **`approvedForPatient` (boolean) saknar FHIR-motsvarighet.** `meta.security` i FHIR har inget standardkodsystem för detta begrepp. Behöver gemensamt beslut för alla TK:er. |
| GENERAL-001 | **Tidsstämpelformat.** RIVTA använder `YYYYMMDDhhmmss` utan tidszon; FHIR kräver ISO 8601 med tidszon. Konvertering ska anta `Europe/Stockholm` (CET/CEST). Gäller alla tidsfält i alla tjänstekontrakt. |
