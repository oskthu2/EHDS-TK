Profile: SEEHDSImagingStudy
Parent: $ImagingStudy-uv-ips
Id: se-ehds-imaging-study
Title: "SE EHDS ImagingStudy – Bilddiagnostik (GetImagingOutcome)"
Description: "Profil för bilddiagnostiska undersökningar mappat från RIVTA-tjänstekontraktet GetImagingOutcome (clinicalprocess:healthcond:actoutcome v1.0). Täcker NPÖ 1.0 och 1177 Journal 1.0."

* subject only Reference(SEEHDSPatient)
* subject MS
* subject ^short = "Patient (patientId från imagingHeader)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (sourceSystemHSAId)"

* status 1..1 MS
* status ^short = "Undersökningsstatus"

* started MS
* started ^short = "Undersökningstidpunkt (imagingTime)"

* modality MS
* modality ^short = "Modalitet (imagingModality – DICOM)"

* referrer only Reference($SEBasePractitionerRole)
* referrer MS
* referrer ^short = "Remitterande läkare (referralSource)"

* interpreter only Reference($SEBasePractitionerRole)
* interpreter MS
* interpreter ^short = "Tolkande radiolog (accountableHealthcareProfessional)"

* description MS
* description ^short = "Undersökningsbeskrivning (imagingDescription)"

* series MS
* series.uid MS
* series.uid ^short = "Serie-UID (seriesUID)"
* series.modality MS
* series.modality ^short = "Serieens modalitet"
* series.instance MS
* series.instance.uid MS
* series.instance.uid ^short = "Instans-UID"
