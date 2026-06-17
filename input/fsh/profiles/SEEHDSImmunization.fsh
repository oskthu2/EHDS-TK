Profile: SEEHDSImmunization
Parent: $Immunization-uv-ips
Id: se-ehds-immunization
Title: "SE EHDS Immunization – Vaccinationer (GetVaccinationHistory)"
Description: "Profil för vaccinationer mappat från RIVTA-tjänstekontraktet GetVaccinationHistory (clinicalprocess:activityprescription:actoutcome v2.0). Täcker NPÖ 2.0 och 1177 Journal 1.0, 2.0."

* patient only Reference(SEEHDSPatient)
* patient MS
* patient ^short = "Patient (patientId från vaccinationHeader)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (sourceSystemHSAId från vaccinationHeader)"

* performer MS
* performer.actor only Reference($SEBasePractitionerRole or $SEBaseOrganization)
* performer.actor MS
* performer.actor ^short = "Administrerande personal/enhet (accountableHealthcareProfessional / careUnit)"

* recorded MS
* recorded ^short = "Registreringsdatum (documentTime från vaccinationHeader)"

* status 1..1 MS
* status ^short = "Vaccinationsstatus"

* vaccineCode 1..1 MS
* vaccineCode ^short = "Vaccin (vaccineCode)"

* occurrenceDateTime MS
* occurrenceDateTime ^short = "Vaccinations datum/tid (vaccinationTime)"

* lotNumber MS
* lotNumber ^short = "Batchnummer (batchNumber)"

* site MS
* site ^short = "Injektionsställe (administrationSite)"

* route MS
* route ^short = "Administreringssätt (administrationRoute)"

* doseQuantity MS
* doseQuantity ^short = "Dos (dose)"

* protocolApplied MS
* protocolApplied ^short = "Dosnummer i vaccinationsschema (doseNumber)"

* note MS
* note ^short = "Kommentar (vaccinationComment)"
