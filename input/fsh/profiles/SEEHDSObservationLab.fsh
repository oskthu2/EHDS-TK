Profile: SEEHDSObservationLab
Parent: $Observation-results-laboratory-uv-ips
Id: se-ehds-observation-lab
Title: "SE EHDS Observation – Laboratoriesvar (GetLaboratoryOrderOutcome)"
Description: "Profil för enskilda laboratorieresultat/analyser mappat från GetLaboratoryOrderOutcome. Används i kombination med SEEHDSDiagnosticReportLab."

* subject only Reference(SEEHDSPatient)
* subject MS
* subject ^short = "Patient (patientId)"

* status 1..1 MS
* status ^short = "Resultatstatus (analysisStatus)"

* code 1..1 MS
* code ^short = "Analyskod (analysisCode – NPU/LOINC)"

* effective[x] MS
* effective[x] ^short = "Analystidpunkt"

* value[x] MS
* value[x] ^short = "Analysresultat (analysisValue)"

* interpretation MS
* interpretation ^short = "Referensintervallbedömning (referenceIntervalOutOfRange)"

* referenceRange MS
* referenceRange ^short = "Referensintervall (referenceInterval)"

* note MS
* note ^short = "Analyskommentar (analysisComment)"
