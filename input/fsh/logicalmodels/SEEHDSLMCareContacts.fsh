Logical: SEEHDSLMCareContacts
Id: se-ehds-lm-care-contacts
Title: "LM – Vårdkontakter (GetCareContacts)"
Description: "Logisk modell för vårdkontakter hämtad via GetCareContacts (clinicalprocess:logistics:logistics v2.0, 3.0)."

* careContactHeader 1..1 BackboneElement "Header med metadata"
  * patientId 1..1 Identifier "Patientidentifierare"
  * sourceSystemHSAId 1..1 string "Källsystemets HSA-id"
  * documentTime 1..1 dateTime "Registreringstidpunkt"
  * accountableHealthcareProfessional 1..1 Identifier "Ansvarig personal"
  * careProviderHSAId 1..1 string "Vårdgivarens HSA-id"
  * careUnitHSAId 1..1 string "Vårdenhetens HSA-id"

* careContactStatus 1..1 CodeableConcept "Kontaktstatus (Registrerad/Avbokad/Utförd)"
* careContactType 1..1 CodeableConcept "Kontakttyp (kv_kontakttyp: Öppenvård/Slutenvård/Hemsjukvård)"
* careContactRegistrationTime 1..1 dateTime "Kontaktstart"
* careContactEndTime 0..1 dateTime "Kontaktslut"
* careContactReason 0..1 CodeableConcept "Kontaktorsak/syfte"
* careContactSpecialty 0..1 CodeableConcept "Specialitet/verksamhetstyp"
* careContactId 0..1 Identifier "Kontaktidentifierare"
