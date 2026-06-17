Logical: SEEHDSLMFunctionalStatus
Id: se-ehds-lm-functional-status
Title: "LM – Funktionstillstånd och ADL (GetFunctionalStatus)"
Description: "Logisk modell för funktionstillstånd och ADL-bedömningar hämtad via GetFunctionalStatus (clinicalprocess:healthcond:description v2.0)."

* functionalStatusHeader 1..1 BackboneElement "Header med metadata"
  * patientId 1..1 Identifier "Patientidentifierare"
  * sourceSystemHSAId 1..1 string "Källsystemets HSA-id"
  * documentTime 1..1 dateTime "Registreringstidpunkt"
  * accountableHealthcareProfessional 1..1 Identifier "Ansvarig personal"
  * legalAuthenticator 0..1 Identifier "Rättslig äkthetsintygsgivare"
  * careProviderHSAId 1..1 string "Vårdgivarens HSA-id"
  * careUnitHSAId 1..1 string "Vårdenhetens HSA-id"

* functionalStatusTypeCode 1..1 CodeableConcept "Funktionstillståndstyp (ICF-kod)"
* functionalStatusType 0..1 CodeableConcept "Klassificering av funktionstillstånd"
* functionalStatusStatus 1..1 CodeableConcept "Status (Aktuell/Historisk)"
* functionalStatusSeverity 0..1 CodeableConcept "Svårighetsgrad"
* functionalStatusTimePeriod 0..1 Period "Giltighetstid"
  * start 0..1 date "Startdatum"
  * end 0..1 date "Slutdatum"
* functionalStatusComment 0..1 string "Bedömning och kommentar i fritext"
