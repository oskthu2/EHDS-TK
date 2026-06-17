Logical: SEEHDSLMObservations
Id: se-ehds-lm-observations
Title: "LM – Tillväxtkurva (GetObservations)"
Description: "Logisk modell för tillväxtobservationer för barn och ungdom hämtad via GetObservations (clinicalprocess:healthcond:basic v1.2)."

* observationHeader 1..1 BackboneElement "Header med metadata"
  * patientId 1..1 Identifier "Patientidentifierare"
  * sourceSystemHSAId 1..1 string "Källsystemets HSA-id"
  * documentTime 1..1 dateTime "Registreringstidpunkt"
  * accountableHealthcareProfessional 1..1 Identifier "Ansvarig personal"
  * careProviderHSAId 1..1 string "Vårdgivarens HSA-id"
  * careUnitHSAId 1..1 string "Vårdenhetens HSA-id"

* observationCode 1..1 CodeableConcept "Observationstyp (LOINC: vikt, längd, huvudomfång, BMI)"
* observationTime 1..1 dateTime "Mättidpunkt"
* observationValue 1..1 Quantity "Mätvärde med enhet (kg, cm)"
* observationInterpretation 0..1 CodeableConcept "Bedömning (normalvärde/avvikelse)"
* observationComment 0..1 string "Kommentar"
