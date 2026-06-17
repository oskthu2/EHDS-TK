Logical: SEEHDSLMDiagnosis
Id: se-ehds-lm-diagnosis
Title: "LM – Diagnos (GetDiagnosis)"
Description: "Logisk modell för diagnosinformation hämtad via tjänstekontraktet GetDiagnosis (clinicalprocess:healthcond:description v2.0). Källan är Ineras tjänstekatalog."

* diagnosisHeader 1..1 BackboneElement "Header med metadata för diagnosen"
  * patientId 1..1 Identifier "Patientidentifierare (personnummer/samordningsnummer)"
  * sourceSystemHSAId 1..1 string "Källsystemets HSA-id"
  * documentTime 1..1 dateTime "Registreringstidpunkt (YYYYMMDDHHMMSS, Europe/Stockholm)"
  * accountableHealthcareProfessional 1..1 Identifier "Ansvarig hälso- och sjukvårdspersonals HSA-id"
  * legalAuthenticator 0..1 Identifier "Rättslig äkthetsintygsgivares HSA-id"
  * legalAuthenticatorTime 0..1 date "Datum för äkthetsintygsgivande (YYYYMMDD)"
  * careProviderHSAId 1..1 string "Vårdgivarens HSA-id (yttre Sparr)"
  * careUnitHSAId 1..1 string "Vårdenhetens HSA-id (inre Sparr)"

* diagnosisCode 1..1 CodeableConcept "Diagnoskod (ICD-10-SE)"
* diagnosisCodeSystem 1..1 code "Kodsystem (ICD-10-SE)"
* diagnosisCodeDescription 0..1 string "Diagnoskodsbeskrivning"
* diagnosisType 0..1 CodeableConcept "Diagnostyp (kv_diagnostyp: Huvud/Bi/Kompletterande)"
* diagnosisStatus 1..1 CodeableConcept "Diagnosstatus (Aktuell/Historisk)"
* diagnosisTimePeriod 0..1 Period "Diagnosperiod"
  * start 0..1 date "Debutdatum"
  * end 0..1 date "Slutdatum"
* diagnosisComment 0..1 string "Kommentar"
