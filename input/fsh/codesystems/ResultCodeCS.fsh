// Genererad från TKB clinicalprocess:activityprescription:actoutcome v2.2.1
// Kodsystem: ResultCodeEnum (gemensam för hela domänen)
// Källa: clinicalprocess_activityprescription_actoutcome_enum_2.0.xsd
// Genererad: 2026-03-19

CodeSystem: ResultCodeCS
Id: resultcode-cs
Title: "ResultCode"
Description: "Kodverk för resultatkod i svar från tjänstekontrakten i domänen clinicalprocess:activityprescription:actoutcome."
* ^url = "https://fhir.inera.se/CodeSystem/resultcode-actoutcome"
* ^status = #active
* ^content = #complete
* #OK "OK" "Begäran genomfördes utan fel"
* #INFO "Info" "Begäran genomfördes men med informationsmeddelande"
* #ERROR "Fel" "Begäran misslyckades med logiskt fel"
