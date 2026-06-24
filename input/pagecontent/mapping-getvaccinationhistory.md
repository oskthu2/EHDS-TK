# GetVaccinationHistory – Vaccinationshistorik

**Tjänstekontrakt:** `clinicalprocess:activityprescription:actoutcome` GetVaccinationHistory v2.0  
**FHIR-profiler:** [IneraEHDSImmunization](StructureDefinition-inera-ehds-immunization.html) | [IneraEHDSDevice](StructureDefinition-inera-ehds-device.html) | [IneraEHDSOrganization](StructureDefinition-inera-ehds-organization.html)  
**Logisk modell:** [IneraEHDSLMVaccinationHistory](StructureDefinition-inera-ehds-lm-vaccination-history.html)  
**Krävs för NPÖ:** Ja (v2.0) | **Krävs för 1177 Journal:** Ja (v1.0, 2.0)  
**EHDS-koppling:** Patient Summary – Vaccinationer

---

> **VIKTIGT – Namnkonvention för header-element i detta TK**
>
> GetVaccinationHistory v2.0 använder `accountableHealth**C**areProfessional` (versalt 'C' i 'Care')
> som namn på header-elementet – i stället för `accountableHealthcareProfessional` (lowercase 'c')
> som används i de flesta övriga TK:er. Det är samma information; stavningen i element-sökvägen
> skiljer sig. Bryggkoden måste hantera detta explicit.

---

## Resurshierarki

```
IneraEHDSImmunization (1 per administrationRecord)
  ├── extension[registrationDevice] → IneraEHDSDevice (registrationRecord.sourceSystem*)
  ├── performer[administering].actor → PractitionerRole (administrationRecord.performer)
  ├── performer[administering].actor → IneraEHDSOrganization (administrationRecord.performerOrg)
  │     └── identifier[smiId] = registrationRecord.careUnitSmiId
  ├── performer[administering].actor → IneraEHDSOrganization (registrationRecord.careGiverOrg)
  ├── performer[ordering].actor   → PractitionerRole/IneraEHDSOrganization (administrationRecord.prescriber*)
  └── protocolApplied[0] (vaccineTargetDisease, doseOrdinalNumber, numberOfPrescribedDoses)
```

Varje `vaccinationMedicalRecord`-post kan innehålla ett `registrationRecord 1..1` med noll till
många `administrationRecord 0..*`. En `Immunization`-resurs skapas per `administrationRecord`.
Fält från `registrationRecord` som saknar specifikt `administrationRecord`-fält delas/ärvs
av alla Immunization-resurser från samma post. Se [VAC-001](#öppna-frågor).

Källsystemsmetadata (`sourceSystemName/productName/productVersion/sourceSystemContact`) samlas
i en separat `IneraEHDSDevice`-resurs som refereras via `Immunization.extension[registrationDevice]`
i stället för enskilda extensions på Immunization.

---

## Mappningstabell – vaccinationMedicalRecordHeader

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `vaccinationMedicalRecordHeader.documentId` | 1..1 | `Immunization.identifier[0].value` | Källsystemets dokumentidentifierare |
| `vaccinationMedicalRecordHeader.sourceSystemHSAId` | 1..1 | `Immunization.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `vaccinationMedicalRecordHeader.documentTitle` | 0..1 | Ej mappad | Fritexttitel för dokument – ingen motsvarighet i Immunization |
| `vaccinationMedicalRecordHeader.documentTime` | 0..1 | `Immunization.occurrenceDateTime` | Vaccinationstidpunkt (händelsetidpunkt); YYYYMMDDHHMMSS → ISO 8601. OBS: kan komma i konflikt med authorTime – se [VAC-002](#öppna-frågor) |
| `vaccinationMedicalRecordHeader.patientId.extension` | 1..1 | `Immunization.patient.identifier.value` | Personnummer eller samordningsnummer |
| `vaccinationMedicalRecordHeader.patientId.root` | 1..1 | `Immunization.patient.identifier.system` | OID→URI, se tabell nedan |
| `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.authorTime` | 1..1 | `Immunization.occurrenceDateTime` | Dokumentationstidpunkt – används som fallback om documentTime saknas; YYYYMMDDHHMMSS → ISO 8601 (Europe/Stockholm), se [VAC-002](#öppna-frågor) |
| `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalHSAId` | 0..1 | `Immunization.performer[0].actor` (Reference(PractitionerRole)) | Ansvarig yrkesutövares HSA-id |
| `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalName` | 0..1 | `PractitionerRole.practitioner.display` | Ansvarig yrkesutövares visningsnamn |
| `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalRoleCode` | 0..1 | `PractitionerRole.code` | Ansvarig yrkesutövares befattningskod |
| `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId` | 0..1 | `PractitionerRole.organization.identifier.value` | Organisationsenhetens HSA-id |
| `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalOrgUnit.orgUnitName` | 0..1 | `PractitionerRole.organization.display` | Organisationsenhetens namn |
| `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalOrgUnit.orgUnitTelecom` | 0..1 | Ej mappad | Telefon till organisationsenhet – Immunization saknar adressfält |
| `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalOrgUnit.orgUnitEmail` | 0..1 | Ej mappad | E-post till organisationsenhet – se orgUnitTelecom ovan |
| `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalOrgUnit.orgUnitAddress` | 0..1 | Ej mappad | Postadress till organisationsenhet – se orgUnitTelecom ovan |
| `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalOrgUnit.orgUnitLocation` | 0..1 | Ej mappad | Plats/ort för organisationsenhet – se orgUnitTelecom ovan |
| `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalCareUnitHSAId` | 0..1 | `Provenance.agent[author].who.identifier` | **Inre Sparr** – versalt 'C' i 'Care' |
| `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalCareGiverHSAId` | 0..1 | `Provenance.agent[custodian].who.identifier` | **Yttre Sparr** – versalt 'C' i 'Care' |
| `vaccinationMedicalRecordHeader.legalAuthenticator.signatureTime` | 1..1 (om legalAuth) | `Immunization.extension[legalAuthenticator].signatureTime` | Signeringstidpunkt; YYYYMMDDHHMMSS → ISO 8601 |
| `vaccinationMedicalRecordHeader.legalAuthenticator.legalAuthenticatorHSAId` | 0..1 | `Immunization.extension[legalAuthenticator].hsaId` | HSA-id för signerare |
| `vaccinationMedicalRecordHeader.legalAuthenticator.legalAuthenticatorName` | 0..1 | Ej mappad | Namn i klartext – HSA-id räcker för logisk referens |
| `vaccinationMedicalRecordHeader.approvedForPatient` | 1..1 | `Immunization.meta.security` | PDL-kontroll – se [PDL-001](#öppna-frågor) |
| `vaccinationMedicalRecordHeader.careContactId` | 0..1 | `Immunization.encounter.identifier` | Logisk referens till Encounter |
| `vaccinationMedicalRecordHeader.nullified` | 1..1 | `Immunization.status` | true→`entered-in-error`, false→`completed`; se DES-007 |
| `vaccinationMedicalRecordHeader.nullifiedReason` | 0..1 | `Immunization.statusReason.text` | Makuleringsorsak (fritext). Villkor: Får ENBART anges om nullified = true. |

---

## Mappningstabell – registrationRecord

`registrationRecord 1..1` innehåller registreringsmetadata som gäller för alla
`administrationRecord` inom samma `vaccinationMedicalRecord`.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `vaccinationMedicalRecordBody.registrationRecord.date` | 1..1 | `Immunization.recorded` | Datum då vaccination(er) dokumenterades (inte nödvändigtvis genomfördes) |
| `vaccinationMedicalRecordBody.registrationRecord.patientPostalCode` | 0..1 | `Immunization.extension[patientPostalCode]` | Patientens postnummer vid vaccinationstillfället |
| `vaccinationMedicalRecordBody.registrationRecord.vaccinationUnstructuredNote` | 0..1 | `Immunization.note[0].text` | Ostrukturerad anteckning om vaccinationsregistreringen |
| `vaccinationMedicalRecordBody.registrationRecord.riskCategory` | 0..* | `Immunization.programEligibility` | Riskgrupp/programbehörighet; standard R4-element för vaccinationsprogramseligibilitet |
| `vaccinationMedicalRecordBody.registrationRecord.patientAdverseEffect` | 0..* | `Immunization.reaction[].detail` | Patientens biverkningar kopplade till registreringen |
| `vaccinationMedicalRecordBody.registrationRecord.careGiverOrg.orgUnitHSAId` | 0..1 | `Immunization.performer[2].actor.identifier.value` | Juridisk vårdgivares HSA-id |
| `vaccinationMedicalRecordBody.registrationRecord.careGiverOrg.orgUnitName` | 0..1 | `Immunization.performer[2].actor.display` | Juridisk vårdgivares namn |
| `vaccinationMedicalRecordBody.registrationRecord.careGiverOrg.orgUnitTelecom` | 0..1 | Ej mappad | Telefon till juridisk vårdgivare – Immunization saknar adressfält |
| `vaccinationMedicalRecordBody.registrationRecord.careGiverOrg.orgUnitEmail` | 0..1 | Ej mappad | E-post till juridisk vårdgivare – se orgUnitTelecom ovan |
| `vaccinationMedicalRecordBody.registrationRecord.careGiverOrg.orgUnitAddress` | 0..1 | Ej mappad | Postadress till juridisk vårdgivare – se orgUnitTelecom ovan |
| `vaccinationMedicalRecordBody.registrationRecord.careGiverOrg.orgUnitLocation` | 0..1 | Ej mappad | Plats/ort för juridisk vårdgivare – se orgUnitTelecom ovan |
| `vaccinationMedicalRecordBody.registrationRecord.careGiverContact.actorId` | 0..1 | Ej mappad | Kontaktpersonens identifierare hos juridisk vårdgivare – inget FHIR-fält för kontaktperson på registreringsnivå |
| `vaccinationMedicalRecordBody.registrationRecord.careGiverContact.actorName` | 0..1 | Ej mappad | Kontaktpersonens namn hos juridisk vårdgivare – se actorId ovan |
| `vaccinationMedicalRecordBody.registrationRecord.sourceSystemName` | 1..1 | `Device.deviceName[systemName].name` | Källsystemets klartextnamn; via `Immunization.extension[registrationDevice]` → IneraEHDSDevice |
| `vaccinationMedicalRecordBody.registrationRecord.sourceSystemProductName` | 0..1 | `Device.deviceName[productName].name` | Källsystemets produktnamn; se Device-tabell nedan |
| `vaccinationMedicalRecordBody.registrationRecord.sourceSystemProductVersion` | 0..1 | `Device.version.value` | Källsystemets produktversion; se Device-tabell nedan |
| `vaccinationMedicalRecordBody.registrationRecord.sourceSystemContact.actorId` | 0..1 | `Device.extension[sourceSystemContact].actorId` | Identifierare för källsystemsansvarig kontakt; se Device-tabell nedan |
| `vaccinationMedicalRecordBody.registrationRecord.sourceSystemContact.actorName` | 0..1 | `Device.extension[sourceSystemContact].actorName` | Namn på källsystemsansvarig kontakt; se Device-tabell nedan |
| `vaccinationMedicalRecordBody.registrationRecord.careUnitSmiId` | 0..1 | `IneraEHDSOrganization.identifier[smiId]` | SMI-id läggs som identifierarslice på den utförande vårdenhetens Organization-resurs (`performer[administering].actor`) – se Designbeslut nedan |

---

## Mappningstabell – IneraEHDSDevice (sourceSystem-fält)

`Immunization.extension[registrationDevice]` refererar en `IneraEHDSDevice`-resurs som samlar
alla källsystemsmetadata från `registrationRecord`. Resursen skapas alltid (sourceSystemName är 1..1).

| RIVTA-element | Kard. | Device-element | Kommentar |
|---|---|---|---|
| `registrationRecord.sourceSystemName` | 1..1 | `Device.deviceName[systemName].name` | type = `user-friendly-name` |
| `registrationRecord.sourceSystemProductName` | 0..1 | `Device.deviceName[productName].name` | type = `model-name` |
| `registrationRecord.sourceSystemProductVersion` | 0..1 | `Device.version.value` | Produktversion som fritext |
| `registrationRecord.sourceSystemContact.actorId` | 0..1 | `Device.extension[sourceSystemContact].actorId` | Kontaktpersonens identifierare |
| `registrationRecord.sourceSystemContact.actorName` | 0..1 | `Device.extension[sourceSystemContact].actorName` | Kontaktpersonens namn |

---

## Mappningstabell – administrationRecord (per Immunization-resurs)

En `Immunization`-resurs skapas för varje `administrationRecord`. Fält nedan mappas per post.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `administrationRecord.vaccinationProgramName` | 0..1 | `Immunization.protocolApplied[0].series` | Vaccinationsprogrammets namn (t.ex. "Nationellt barnvaccinationsprogram") |
| `administrationRecord.prescriberOrg.orgUnitHSAId` | 0..1 | `Immunization.performer[ordering].actor.identifier` | Förskrivande vårdenhetens HSA-id; actor = IneraEHDSOrganization; `function = OP` |
| `administrationRecord.prescriberOrg.orgUnitName` | 0..1 | `Immunization.performer[ordering].actor.name` | Förskrivande vårdenhetens namn |
| `administrationRecord.prescriberPerson.actorId` | 0..1 | `Immunization.performer[ordering].actor.identifier` | Förskrivande yrkesutövarens identifierare; actor = PractitionerRole; `function = OP` |
| `administrationRecord.prescriberPerson.actorName` | 0..1 | `Immunization.performer[ordering].actor.display` | Förskrivande yrkesutövarens namn |
| `administrationRecord.performerOrg.orgUnitHSAId` | 0..1 | `Immunization.performer[1].actor.identifier.value` | Administrerande vårdenhetens HSA-id |
| `administrationRecord.performerOrg.orgUnitName` | 0..1 | `Immunization.performer[1].actor.display` | Administrerande vårdenhetens namn |
| `administrationRecord.performer.actorId` | 0..1 | `Immunization.performer[0].actor.identifier.value` | Administrerande yrkesutövarens identifierare |
| `administrationRecord.performer.actorName` | 0..1 | `Immunization.performer[0].actor.display` | Administrerande yrkesutövarens namn |
| `administrationRecord.anatomicalSite` | 0..1 | `Immunization.site` | Anatomisk injektionsplats (CodeableConcept) |
| `administrationRecord.route` | 0..1 | `Immunization.route` | Administreringssätt (CodeableConcept) |
| `administrationRecord.dose.quantity` | 0..1 | `Immunization.doseQuantity` | Dos med mängd och enhet (Quantity) |
| `administrationRecord.dose.displayName` | 1..1 (om dose) | `Immunization.doseQuantity.unit` | Dosens visningsnamn/enhetsetikett (fritext) |
| `administrationRecord.isDoseComplete` | 0..1 | `Immunization.extension[isDoseComplete]` | Anger om hela dosen administrerades (boolean) |
| `administrationRecord.doseOrdinalNumber` | 0..1 | `Immunization.protocolApplied[0].doseNumberPositiveInt` | Ordningsnummer för denna dos i serien |
| `administrationRecord.numberOfPrescribedDoses` | 0..1 | `Immunization.protocolApplied[0].seriesDosesPositiveInt` | Totalt antal ordinerade doser i serien |
| `administrationRecord.sourceDescription` | 0..1 | `Immunization.reportOrigin.text` | Fritext om källa för efterregistrerad vaccinering; originaltext för eventuell kod. Sätter även `primarySource = false`. |
| `administrationRecord.commentPrescription` | 0..1 | `Immunization.note[1].text` | Fritext: instruktioner från ordination |
| `administrationRecord.commentAdministration` | 0..1 | `Immunization.note[0].text` | Fritext: kommentarer vid vaccinering |
| `administrationRecord.patientAdverseEffect` | 0..* | `Immunization.reaction[].detail` | Biverkningar specifika för detta administreringstillfälle |
| `administrationRecord.typeOfVaccine` | 0..1 | `Immunization.vaccineCode.coding` | Vaccintyp – vilka sjukdomar vaccinet skyddar emot (CodeableConcept) |
| `administrationRecord.vaccineName` | 0..1 | `Immunization.vaccineCode.text` | Vaccinets produktnamn (fritext) |
| `administrationRecord.vaccineBatchId` | 0..1 | `Immunization.lotNumber` | Vaccinsats-/partinummer |
| `administrationRecord.vaccineManufacturer` | 0..1 | `Immunization.manufacturer.display` | Tillverkarens namn (fritext) |
| `administrationRecord.vaccineTargetDisease` | 0..* | `Immunization.protocolApplied[0].targetDisease` | Målsjukdom(ar) som vaccinet riktar sig mot |
| `administrationRecord.vaccinationUniqueReference` | 0..1 | `Immunization.identifier[1]` | Unik vaccinationsreferens från källsystemet |

---

## Mappningstabell – additionalPatientInformation (om present)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `vaccinationMedicalRecordBody.additionalPatientInformation.dateOfBirth` | 1..1 | `Immunization.patient.birthDate` | Kräver inline Patient-resurs eller extension på patient |
| `vaccinationMedicalRecordBody.additionalPatientInformation.gender` | 0..1 | `Immunization.patient.gender` | Administrativt kön (KV Kön OID 1.2.752.129.2.2.1.1 → AdministrativeGender). CVType-begränsning: originalText är förbjudet (0..0) per TKB. |

---

## Mappningstabell – result (tekniska svarsfält)

`result 1..1` innehåller teknisk statusinformation som hanteras av transportlagret och inte
ingår i klinisk FHIR-data.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `result.resultCode` | 1..1 | Ej mappad | Teknisk responskod (OK/INFO/ERROR) – hanteras av transportlagret |
| `result.errorCode` | 0..1 | Ej mappad | Teknisk felkod – hanteras av transportlagret |
| `result.subcode` | 0..1 | Ej mappad | Teknisk subkod – hanteras av transportlagret |
| `result.logId` | 1..1 | Ej mappad | Teknisk spårnings-UUID – hanteras av transportlagret |
| `result.message` | 0..1 | Ej mappad | Teknisk felbeskrivning – hanteras av transportlagret |

---

## Härledda fält / Designbeslut

### Immunization.status (från nullified)

`vaccinationMedicalRecordHeader.nullified 1..1 boolean` styr statusen för alla `Immunization`-resurser
i posten (DES-007):

| nullified | Immunization.status | Immunization.statusReason |
|---|---|---|
| `false` | `completed` | (sätts ej) |
| `true` | `entered-in-error` | `nullifiedReason` (om satt) |

### En Immunization per administrationRecord (VAC-001)

`registrationRecord 1..1` är behållaren; `administrationRecord 0..*` är de enskilda
vaccinationshändelserna. Designbeslut: en `Immunization` per `administrationRecord`.

- Fält från `registrationRecord` (datum, riskCategory, careGiverOrg etc.) kopieras/delas
  till alla Immunization-resurser från samma `vaccinationMedicalRecord`.
- Om `administrationRecord` är tom (0 poster) skapas en `Immunization` baserad enbart på
  `registrationRecord`-data med minimal information.

### Immunization.occurrenceDateTime (VAC-002)

Primär tidskälla är `vaccinationMedicalRecordHeader.documentTime` om den finns – den anger
faktisk vaccinationstidpunkt. Om `documentTime` saknas används
`accountableHealthCareProfessional.authorTime` som fallback (dokumentationstidpunkt).
`registrationRecord.date` (date, ej dateTime) används alltid som `Immunization.recorded`.

### sourceSystem-fält → IneraEHDSDevice (registrationDevice)

`registrationRecord` innehåller fem källsystemsfält (`sourceSystemName`, `sourceSystemProductName`,
`sourceSystemProductVersion`, `sourceSystemContact.actorId`, `sourceSystemContact.actorName`)
som tillsammans beskriver det system varifrån vaccinationsregistreringen härstammar.

I stället för att lägga dessa som enskilda extensions direkt på Immunization samlas de i en
`IneraEHDSDevice`-resurs och refereras via `Immunization.extension[registrationDevice]`. Fördelar:

- `Device` är FHIR:s semantiskt korrekta resurs för IT-system som genererar klinisk data
- Eliminerar ett sub-extension-mönster (`extension[sourceSystem].systemName` etc.) till förmån för  
  väldefinierade Device-element (`deviceName`, `version`)
- Möjliggör enkel sökning på källsystem: `Device.deviceName.name` är ett sökbart fält

### performer-slicing (function=AP/OP)

`Immunization.performer` slicas på `function` med koder från `http://terminology.hl7.org/CodeSystem/v2-0443`:

| Slice | function | Källa | Actor-typ |
|---|---|---|---|
| `performer[administering]` | `AP` (Administering Provider) | `administrationRecord.performer` | PractitionerRole |
| `performer[administering]` | `AP` | `administrationRecord.performerOrg` | IneraEHDSOrganization (inkl. SMI-id) |
| `performer[administering]` | `AP` | `registrationRecord.careGiverOrg` | IneraEHDSOrganization |
| `performer[ordering]` | `OP` (Ordering Provider) | `administrationRecord.prescriberPerson/prescriberOrg` | PractitionerRole / IneraEHDSOrganization |

`performer[administering]` är 0..* och täcker alla AP-roller.
`performer[ordering]` är 0..1 och representerar prescriber.

### careUnitSmiId → IneraEHDSOrganization.identifier[smiId]

`registrationRecord.careUnitSmiId` är SMI-id för den vårdenhet som administrerade vaccinet.
I stället för en custom extension på Immunization läggs det som identifierarslice på
`performer[administering].actor` (Organization) via `IneraEHDSOrganization.identifier[smiId]`.
Samma Organization bär även HSA-id via `identifier[hsaId]`.

> OBS: SMI-id:ts OID (`urn:oid:1.2.752.194.10.1.1`) behöver verifieras mot Folkhälsomyndighetens  
> faktiska NamingSystem – se [VAC-006](#öppna-frågor).

### riskCategory → programEligibility

`registrationRecord.riskCategory (0..*)`-koder mappar till `Immunization.programEligibility (0..*)`.
`programEligibility` är FHIR R4:s standardelement för att ange vilken riskgrupp eller
programmässig behörighet som motiverade vaccinationen.

### sourceDescription → reportOrigin

`administrationRecord.sourceDescription` (fritext) är källbeskrivningen för en efterregistrering.
Den mappar till `Immunization.reportOrigin.text` – reportOrigin är ett CodeableConcept och
`.text` är korrekt plats för en originaltext/fritext. Närvaro av sourceDescription innebär att
`Immunization.primarySource` sätts till `false`.

---

## PDL och Sparr

PDL-styrning utgår från `accountableHealthCareProfessional`-blocket i headern.
**OBS:** Elementnamnet har versalt 'C' i 'Care' (avvikelse från andra TK:ers stavning):

| PDL-begrepp | RIVTA-källa | Hantering |
|---|---|---|
| Yttre Sparr (vårdgivare) | `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalCareGiverHSAId` | `Provenance.agent[custodian].who.identifier` |
| Inre Sparr (vårdenhet) | `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalCareUnitHSAId` | `Provenance.agent[author].who.identifier` |
| Patientgodkännande | `vaccinationMedicalRecordHeader.approvedForPatient` (boolean) | `Immunization.meta.security`; se [PDL-001](#öppna-frågor) |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalCareGiverHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.healthcareProfessionalCareUnitHSAId` |

`Provenance.target` refererar `Immunization` via `urn:uuid:{resurs.id}`.  
`Provenance.recorded` = `vaccinationMedicalRecordHeader.accountableHealthCareProfessional.authorTime` (ISO 8601).

---

## OID-till-URI-tabell

| OID | URI |
|---|---|
| `1.2.752.129.2.1.3.1` | `http://electronichealth.se/identifier/personnummer` |
| `1.2.752.129.2.1.3.3` | `http://electronichealth.se/identifier/samordningsnummer` |
| `1.2.752.129.2.1.4.1` | `urn:oid:1.2.752.129.2.1.4.1` |

OID:er utan känd URI-mappning bevaras som `urn:oid:{oid}`.

---

## Öppna frågor

| ID | Fråga |
|---|---|
| VAC-001 | **`registrationRecord` (1..1) + `administrationRecord` (0..*) – en Immunization per administrationRecord.** Om `administrationRecord` är tomt skapas en Immunization med enbart registreringsdata. Behöver verifieras om detta är önskat beteende eller om sådana poster ska filtreras bort. |
| VAC-002 | **`documentTime` kontra `authorTime` som källa för `occurrenceDateTime`.** `documentTime 0..1` anger vaccinationshändelsens tidpunkt; `authorTime 1..1` anger dokumentationstidpunkten. Om båda är satta kan de skilja sig. Beslut: `documentTime` har prioritet; `authorTime` används som fallback. Behöver bekräftelse från domänexpert. |
| PDL-001 | **`approvedForPatient` (boolean) saknar standardiserat FHIR-kodsystem.** Fältet mappas tentativt till `meta.security` men inget standardiserat kodsystem för detta begrepp finns. Behöver gemensamt beslut; se central issue i [mapping-issues](mapping-issues.html). |
| GENERAL-001 | **Tidsstämpelformat.** RIVTA använder `YYYYMMDDhhmmss` utan tidszon; FHIR kräver ISO 8601 med tidszon. Konvertering ska anta `Europe/Stockholm` (CET/CEST). Gäller alla tidsfält. |

| VAC-006 | **SMI-id OID behöver verifieras.** `IneraEHDSOrganization.identifier[smiId].system` sätts preliminärt till `urn:oid:1.2.752.194.10.1.1`. Korrigera mot Folkhälsomyndighetens faktiska NamingSystem för vaccinationsregistret. |

## Föreslagna nya issues

| ID | Förslag |
|---|---|
| VAC-003 | **`careGiverContact` saknar FHIR-mappning.** Kontaktpersoninformation hos juridisk vårdgivare (`careGiverContact.actorId`, `careGiverContact.actorName`) har ingen naturlig plats i Immunization eller Provenance. Behöver beslut: ignorera eller lägga i extension. |
| VAC-004 | **`documentTitle` saknar mappning.** Fritexttiteln för vaccinationsdokumentet har ingen standardmotpart i Immunization. Överväg `Immunization.note` eller ignorera som administrativ etikett. |
| VAC-005 | **`legalAuthenticator` i Immunization-profil.** Immunization saknar ett standard `authenticator`-fält (till skillnad från DocumentReference). Custom extension behövs för att bevara legalAuthenticator-blocket. Beslut behövs om legalAuthenticator är relevant för vaccinationsdata eller kan utelämnas. |
