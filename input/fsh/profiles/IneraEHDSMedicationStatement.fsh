Profile: IneraEHDSMedicationStatement
Parent: $MedicationStatement-uv-ips
Id: inera-ehds-medication-statement
Title: "SE EHDS MedicationStatement – Läkemedel (GetMedicationHistory)"
Description: "Profil för läkemedelsordinationer, förskrivningar och administrerade läkemedel mappat från RIVTA-tjänstekontraktet GetMedicationHistory (clinicalprocess:activityprescription:actoutcome v2.2). Täcker NPÖ 2.2 och 1177 Journal 2.2."

* subject only Reference(IneraEHDSPatient)
* subject MS
* subject ^short = "Patient (medicationMedicalRecordHeader.patientId)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (medicationMedicalRecordHeader.sourceSystemHSAId)"

* informationSource only Reference(PractitionerRole)
* informationSource MS
* informationSource ^short = "Ansvarig hälso- och sjukvårdspersonal (medicationMedicalRecordHeader.accountableHealthcareProfessional)"

* dateAsserted MS
* dateAsserted ^short = "Dokumentationstidpunkt (medicationMedicalRecordHeader.accountableHealthcareProfessional.authorTime)"

* status 1..1 MS
* status ^short = "Ordinationsstatus (medicationMedicalRecordBody.medicationPrescription.prescriptionStatus – Active/Inactive)"

* medication[x] 1..1 MS
* medication[x] ^short = "Läkemedel (medicationMedicalRecordBody.medicationPrescription.drug – XOR: unstructured/merchandise/drugArticle/drug/generics, se MED-003)"

* effectivePeriod MS
* effectivePeriod ^short = "Behandlingsperiod (startOfTreatment / endOfTreatment)"
* effectivePeriod.start MS
* effectivePeriod.start ^short = "Insättningstidpunkt (medicationMedicalRecordBody.medicationPrescription.startOfTreatment)"
* effectivePeriod.end MS
* effectivePeriod.end ^short = "Utsättningstidpunkt (medicationMedicalRecordBody.medicationPrescription.endOfTreatment)"

* reasonCode MS
* reasonCode ^short = "Ordinationsorsak (medicationMedicalRecordBody.medicationPrescription.principalPrescriptionReason.reason)"

* note MS
* note ^short = "Notat om ordination (medicationMedicalRecordBody.medicationPrescription.prescriptionNote)"

* dosage MS
* dosage ^short = "Dosering (medicationMedicalRecordBody.medicationPrescription.dosage)"
* dosage.text MS
* dosage.text ^short = "Doseringsinstruktion i fritext (medicationMedicalRecordBody.medicationPrescription.dosage.dosageInstruction)"
* dosage.timing MS
* dosage.timing ^short = "Doseringsschemat (medicationMedicalRecordBody.medicationPrescription.dosage – fastdosering/villkorsdosering)"
* dosage.route MS
* dosage.route ^short = "Administreringssätt (medicationMedicalRecordBody.medicationPrescription.drug.drug.routeOfAdministration)"
