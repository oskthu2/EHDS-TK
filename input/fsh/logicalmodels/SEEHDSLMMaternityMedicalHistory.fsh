Logical: SEEHDSLMMaternityMedicalHistory
Id: se-ehds-lm-maternity-medical-history
Title: "LM – Mödravård (GetMaternityMedicalHistory)"
Description: "Logisk modell för medicinsk historik inom mödravård hämtad via GetMaternityMedicalHistory (clinicalprocess:healthcond:actoutcome v2.0)."

* maternityHeader 1..1 BackboneElement "Header med metadata"
  * patientId 1..1 Identifier "Patientidentifierare"
  * sourceSystemHSAId 1..1 string "Källsystemets HSA-id"
  * documentTime 1..1 dateTime "Registreringstidpunkt"
  * accountableHealthcareProfessional 1..1 Identifier "Ansvarig barnmorska/läkare"
  * careProviderHSAId 1..1 string "Vårdgivarens HSA-id"
  * careUnitHSAId 1..1 string "Vårdenhetens HSA-id"

* maternityMedicalHistoryType 1..1 CodeableConcept "Typ av mödravårdsuppgift"
* maternityMedicalHistoryCode 0..1 CodeableConcept "Specifik kod"
* maternityMedicalHistoryTime 0..1 dateTime "Tidpunkt"
* maternityMedicalHistoryResult 0..1 string "Resultat/värde"
* maternityMedicalHistoryComment 0..1 string "Kommentar"
