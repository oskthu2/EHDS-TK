Logical: SEEHDSLMVaccinationHistory
Id: se-ehds-lm-vaccination-history
Title: "LM – Vaccinationer (GetVaccinationHistory)"
Description: "Logisk modell för vaccinationsuppgifter hämtad via GetVaccinationHistory (clinicalprocess:activityprescription:actoutcome v2.0)."

* vaccinationHeader 1..1 BackboneElement "Header med metadata"
  * patientId 1..1 Identifier "Patientidentifierare"
  * sourceSystemHSAId 1..1 string "Källsystemets HSA-id"
  * documentTime 1..1 dateTime "Registreringstidpunkt"
  * accountableHealthcareProfessional 1..1 Identifier "Ansvarig personal"
  * careProviderHSAId 1..1 string "Vårdgivarens HSA-id"
  * careUnitHSAId 1..1 string "Vårdenhetens HSA-id"

* vaccineCode 1..1 CodeableConcept "Vaccinationskod (ATC)"
* vaccineName 0..1 string "Vaccinsnamn"
* vaccinationTime 1..1 dateTime "Vaccinations datum/tid"
* batchNumber 0..1 string "Batchnummer"
* administrationSite 0..1 CodeableConcept "Injektionsställe"
* administrationRoute 0..1 CodeableConcept "Administreringssätt"
* dose 0..1 Quantity "Dos"
* doseNumber 0..1 positiveInt "Dosnummer i vaccinationsschema"
* diseaseTarget 0..* CodeableConcept "Sjukdom vaccinet skyddar mot"
* vaccinationComment 0..1 string "Kommentar"
