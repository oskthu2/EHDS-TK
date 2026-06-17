Logical: SEEHDSLMLaboratoryOrderOutcome
Id: se-ehds-lm-laboratory-order-outcome
Title: "LM – Provsvar (GetLaboratoryOrderOutcome)"
Description: "Logisk modell för laboratorieresultat hämtad via GetLaboratoryOrderOutcome (clinicalprocess:healthcond:actoutcome v3.1, 4.1)."

* laboratoryOrderHeader 1..1 BackboneElement "Header med metadata"
  * patientId 1..1 Identifier "Patientidentifierare"
  * sourceSystemHSAId 1..1 string "Källsystemets HSA-id"
  * documentTime 1..1 dateTime "Registreringstidpunkt"
  * accountableHealthcareProfessional 1..1 Identifier "Ansvarig personal"
  * careProviderHSAId 1..1 string "Vårdgivarens HSA-id"
  * careUnitHSAId 1..1 string "Vårdenhetens HSA-id"

* labOrderCode 1..1 CodeableConcept "Beställningskod"
* labOrderStatus 1..1 CodeableConcept "Beställningsstatus"
* registrationTime 1..1 dateTime "Svarstidpunkt"
* specimenCollectionTime 0..1 dateTime "Provtagningstidpunkt"
* specimenType 0..1 CodeableConcept "Provmaterialtyp"
* responsibleLaboratory 1..1 Identifier "Ansvarigt laboratoriums HSA-id"

* laboratoryTestResult 1..* BackboneElement "Enskilda analysresultat"
  * analysisCode 1..1 CodeableConcept "Analyskod (NPU/LOINC)"
  * analysisStatus 1..1 CodeableConcept "Analysstatus"
  * analysisValue 0..1 string "Analysresultat (värde + enhet)"
  * referenceInterval 0..1 string "Referensintervall"
  * referenceIntervalOutOfRange 0..1 boolean "Utanför referensintervall"
  * analysisComment 0..1 string "Analyskommentar"

* assessmentComment 0..1 string "Utlåtande/övergripande bedömning"
