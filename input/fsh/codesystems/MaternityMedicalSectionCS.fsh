// Lokal diskriminatorkod för de tre sektionerna i GetMaternityMedicalHistory.
// Används som Observation.code för att skilja registrationRecord, pregnancyCheckupRecord
// och postDeliveryRecord åt när dessa mappas till separata Observation-resurser (MAT-001).

CodeSystem: MaternityMedicalSectionCS
Id: maternity-section
Title: "MaternityMedicalSection"
Description: "Diskriminatorkoder för de tre sektionerna i mödravårdsjournalen (GetMaternityMedicalHistory v2.0). Varje Observation-resurs som skapas ur ett maternityMedicalRecord sätter Observation.code till en av dessa koder."
* ^url = "https://fhir.inera.se/ig/ehds-tk/CodeSystem/maternity-section"
* ^status = #active
* ^content = #complete
* ^caseSensitive = true
* #registration "Inskrivning mödravård" "Inskrivningsuppgifter (maternityMedicalRecordBody.registrationRecord)"
* #checkup "Graviditetskontroll" "Graviditetskontrolldata (maternityMedicalRecordBody.pregnancyCheckupRecord)"
* #post-delivery "Eftervård" "Eftervårdsdata (maternityMedicalRecordBody.postDeliveryRecord)"
