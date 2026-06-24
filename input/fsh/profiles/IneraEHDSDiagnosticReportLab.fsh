Profile: IneraEHDSDiagnosticReportLab
Parent: DiagnosticReport
Id: inera-ehds-diagnostic-report-lab
Title: "SE EHDS DiagnosticReport – Provsvar (GetLaboratoryOrderOutcome)"
Description: "Profil för laboratorieresultat mappat från RIVTA-tjänstekontraktet GetLaboratoryOrderOutcome (clinicalprocess:healthcond:actoutcome v4.2). Täcker NPÖ v4.2 och 1177 Journal v4.2."

* subject only Reference(IneraEHDSPatient)
* subject MS
* subject ^short = "Patient (header.accessControlHeader.patientId – JoL-header)"

* meta.source MS
* meta.source ^short = "Källsystem HSA-id (header.sourceSystemId)"

* performer only Reference(PractitionerRole or Organization)
* performer MS
* performer ^short = "Ansvarig laboratorium/personal (header.author.orgUnit)"

* issued MS
* issued ^short = "Svarstidpunkt (header.record.timestamp)"

* status 1..1 MS
* status ^short = "Svarstatus – härledd (inget statusfält i TKBn)"

* category 1..* MS
* category ^short = "Laboratoriekategori"

* code 1..1 MS
* code ^short = "Beställningskod (laboratoryOrderOutcome.body.type)"

* effectiveDateTime MS
* effectiveDateTime ^short = "Kliniskt relevant tidpunkt (härledd; specimen.timestamp → Specimen.collection.collectedDateTime)"

* result MS
* result only Reference(IneraEHDSObservationLab)
* result ^short = "Enskilda analysresultat (groupOfAnalyses.analysis)"

* conclusion MS
* conclusion ^short = "Beställningsinformation/fritext (laboratoryOrderOutcome.body.text)"

* specimen MS
* specimen ^short = "Provmaterial (groupOfAnalyses.analysis.specimen.material)"
