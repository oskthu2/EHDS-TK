Profile: IneraEHDSImagingStudy
Parent: $ImagingStudy-uv-ips
Id: inera-ehds-imaging-study
Title: "SE EHDS ImagingStudy – Bilddiagnostik (GetImagingOutcome)"
Description: "Profil för bilddiagnostiska undersökningar mappat från RIVTA-tjänstekontraktet GetImagingOutcome (clinicalprocess:healthcond:actoutcome v1.0). Täcker NPÖ 1.0 och 1177 Journal 1.0."

* subject only Reference(IneraEHDSPatient)
* subject MS
* subject ^short = "Patient (imagingOutcomeHeader.patientId)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (imagingOutcomeHeader.sourceSystemHSAId)"

* status 1..1 MS
* status ^short = "Undersökningsstatus – härledd (inget direkt statusfält i TKBn)"

* started MS
* started ^short = "Undersökningstidpunkt (imagingOutcomeBody.imageRecording.examinationTimePeriod.start)"

* modality MS
* modality ^short = "Modalitet (imagingOutcomeBody.imageRecording.modalityData.typeOfModality)"

* referrer only Reference(PractitionerRole)
* referrer MS
* referrer ^short = "Remitterande läkare (imagingOutcomeBody.referral.accountableHealthcareProfessional)"

* interpreter only Reference(PractitionerRole)
* interpreter MS
* interpreter ^short = "Tolkande radiolog (imagingOutcomeHeader.accountableHealthcareProfessional)"

* series MS
* series.uid MS
* series.uid ^short = "DICOM Series Instance UID (härledd/genererad; dicomSOP är SOP Instance UID på instansnivå)"
* series.modality MS
* series.modality ^short = "Serieens modalitet (imagingOutcomeBody.imageRecording.modalityData.typeOfModality)"
* series.instance MS
* series.instance.uid MS
* series.instance.uid ^short = "Instans-UID (imagingOutcomeBody.imageRecording.imageDicomData.dicomSOP)"
