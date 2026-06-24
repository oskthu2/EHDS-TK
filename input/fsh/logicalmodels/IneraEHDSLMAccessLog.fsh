Logical: IneraEHDSLMAccessLog
Id: inera-ehds-lm-access-log
Title: "GetAccessLogForPatient"
Description: "Logisk modell för patientens åtkomstloggar hämtad via GetAccessLogForPatient (informationsecurity:auditing:log v1.1, 2.0). Krävs för 1177 Journal 1.1, 2.0 men ej för NPÖ."

* accessLogId 1..1 Identifier "Loggpostens identifierare"
* patientId 1..1 Identifier "Patientidentifierare"
* accessTime 1..1 dateTime "Åtkomsttidpunkt (UTC)"
* accessType 1..1 CodeableConcept "Åtkomsttyp (Läsning/Sökning)"
* accessSubType 0..1 CodeableConcept "Åtkomstundertyp"
* accessOutcome 1..1 CodeableConcept "Utfall (Beviljad/Nekad)"
* accessPurpose 0..1 CodeableConcept "Åtkomstsyfte (Vård/Administration)"
* userId 1..1 Identifier "Användarens HSA-id"
* userRole 0..1 CodeableConcept "Användarroll"
* userOrganization 0..1 Identifier "Användarens organisations HSA-id"
* sourceSystemHSAId 1..1 string "Källsystem (loggkälla)"
* accessedResource 0..1 string "Resurs/tjänst som åtkoms"
