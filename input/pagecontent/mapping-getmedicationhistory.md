# GetMedicationHistory – Läkemedelshistorik

**Tjänstekontrakt:** `clinicalprocess:activityprescription:actoutcome` GetMedicationHistory v2.2  
**FHIR-profil:** [SEEHDSMedicationStatement](StructureDefinition-se-ehds-medication-statement.html)  
**Logisk modell:** [SEEHDSLMMedicationHistory](StructureDefinition-se-ehds-lm-medication-history.html)  
**Krävs för NPÖ:** Ja (v2.2) | **Krävs för 1177 Journal:** Ja (v2.2)  
**EHDS-koppling:** Patient Summary – Aktuella läkemedel. EHDS har även separata domäner för ePrescription och eDispensation.

---

> **VIKTIGT – Namnkonvention för PDL-fält i detta TK**
>
> I GetMedicationHistory v2.2 används **lowercase 'c'** i kamelnotationen för PDL-fälten:
> `healthcareProfessional**c**areUnitHSAId` och `healthcareProfessional**c**areGiverHSAId`
> (inte `healthcareProfessionalCareUnitHSAId` med versalt 'C' som i de flesta andra TK:er).
> Detta är en känd avvikelse i TKB:n och måste hanteras explicit i bryggkoden.

---

## Resurshierarki

```
SEEHDSMedicationStatement (1 per medicationMedicalRecord)
  └── informationSource → PractitionerRole (accountableHealthcareProfessional)
  └── medicationCodeableConcept (drug, 5 XOR-varianter)
  └── basedOn → (logisk referens om koppling till recept/SIL finns)
```

Varje `medicationMedicalRecord`-post ger upphov till en `MedicationStatement`. Relationer
mellan ordinationer (`prescriptionChainId`, `precedingPrescriptionId`, `succeedingPrescriptionId`)
representeras via extensions – se [MED-001](#öppna-frågor).

---

## Mappningstabell – medicationMedicalRecordHeader

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `medicationMedicalRecordHeader.documentId` | 1..1 | `MedicationStatement.identifier` | Källsystemets dokumentidentifierare |
| `medicationMedicalRecordHeader.sourceSystemHSAId` | 1..1 | `MedicationStatement.meta.source` | Format: `urn:oid:1.2.752.129.2.1.4.1#{hsaId}` |
| `medicationMedicalRecordHeader.patientId.extension` | 1..1 | `MedicationStatement.subject.identifier.value` | Personnummer eller samordningsnummer |
| `medicationMedicalRecordHeader.patientId.root` | 1..1 | `MedicationStatement.subject.identifier.system` | OID→URI, se tabell nedan |
| `medicationMedicalRecordHeader.accountableHealthcareProfessional.authorTime` | 1..1 | `MedicationStatement.dateAsserted` | YYYYMMDDHHMMSS → ISO 8601 (Europe/Stockholm), se [GENERAL-001](#öppna-frågor) |
| `medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalHSAId` | 0..1 | `MedicationStatement.informationSource` (Reference(PractitionerRole)) | Logisk referens via HSA-id |
| `medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalName` | 0..1 | `PractitionerRole.practitioner.display` | Visningsnamn för ansvarig yrkesutövare |
| `medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalRoleCode` | 0..1 | `PractitionerRole.code` | Yrkesrollskod |
| `medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitHSAId` | 0..1 | `PractitionerRole.organization.identifier.value` | Organisationsenhetens HSA-id |
| `medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalOrgUnit.orgUnitName` | 0..1 | `PractitionerRole.organization.display` | Organisationsenhetens namn |
| `medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalcareGiverHSAId` | 0..1 | `Provenance.agent[custodian].who.identifier` | **Yttre Sparr** – lowercase 'c' i 'care' (TK-specifik stavning) |
| `medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalcareUnitHSAId` | 0..1 | `Provenance.agent[author].who.identifier` | **Inre Sparr** – lowercase 'c' i 'care' (TK-specifik stavning) |
| `medicationMedicalRecordHeader.legalAuthenticator.signatureTime` | 1..1 (om legalAuth) | `MedicationStatement.extension[legalAuthenticator].signatureTime` | Signeringstidpunkt; YYYYMMDDHHMMSS → ISO 8601 |
| `medicationMedicalRecordHeader.legalAuthenticator.legalAuthenticatorHSAId` | 0..1 | `MedicationStatement.extension[legalAuthenticator].hsaId` | HSA-id för signerare |
| `medicationMedicalRecordHeader.legalAuthenticator.legalAuthenticatorName` | 0..1 | `MedicationStatement.extension[legalAuthenticator].name` | Visningsnamn för signerare |
| `medicationMedicalRecordHeader.approvedForPatient` | 1..1 | (ej mappad) | Inget standardiserat FHIR-fält; se [PDL-001](#öppna-frågor) |
| `medicationMedicalRecordHeader.careContactId` | 0..1 | `MedicationStatement.context.identifier.value` | Logisk referens till vårdkontakt |

---

## Mappningstabell – medicationPrescription

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `medicationMedicalRecordBody.medicationPrescription.prescriptionId` | 1..1 | `MedicationStatement.identifier[1]` | Ordinationens primäridentifierare (utöver documentId i headern) |
| `medicationMedicalRecordBody.medicationPrescription.typeOfPrescription` | 1..1 | `MedicationStatement.extension[typeOfPrescription]` | I=Insättning, U=Utsättning; se [MED-002](#öppna-frågor) |
| `medicationMedicalRecordBody.medicationPrescription.prescriptionStatus` | 1..1 | `MedicationStatement.status` | Active→`active`, Inactive→`stopped`; se härledda fält |
| `medicationMedicalRecordBody.medicationPrescription.prescriptionNote` | 0..1 | `MedicationStatement.note[0].text` | Fritext anteckning om ordination |
| `medicationMedicalRecordBody.medicationPrescription.principalPrescriptionReason[i].reason` | 0..1 | `MedicationStatement.reasonCode[i]` | Primär ordinationsorsak (CodeableConcept) |
| `medicationMedicalRecordBody.medicationPrescription.principalPrescriptionReason[i].otherReason` | 0..1 | `MedicationStatement.note[].text` | Fritextorsak; läggs som separat anteckning |
| `medicationMedicalRecordBody.medicationPrescription.additionalPrescriptionReason[i].reason` | 0..1 | `MedicationStatement.reasonCode[i]` | Ytterligare ordinationsorsak |
| `medicationMedicalRecordBody.medicationPrescription.additionalPrescriptionReason[i].otherReason` | 0..1 | `MedicationStatement.note[].text` | Ytterligare fritextorsak |
| `medicationMedicalRecordBody.medicationPrescription.evaluationTime` | 0..1 | `MedicationStatement.extension[evaluationTime]` | Planerad utvärderingstidpunkt; YYYYMMDDHHMMSS → ISO 8601 |
| `medicationMedicalRecordBody.medicationPrescription.treatmentPurpose` | 0..1 | `MedicationStatement.note[1].text` | Behandlingsändamål (fritext) |
| `medicationMedicalRecordBody.medicationPrescription.prescriptionChainId` | 0..1 | `MedicationStatement.extension[prescriptionChain].chainId` | Kedjeidentifierare för relaterade ordinationer |
| `medicationMedicalRecordBody.medicationPrescription.precedingPrescriptionId` | 0..1 | `MedicationStatement.extension[prescriptionChain].precedingId` | Föregående ordination i kedjan |
| `medicationMedicalRecordBody.medicationPrescription.succeedingPrescriptionId` | 0..1 | `MedicationStatement.extension[prescriptionChain].succeedingId` | Efterföljande ordination i kedjan |
| `medicationMedicalRecordBody.medicationPrescription.prescriber.authorTime` | 0..1 | `MedicationStatement.extension[prescriber].authorTime` | Förskrivartidpunkt |
| `medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalHSAId` | 0..1 | `MedicationStatement.extension[prescriber].hsaId` | Förskrivarens HSA-id |
| `medicationMedicalRecordBody.medicationPrescription.prescriber.healthcareProfessionalName` | 0..1 | `MedicationStatement.extension[prescriber].name` | Förskrivarens namn |
| `medicationMedicalRecordBody.medicationPrescription.evaluator.healthcareProfessionalHSAId` | 0..1 | `MedicationStatement.extension[evaluator].hsaId` | Utvärderarens HSA-id |
| `medicationMedicalRecordBody.medicationPrescription.startOfFirstTreatment` | 0..1 | `MedicationStatement.extension[startOfFirstTreatment]` | Start för första behandlingsomgång; YYYYMMDDHHMMSS → ISO 8601 |
| `medicationMedicalRecordBody.medicationPrescription.startOfTreatment` | 0..1 | `MedicationStatement.effectivePeriod.start` | Behandlingsstart; YYYYMMDDHHMMSS → ISO 8601 |
| `medicationMedicalRecordBody.medicationPrescription.endOfTreatment` | 0..1 | `MedicationStatement.effectivePeriod.end` | Behandlingsslut; YYYYMMDDHHMMSS → ISO 8601 |
| `medicationMedicalRecordBody.medicationPrescription.endOfTreatmentReason` | 0..1 | `MedicationStatement.extension[endOfTreatmentReason]` | Orsak till behandlingsavslut (CodeableConcept) |
| `medicationMedicalRecordBody.medicationPrescription.selfMedication` | 1..1 | `MedicationStatement.extension[selfMedication]` | Egenmedicinering (boolean); DES-008 |

> **Obs – dispensationAuthorization, administration, relation:** Dessa element i TKB:n är markerade
> "delvis extraherade – kontrollera manuellt" och saknar fullständig mappning i denna version.
> Se [MED-001](#öppna-frågor).

---

## Mappningstabell – drug (XOR-villkor)

`drug 0..1` innehåller ett av fem alternativa delelement (ömsesidigt uteslutande). Alla varianter
mappas till `MedicationStatement.medicationCodeableConcept`. Se [MED-003](#öppna-frågor) för
begränsning i FSH-uttrycket.

| RIVTA-alternativ | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `drug.unstructuredDrugInformation` | 0..1 | `MedicationStatement.medicationCodeableConcept.text` | Ostrukturerad läkemedelsinformation; ingen coding-del |
| `drug.merchandise.name` | 0..1 | `MedicationStatement.medicationCodeableConcept.text` | Handelsvarans namn |
| `drug.merchandise.code` | 0..1 | `MedicationStatement.medicationCodeableConcept.coding` | Handelsvarans kod (lokalt kodsystem) |
| `drug.merchandise.manufacturer` | 0..1 | `MedicationStatement.extension[manufacturer]` | Tillverkare (fritext) |
| `drug.drugArticle.name` | 0..1 | `MedicationStatement.medicationCodeableConcept.text` | Läkemedelsartikelns namn |
| `drug.drugArticle.nplPackId` | 0..1 | `MedicationStatement.medicationCodeableConcept.coding` | NPL förpacknings-id; system=`urn:oid:1.2.752.129.2.1.5.2` |
| `drug.drug.name` | 0..1 | `MedicationStatement.medicationCodeableConcept.text` | Läkemedlets namn |
| `drug.drug.nplId` | 0..1 | `MedicationStatement.medicationCodeableConcept.coding` | NPL-id; system=`urn:oid:1.2.752.129.2.1.5.1` |
| `drug.drug.atcCode` | 0..1 | `MedicationStatement.medicationCodeableConcept.coding` | ATC-kod; system=`http://www.whocc.no/atc` |
| `drug.generics.name` | 0..1 | `MedicationStatement.medicationCodeableConcept.text` | Generikans namn |
| `drug.generics.atcCode` | 0..1 | `MedicationStatement.medicationCodeableConcept.coding` | ATC-kod för generika; system=`http://www.whocc.no/atc` |

---

## Mappningstabell – dosage

`dosage 0..*` kan innehålla flera doseringsposter. Varje `dosage[i]` mappas till
`MedicationStatement.dosage[i]`.

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `dosage[i].dosageInstruction` | 1..1 | `MedicationStatement.dosage[i].text` | Doseringsanvisning (fritext) |
| `dosage[i].unitDose` | 0..1 | `MedicationStatement.dosage[i].doseAndRate.doseQuantity` | Enhetsdos med mängd och enhet |
| `dosage[i].shortNotation` | 0..1 | `MedicationStatement.dosage[i].patientInstruction` | Kortnotation (t.ex. "1x2") |
| `dosage[i].maximumDosage` | 0..1 | `MedicationStatement.dosage[i].maxDosePerPeriod` | Maxdos per period |
| `dosage[i].conditionalDosage` | 0..1 | `MedicationStatement.dosage[i].additionalInstruction.text` | Villkorsdosering (fritext, t.ex. "vid behov") |
| `dosage[i].lengthOfTreatment` | 0..1 | `MedicationStatement.dosage[i].extension[lengthOfTreatment]` | Behandlingslängd |
| `dosage[i].setDosage` | 0..1 | `MedicationStatement.dosage[i].extension[setDosage]` | Komplex strukturerad dosering; se [MED-001](#öppna-frågor) |

---

## Mappningstabell – additionalPatientInformation (om present)

| RIVTA-element | Kard. | FHIR-element | Kommentar |
|---|---|---|---|
| `medicationMedicalRecordBody.additionalPatientInformation.dateOfBirth` | 1..1 | `MedicationStatement.subject.birthDate` | Kräver inline Patient-resurs eller extension |
| `medicationMedicalRecordBody.additionalPatientInformation.gender` | 0..1 | `MedicationStatement.subject.gender` | Administrativt kön |

---

## Härledda fält / Designbeslut

### MedicationStatement.status (från prescriptionStatus + typeOfPrescription)

`prescriptionStatus` (Active/Inactive) är primär källa för `MedicationStatement.status`.
`typeOfPrescription` (I/U) ger kompletterande semantik men mappar inte rakt till status-värdena
– se [MED-002](#öppna-frågor). `typeOfPrescription` bevaras alltid i extension.

| prescriptionStatus | typeOfPrescription | MedicationStatement.status | Kommentar |
|---|---|---|---|
| `Active` | `I` (Insättning) | `active` | Ny aktiv ordination |
| `Active` | `U` (Utsättning) | `active` | Utsättningsordination, fortfarande aktiv i systemet |
| `Inactive` | `I` | `stopped` | Insättning som avslutats |
| `Inactive` | `U` | `stopped` | Avslutad utsättningsordination |

### drug XOR-villkor (MED-003)

Fem alternativa delelement under `drug 0..1` är ömsesidigt uteslutande i TKB:n.
En FSH Invariant med FHIRPath implementeras i profilen som workaround.

### selfMedication (DES-008)

`selfMedication 1..1 boolean` har ingen standardiserad FHIR MedicationStatement-representation.
Mappas till custom extension `https://fhir.inera.se/StructureDefinition/self-medication`.

---

## PDL och Sparr

PDL-styrning utgår från `accountableHealthcareProfessional`-blocket i headern.
**OBS:** Fältnamnen avviker från övriga TK:er med lowercase 'c' i 'care':

| PDL-begrepp | RIVTA-källa | Hantering |
|---|---|---|
| Yttre Sparr (vårdgivare) | `medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalcareGiverHSAId` | `Provenance.agent[custodian].who.identifier` |
| Inre Sparr (vårdenhet) | `medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalcareUnitHSAId` | `Provenance.agent[author].who.identifier` |
| Patientgodkännande | `medicationMedicalRecordHeader.approvedForPatient` (boolean) | Inget standardiserat FHIR-fält; se [PDL-001](#öppna-frågor) |

---

## Provenance

| Agent | Roll | Källa |
|---|---|---|
| `agent[custodian]` | Juridiskt ansvarig vårdgivare | `medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalcareGiverHSAId` |
| `agent[author]` | Informationsägande vårdenhet | `medicationMedicalRecordHeader.accountableHealthcareProfessional.healthcareProfessionalcareUnitHSAId` |
| `agent[assembler]` | EHDS-bryggan | `EHDS_BRIDGE_HSA_ID` (env-variabel) |

`Provenance.target` refererar `MedicationStatement` via `urn:uuid:{resurs.id}`.  
`Provenance.recorded` = `medicationMedicalRecordHeader.accountableHealthcareProfessional.authorTime` (ISO 8601).

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
| MED-001 | **`dispensationAuthorization`, `administration`, `relation` delvis extraherade.** Dessa element i TKB:n är markerade "SAKNAS I KÄLLDOKUMENT – endast delvis extraherat – kontrollera manuellt". Behöver verifieras mot XSD för `DispensationAuthorizationType`, `AdministrationType`, `RelationType`. `setDosage` (komplex strukturerad dosering) ingår också. Mappning läggs till när elementen är verifierade. |
| MED-002 | **`typeOfPrescription` (I/U) mappar inte naturligt till `MedicationStatement.status`.** I=Insättning och U=Utsättning anger ordinationshändelsens karaktär, inte dess aktuella status. Nuvarande beslut: bevara i extension; status härleds primärt från `prescriptionStatus`. Alternativ: ignorera `prescriptionStatus` och sätt `status=active` för I, `status=stopped` för U. |
| MED-003 | **`drug` XOR-villkor kan inte uttryckas i FSH-kardinalitet.** Fem varianter (unstructured/merchandise/drugArticle/drug/generics) är ömsesidigt uteslutande enligt TKB. FSH Invariant med FHIRPath implementeras som workaround. |
| PDL-001 | **`approvedForPatient` (boolean) saknar FHIR-motsvarighet.** Inget standardiserat `meta.security`-kodsystem. Behöver gemensamt beslut; se central issue i [mapping-issues](mapping-issues.html). |
| GENERAL-001 | **Tidsstämpelformat.** RIVTA använder `YYYYMMDDhhmmss` utan tidszon; FHIR kräver ISO 8601 med tidszon. Konvertering ska anta `Europe/Stockholm` (CET/CEST). Gäller alla tidsfält. |
