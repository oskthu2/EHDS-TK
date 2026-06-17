// Genererad från TKB clinicalprocess:activityprescription:actoutcome v2.2.1
// Kodsystem: PrescriptionStatusEnum
// Källa: clinicalprocess_activityprescription_actoutcome_enum_2.0.xsd
// Genererad: 2026-03-19

CodeSystem: PrescriptionStatusCS
Id: prescriptionstatus-cs
Title: "PrescriptionStatus"
Description: "Kodverk för ordinationsstatus i GetMedicationHistory. Anger om en ordination är aktiv eller inaktiv."
* ^url = "https://fhir.inera.se/CodeSystem/prescriptionstatus"
* ^status = #active
* ^content = #complete
* #Active "Aktiv" "Aktiv ordination — den sista i sin ordinationskedja. Representerar gällande behandling."
* #Inactive "Inaktiv" "Inaktiv ordination — inte den sista i sin ordinationskedja. Historisk ordination."
