Profile: IneraEHDSImmunization
Parent: $Immunization-uv-ips
Id: inera-ehds-immunization
Title: "SE EHDS Immunization – Vaccinationer (GetVaccinationHistory)"
Description: "Profil för vaccinationer mappat från RIVTA-tjänstekontraktet GetVaccinationHistory (clinicalprocess:activityprescription:actoutcome v2.0). Täcker NPÖ 2.0 och 1177 Journal 1.0, 2.0."

// ─── Header-extensions ───────────────────────────────────────────────────────
* extension contains ImmunizationLegalAuthenticator named legalAuthenticator 0..1 MS
* extension contains ImmunizationPatientPostalCode named patientPostalCode 0..1 MS

// ─── registrationRecord.sourceSystem* → Device-referens ─────────────────────
* extension contains ImmunizationRegistrationDevice named registrationDevice 0..1 MS

// ─── administrationRecord-extensions ─────────────────────────────────────────
* extension contains ImmunizationIsDoseComplete named isDoseComplete 0..1 MS

// ─── Header-fält ─────────────────────────────────────────────────────────────

* patient only Reference(IneraEHDSPatient)
* patient MS
* patient ^short = "Patient (vaccinationMedicalRecordHeader.patientId)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (vaccinationMedicalRecordHeader.sourceSystemHSAId)"

* meta.security MS
* meta.security ^short = "PDL-kontroll (vaccinationMedicalRecordHeader.approvedForPatient) – se PDL-001"

* identifier MS
* identifier ^short = "Dokumentidentifierare (vaccinationMedicalRecordHeader.documentId)"

* status 1..1 MS
* status ^short = "Vaccinationsstatus – 'completed' normalt; 'entered-in-error' om nullified=true"

* statusReason MS
* statusReason ^short = "Makuleringsorsak (vaccinationMedicalRecordHeader.nullifiedReason)"

* encounter MS
* encounter ^short = "Kopplad vårdkontakt (vaccinationMedicalRecordHeader.careContactId)"

// ─── registrationRecord-fält ──────────────────────────────────────────────────

* recorded MS
* recorded ^short = "Registreringsdatum (vaccinationMedicalRecordBody.registrationRecord.date)"

* note MS
* note ^short = "Ostrukturerad anteckning (registrationRecord.vaccinationUnstructuredNote) / kommentar"

// riskCategory → programEligibility (standardelement för vaccinationsprogramsbehörighet/riskgrupper)
* programEligibility MS
* programEligibility ^short = "Riskgrupp/programbehörighet (registrationRecord.riskCategory)"

// ─── administrationRecord-fält ────────────────────────────────────────────────

* occurrenceDateTime MS
* occurrenceDateTime ^short = "Vaccinationstidpunkt: vaccinationMedicalRecordHeader.documentTime (primär) eller authorTime (fallback)"

// primarySource=false + reportOrigin.text = sourceDescription (källa för efterregistrering)
* primarySource MS
* primarySource ^short = "false om vaccinationen efterregistrerats (sourceDescription är satt)"
* reportOrigin MS
* reportOrigin ^short = "Källa för efterregistrerad vaccination (administrationRecord.sourceDescription) – fritext i reportOrigin.text; originaltext för eventuell kod"

// Performer-slicing: AP (administrerande) och OP (förskrivande/prescriber)
* performer ^slicing.discriminator[0].type = #pattern
* performer ^slicing.discriminator[0].path = "function"
* performer ^slicing.rules = #open
* performer contains
    administering 0..* MS and
    ordering 0..1 MS

* performer[administering].function = http://terminology.hl7.org/CodeSystem/v2-0443#AP
* performer[administering].function MS
* performer[administering].actor only Reference(PractitionerRole or IneraEHDSOrganization)
* performer[administering].actor MS
* performer[administering].actor ^short = "Administrerande yrkesutövare/enhet (administrationRecord.performer / performerOrg; registrationRecord.careGiverOrg)"

* performer[ordering].function = http://terminology.hl7.org/CodeSystem/v2-0443#OP
* performer[ordering].function MS
* performer[ordering].actor only Reference(PractitionerRole or IneraEHDSOrganization)
* performer[ordering].actor MS
* performer[ordering].actor ^short = "Förskrivande yrkesutövare/enhet (administrationRecord.prescriberPerson / prescriberOrg)"

* vaccineCode 1..1 MS
* vaccineCode ^short = "Vaccin (administrationRecord.typeOfVaccine / administrationRecord.vaccineName)"

* lotNumber MS
* lotNumber ^short = "Batchnummer (administrationRecord.vaccineBatchId)"

* site MS
* site ^short = "Injektionsställe (administrationRecord.anatomicalSite)"

* route MS
* route ^short = "Administreringssätt (administrationRecord.route)"

* doseQuantity MS
* doseQuantity ^short = "Dos (administrationRecord.dose.quantity)"

* protocolApplied MS
* protocolApplied ^short = "Vaccinationsprotokoll (administrationRecord)"
* protocolApplied.doseNumberPositiveInt MS
* protocolApplied.doseNumberPositiveInt ^short = "Dosnummer (administrationRecord.doseOrdinalNumber)"
* protocolApplied.seriesDosesPositiveInt MS
* protocolApplied.seriesDosesPositiveInt ^short = "Antal ordinerade doser (administrationRecord.numberOfPrescribedDoses)"
* protocolApplied.targetDisease MS
* protocolApplied.targetDisease ^short = "Målsjukdom (administrationRecord.vaccineTargetDisease)"
* protocolApplied.series MS
* protocolApplied.series ^short = "Vaccinationsprogram (administrationRecord.vaccinationProgramName)"

* reaction MS
* reaction ^short = "Biverkning (registrationRecord.patientAdverseEffect / administrationRecord.patientAdverseEffect)"

// ─── Extension-definitioner ───────────────────────────────────────────────────

Extension: ImmunizationLegalAuthenticator
Id: immunization-legal-authenticator
Title: "Juridisk äkthetsintygsgivare för vaccination"
Description: "Signeringstidpunkt och HSA-id för juridisk äkthetsintygsgivare (vaccinationMedicalRecordHeader.legalAuthenticator)."
* extension contains
    signatureTime 1..1 and
    hsaId 0..1
* extension[signatureTime].value[x] only dateTime
* extension[signatureTime] ^short = "Signeringstidpunkt (legalAuthenticator.signatureTime)"
* extension[hsaId].value[x] only string
* extension[hsaId] ^short = "Signerarens HSA-id (legalAuthenticator.legalAuthenticatorHSAId)"

Extension: ImmunizationPatientPostalCode
Id: immunization-patient-postal-code
Title: "Patientens postnummer vid vaccination"
Description: "Patientens postnummer vid vaccinationstillfället (registrationRecord.patientPostalCode)."
* value[x] only string

Extension: ImmunizationRegistrationDevice
Id: immunization-registration-device
Title: "Källsystem för vaccinationsregistrering"
Description: """
  Referens till den Device-resurs som beskriver källsystemet varifrån
  vaccinationsregistreringen härstammar
  (registrationRecord.sourceSystemName/productName/productVersion/sourceSystemContact).
"""
* value[x] only Reference(IneraEHDSDevice)

Extension: ImmunizationIsDoseComplete
Id: immunization-is-dose-complete
Title: "Fullständig dos administrerad"
Description: "Anger om hela den ordinerade dosen administrerades (administrationRecord.isDoseComplete)."
* value[x] only boolean
