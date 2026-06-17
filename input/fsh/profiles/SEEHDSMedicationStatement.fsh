Profile: SEEHDSMedicationStatement
Parent: $MedicationStatement-uv-ips
Id: se-ehds-medication-statement
Title: "SE EHDS MedicationStatement – Läkemedel (GetMedicationHistory)"
Description: "Profil för läkemedelsordinationer, förskrivningar och administrerade läkemedel mappat från RIVTA-tjänstekontraktet GetMedicationHistory (clinicalprocess:activityprescription:actoutcome v2.2). Täcker NPÖ 2.2 och 1177 Journal 2.2."

* subject only Reference(SEEHDSPatient)
* subject MS
* subject ^short = "Patient (patientId från medicationHeader)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (sourceSystemHSAId från medicationHeader)"

* informationSource only Reference($SEBasePractitionerRole)
* informationSource MS
* informationSource ^short = "Ansvarig hälso- och sjukvårdspersonal (accountableHealthcareProfessional)"

* dateAsserted MS
* dateAsserted ^short = "Registreringsdatum (documentTime från medicationHeader)"

* status 1..1 MS
* status ^short = "Läkemedelsstatus (treatmentStatus)"

* medication[x] 1..1 MS
* medication[x] ^short = "Läkemedel (drug)"

* dosage MS
* dosage ^short = "Dosering (dosage)"
* dosage.text MS
* dosage.text ^short = "Doseringsinstruktion i fritext (dosageInstruction)"
* dosage.timing MS
* dosage.timing ^short = "Doseringsschemat (administrationSchedule)"
* dosage.route MS
* dosage.route ^short = "Administreringssätt (administrationRoute)"

* effectivePeriod MS
* effectivePeriod ^short = "Behandlingsperiod (treatmentPeriod)"

* reasonCode MS
* reasonCode ^short = "Indikation (indication)"

* note MS
* note ^short = "Kommentar (treatmentComment)"
