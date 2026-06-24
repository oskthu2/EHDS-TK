// Genererad från TKB clinicalprocess:healthcond:actoutcome v4.2.2
// Kontrakt: GetLaboratoryOrderOutcome v4.2
// Genererad: 2026-03-19

Logical: IneraEHDSLMLaboratoryOrderOutcome
Id: inera-ehds-lm-laboratory-order-outcome
Title: "GetLaboratoryOrderOutcome"
Description: """
  Logisk modell för tjänstekontraktet GetLaboratoryOrderOutcome
  (RIV-TA urn:riv:clinicalprocess:healthcond:actoutcome:GetLaboratoryOrderOutcome:4).
  Representerar responsens informationsstruktur — multidisciplinära laboratoriesvar
  för en patient.
"""
Characteristics: #can-be-target

// ─── Toppnivå: en lista av laboratoryOrderOutcome ───
* laboratoryOrderOutcome 0..* BackboneElement "Laboratoriesvar (ett per beställning)"
  """
  En labbeställning med tillhörande svar. Kardinalitet: Valfri, lista.
  """

// ── Header ──────────────────────────────────────────
* laboratoryOrderOutcome.header 1..1 BackboneElement "Header med åtkomstkontroll och metadata"

* laboratoryOrderOutcome.header.accessControlHeader 1..1 BackboneElement "Åtkomstkontrollhuvud (PDL)"
* laboratoryOrderOutcome.header.accessControlHeader.accountableCareGiver 1..1 Identifier "Ansvarig vårdgivare (HSA-id)"
  """
  HSA-id för den vårdgivare som är ansvarig för posten. Obligatorisk.
  """
* laboratoryOrderOutcome.header.accessControlHeader.accountableCareUnit 1..1 Identifier "Ansvarig vårdenhet (HSA-id)"
  """
  HSA-id för den vårdenhet som är ansvarig för posten. Obligatorisk.
  """
* laboratoryOrderOutcome.header.accessControlHeader.patientId 0..1 Identifier "Patientens id i svaret"
* laboratoryOrderOutcome.header.accessControlHeader.originalPatientId 0..1 Identifier "Ursprungligt patient-id"
* laboratoryOrderOutcome.header.accessControlHeader.careProcessId 0..1 Identifier "Vårdprocessid (UUID)"
* laboratoryOrderOutcome.header.accessControlHeader.blockComparisonTime 1..1 instant "Tidpunkt för spärrkontroll"
* laboratoryOrderOutcome.header.accessControlHeader.approvedForPatient 1..1 boolean "Godkänd för patientvisning"
  """
  Anger om informationsägaren godkänt att patienten kan ta del av informationen.
  """

* laboratoryOrderOutcome.header.sourceSystemId 1..1 Identifier "Källsystemets HSA-id"
* laboratoryOrderOutcome.header.record 1..1 BackboneElement "Poststatus och tidpunkt"
* laboratoryOrderOutcome.header.record.recordId 1..1 Identifier "Postens unika id"
* laboratoryOrderOutcome.header.record.timestamp 1..1 instant "Tidpunkt för posten"

* laboratoryOrderOutcome.header.author 0..1 BackboneElement "Dokumentationsansvarig"
* laboratoryOrderOutcome.header.author.authorId 0..1 Identifier "Författarens HSA-id"
* laboratoryOrderOutcome.header.author.name 0..1 string "Författarens namn"
* laboratoryOrderOutcome.header.author.timestamp 1..1 instant "Tidpunkt för dokumentation"
* laboratoryOrderOutcome.header.author.byRole 0..1 CodeableConcept "Yrkesroll vid dokumentation"
* laboratoryOrderOutcome.header.author.orgUnit 0..1 BackboneElement "Organisationsenhet"
* laboratoryOrderOutcome.header.author.orgUnit.orgUnitId 0..1 Identifier "OrgUnit HSA-id"
* laboratoryOrderOutcome.header.author.orgUnit.name 1..1 string "OrgUnit namn"

* laboratoryOrderOutcome.header.signature 0..1 BackboneElement "Signatär"
* laboratoryOrderOutcome.header.signature.signatureId 0..1 Identifier "Signatärens HSA-id"
* laboratoryOrderOutcome.header.signature.name 0..1 string "Signatärens namn"
* laboratoryOrderOutcome.header.signature.timestamp 1..1 instant "Signeringstidpunkt"
* laboratoryOrderOutcome.header.signature.byRole 0..1 CodeableConcept "Yrkesroll vid signering"

// ── Body ─────────────────────────────────────────────
* laboratoryOrderOutcome.body 1..1 BackboneElement "Beställnings- och svarsinformation"

* laboratoryOrderOutcome.body.identifier 1..1 Identifier "Beställningens unika id"
* laboratoryOrderOutcome.body.laboratoryIdentifier 0..1 Identifier "Laboratoriets beställningsnummer"
* laboratoryOrderOutcome.body.type 1..1 CodeableConcept "Typ av laboratoriebeställning"
* laboratoryOrderOutcome.body.text 0..1 string "Fritext om beställningen"

* laboratoryOrderOutcome.body.referral 0..1 BackboneElement "Kopplad remiss"
* laboratoryOrderOutcome.body.referral.identifier 1..1 Identifier "Remissens id"
* laboratoryOrderOutcome.body.referral.timestamp 1..1 instant "Remissens tidpunkt"
* laboratoryOrderOutcome.body.referral.version 0..1 integer "Remissversion"
* laboratoryOrderOutcome.body.referral.question 0..1 string "Frågeställning i remissen"
* laboratoryOrderOutcome.body.referral.requestedCareService 0..* CodeableConcept "Begärd vårdtjänst"
* laboratoryOrderOutcome.body.referral.requester 0..1 BackboneElement "Remittent"
* laboratoryOrderOutcome.body.referral.requester.requesterId 0..1 Identifier "Remittentens HSA-id"
* laboratoryOrderOutcome.body.referral.requester.name 0..1 string "Remittentens namn"
* laboratoryOrderOutcome.body.referral.requester.byRole 0..1 CodeableConcept "Remittentens yrkesroll"
* laboratoryOrderOutcome.body.referral.requester.orgUnit 0..1 BackboneElement "Remittentens org-enhet"
* laboratoryOrderOutcome.body.referral.requester.orgUnit.orgUnitId 0..1 Identifier "OrgUnit HSA-id"
* laboratoryOrderOutcome.body.referral.requester.orgUnit.name 1..1 string "OrgUnit namn"
* laboratoryOrderOutcome.body.referral.referralInformation 0..1 BackboneElement "Remissinformation"
* laboratoryOrderOutcome.body.referral.referralInformation.referralComment 0..1 string "Remisskommentar"
* laboratoryOrderOutcome.body.referral.referralInformation.referralMedicalInformation 0..1 string "Medicinsk remissinformation"

* laboratoryOrderOutcome.body.groupOfAnalyses 0..* BackboneElement "Analysgrupp (panel)"
  """
  En grupp av relaterade analyser (t.ex. ett analyspaket). Kardinalitet: Valfri, lista.
  """
* laboratoryOrderOutcome.body.groupOfAnalyses.name 0..1 string "Gruppens namn"
* laboratoryOrderOutcome.body.groupOfAnalyses.comment 0..1 string "Kommentar till gruppen"
* laboratoryOrderOutcome.body.groupOfAnalyses.code 0..1 CodeableConcept "Gruppens kod"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis 1..* BackboneElement "Enskild analys"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.identifier 0..1 Identifier "Analysens id"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.timestamp 0..1 instant "Tidpunkt för analysen"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.code 1..1 CodeableConcept "Analysens kod (t.ex. NPU)"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.method 0..1 CodeableConcept "Analysmetod"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.status 0..1 CodeableConcept "Analysstatus"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.comment 0..1 string "Kommentar till analysen"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.accredited 0..1 boolean "Ackrediterad analys"

* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen 0..* BackboneElement "Prov"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.identifier 0..1 Identifier "Provnummer"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.material 0..1 CodeableConcept "Provmaterial"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.timestamp 1..1 instant "Provtagningstidpunkt"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.anatomicalLocation 0..1 CodeableConcept "Anatomisk plats"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.comment 0..1 string "Kommentar om provet"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.activity 0..* BackboneElement "Provrelaterad aktivitet"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.activity.code 1..1 CodeableConcept "Aktivitetskod"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.activity.time 1..1 Period "Aktivitetens tidsperiod"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.activity.method 0..1 CodeableConcept "Aktivitetsmetod"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.container 0..* BackboneElement "Provbehållare"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.container.identifier 0..* Identifier "Behållarens id"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.specimen.container.type 1..1 CodeableConcept "Behållartyp"

* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.device 0..* BackboneElement "Mätinstrument"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.device.identifier 1..1 Identifier "Instrumentets id"

* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result 0..* BackboneElement "Analysresultat"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.type 0..1 CodeableConcept "Resultattyp"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.value 1..1 string "Resultatvärde (AnyValueType — se anmärkning)"
  """
  ASSUME-001: AnyValueType kan innehålla PQ, string, boolean eller kodad typ.
  Modellerad som string i avvaktan på mappningsverifiering. Se QUESTIONS.md.
  """
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.comment 0..1 string "Kommentar till resultatet"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.interpretation 0..* CodeableConcept "Tolkning av resultatet"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.reference 0..1 BackboneElement "Referensintervall"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.reference.interval 0..1 Quantity "Referensintervall (PQIntervalType)"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.reference.description 0..1 string "Beskrivning av referensintervall"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.reference.population 0..1 string "Population för referensintervall"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.reference.comment 0..1 string "Kommentar till referensintervall"

* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.recipientSignature 0..1 BackboneElement "Mottagarsignatur"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.recipientSignature.signatoryId 0..1 Identifier "Signatärens id"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.recipientSignature.name 0..1 string "Signatärens namn"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.recipientSignature.timestamp 1..1 instant "Signeringstidpunkt"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.recipientSignature.byRole 0..1 CodeableConcept "Yrkesroll"

* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.performerSignature 0..1 BackboneElement "Utförarsignatur"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.performerSignature.signatoryId 0..1 Identifier "Signatärens id"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.performerSignature.name 0..1 string "Signatärens namn"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.performerSignature.timestamp 1..1 instant "Signeringstidpunkt"
* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.performerSignature.byRole 0..1 CodeableConcept "Yrkesroll"

* laboratoryOrderOutcome.body.groupOfAnalyses.analysis.result.related 0..* BackboneElement "Relaterade analyser"

* laboratoryOrderOutcome.body.recipientUnit 1..1 BackboneElement "Mottagande enhet"
* laboratoryOrderOutcome.body.recipientUnit.unitId 0..1 Identifier "Enhetens HSA-id"
* laboratoryOrderOutcome.body.recipientUnit.name 1..1 string "Enhetens namn"

* laboratoryOrderOutcome.body.recipientSignature 0..1 BackboneElement "Beställarens signatur"
* laboratoryOrderOutcome.body.recipientSignature.signatoryId 0..1 Identifier "Signatärens id"
* laboratoryOrderOutcome.body.recipientSignature.name 0..1 string "Signatärens namn"
* laboratoryOrderOutcome.body.recipientSignature.timestamp 1..1 instant "Signeringstidpunkt"
* laboratoryOrderOutcome.body.recipientSignature.byRole 0..1 CodeableConcept "Yrkesroll"

* laboratoryOrderOutcome.body.contactInformation 0..1 BackboneElement "Kontaktinformation"
* laboratoryOrderOutcome.body.contactInformation.text 1..1 string "Kontaktinformationstext"
