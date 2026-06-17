Logical: SEEHDSLMImagingOutcome
Id: se-ehds-lm-imaging-outcome
Title: "LM – Bilddiagnostik (GetImagingOutcome)"
Description: "Logisk modell för bilddiagnostiska undersökningar och utlåtanden hämtad via GetImagingOutcome (clinicalprocess:healthcond:actoutcome v1.0)."

* imagingHeader 1..1 BackboneElement "Header med metadata"
  * patientId 1..1 Identifier "Patientidentifierare"
  * sourceSystemHSAId 1..1 string "Källsystemets HSA-id"
  * documentTime 1..1 dateTime "Registreringstidpunkt"
  * accountableHealthcareProfessional 1..1 Identifier "Tolkande radiolog"
  * careProviderHSAId 1..1 string "Vårdgivarens HSA-id"
  * careUnitHSAId 1..1 string "Vårdenhetens HSA-id"

* imagingExaminationCode 1..1 CodeableConcept "Undersökningskod (RÖNTGEN)"
* imagingTime 1..1 dateTime "Undersökningstidpunkt"
* imagingModality 0..1 CodeableConcept "Modalitet (DICOM-kod)"
* imagingDescription 0..1 string "Undersökningsbeskrivning"
* referralSource 0..1 Identifier "Remitterande läkares HSA-id"
* imagingAssessmentComment 0..1 string "Radiologiskt utlåtande"
* seriesUID 0..* string "DICOM-serie-UID"
