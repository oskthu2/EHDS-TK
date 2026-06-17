Logical: SEEHDSLMCareDocumentation
Id: se-ehds-lm-care-documentation
Title: "LM – Anteckningar (GetCareDocumentation)"
Description: "Logisk modell för vårdanteckningar hämtad via GetCareDocumentation (clinicalprocess:healthcond:description v2.1, 3.0)."

* careDocumentationHeader 1..1 BackboneElement "Header med metadata"
  * patientId 1..1 Identifier "Patientidentifierare"
  * sourceSystemHSAId 1..1 string "Källsystemets HSA-id"
  * documentTime 1..1 dateTime "Registreringstidpunkt"
  * accountableHealthcareProfessional 1..1 Identifier "Anteckningsförfattare"
  * legalAuthenticator 0..1 Identifier "Rättslig äkthetsintygsgivare"
  * careProviderHSAId 1..1 string "Vårdgivarens HSA-id"
  * careUnitHSAId 1..1 string "Vårdenhetens HSA-id"

* careDocumentationType 1..1 CodeableConcept "Anteckningstyp (kv_vårdanteckningstyp)"
* careDocumentationTitle 0..1 string "Anteckningstitel"
* careDocumentationBody 1..1 string "Anteckningstext"
* careDocumentationTimePeriod 0..1 Period "Giltighetstid"
* careContactId 0..1 Identifier "Koppling till vårdkontakt"
