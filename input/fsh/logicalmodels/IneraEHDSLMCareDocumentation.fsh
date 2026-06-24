// Genererad från TKB clinicalprocess:healthcond:description v3.0.5
// Kontrakt: GetCareDocumentation v3.0
// Namespace: urn:riv:clinicalprocess:healthcond:description:GetCareDocumentationResponder:3
// Genererad: 2026-03-19

Invariant: getcaredocumentation-body-xor
Description: "Antingen clinicalDocumentNoteText eller multimediaEntry ska anges, ej båda"
Expression: "clinicalDocumentNoteText.exists() xor multimediaEntry.exists()"
Severity: #error

Invariant: getcaredocumentation-multimedia-xor
Description: "Antingen value eller reference ska anges i multimediaEntry, ej båda"
Expression: "value.exists() xor reference.exists()"
Severity: #error

Logical: IneraEHDSLMCareDocumentation
Id: inera-ehds-lm-care-documentation
Title: "GetCareDocumentation"
Description: """
  Logisk modell för tjänstekontraktet GetCareDocumentation
  (RIV-TA urn:riv:clinicalprocess:healthcond:description:GetCareDocumentationResponder:3).
  Representerar responsens informationsstruktur: journalanteckningar för en patient.
  Anteckningstyper: utredning, åtgärd/behandling, sammanfattning, samordning, inskrivning,
  slutanteckning, anteckning utan fysiskt möte, slutenvårdsanteckning och besöksanteckning.
  Meddelandeformatet är kompatibelt med HL7 v3 CDA v2.
"""
Characteristics: #can-be-target

* careDocumentation 0..* BackboneElement "Journalanteckning" """
    De anteckningar som matchar begäran. En instans per anteckning.
    Kardinalitet: Valfri, lista.
  """

* careDocumentation.header 1..1 BackboneElement "JoL-header" """
    JoL-header v2.2. Innehåller metainformation gemensam för JoL-tjänstekontrakt.
    Kardinalitet: Obligatorisk.
  """

* careDocumentation.header.accessControlHeader 1..1 BackboneElement "Åtkomstkontrollheader" """
    Information för kontroll av åtkomst enligt PDL. Uppgifterna krävs för
    spärrhantering, åtkomstkontroll samt loggning.
    Kardinalitet: Obligatorisk.
  """

* careDocumentation.header.accessControlHeader.accountableHealthcareProvider 0..1 Identifier "Informationsägande vårdgivare" """
    Id för informationsägande vårdgivare. HSA-id eller lokalt id.
    Kardinalitet: Valfri.
  """

* careDocumentation.header.accessControlHeader.accountableCareUnit 0..1 Identifier "Informationsägande vårdenhet" """
    Id för informationsägande vårdenhet angivet med HSA-id.
    Kardinalitet: Valfri.
  """

* careDocumentation.header.accessControlHeader.patientId 1..1 Identifier "Patientens identitetsbeteckning" """
    Patientens identitetsbeteckning. Personnummer, samordningsnummer eller nationellt reservnummer.
    Kardinalitet: Obligatorisk.
  """

* careDocumentation.header.accessControlHeader.careProcessId 0..1 Identifier "Id för individanpassad vårdprocess" """
    Id för den individanpassade vårdprocess som informationen ingår i.
    Kardinalitet: Valfri.
  """

* careDocumentation.header.accessControlHeader.blockComparisonTime 1..1 dateTime "Jämförelsetidpunkt för spärrkontroll" """
    Den tidpunkt mot vilken spärrkontroll sker vid åtkomst till journalinformation.
    Format: YYYYMMDDhhmmss. Kardinalitet: Obligatorisk.
  """

* careDocumentation.header.accessControlHeader.approvedForPatient 1..1 boolean "Godkänd för visning till patient" """
    Ansvarig vårdpersonals beslut, alternativt baserat på automatisk menprövning,
    om informationen är godkänd för visning till patient.
    Kardinalitet: Obligatorisk.
  """

* careDocumentation.header.sourceSystemId 1..1 Identifier "Källsystem" """
    Det källsystem som informationen lagras i. Fältet root sätts till HSA-id för källsystemet.
    Kardinalitet: Obligatorisk.
  """

* careDocumentation.header.record 1..1 BackboneElement "Uppgift i patientjournal" """
    Metainformation avseende journaluppgiften (recorden).
    Kardinalitet: Obligatorisk.
  """

* careDocumentation.header.record.recordId 1..1 Identifier "Journaluppgiftens unika identifierare" """
    Unik och beständig identifierare för uppgift i patientjournal.
    Ska vara unik — samma id får inte förekomma flera gånger (XSD-regel).
    Kardinalitet: Obligatorisk.
  """

* careDocumentation.header.record.timestamp 1..1 dateTime "Skapandetidpunkt" """
    Första tidpunkten då denna journalinformation skapades.
    Format: YYYYMMDDhhmmss. Kardinalitet: Obligatorisk.
  """

* careDocumentation.header.author 0..1 BackboneElement "Dokumentationsansvarig" """
    Hälso- och sjukvårdspersonal som ansvarar för informationen i journaluppgiften.
    Kardinalitet: Valfri.
  """

* careDocumentation.header.author.authorId 0..1 Identifier "HSA-id för dokumentationsansvarig" """
    HSA-id för hälso- och sjukvårdspersonal. Fältet root sätts till OID för HSA-id.
    Kardinalitet: Valfri.
  """

* careDocumentation.header.author.name 0..1 string "Namn på dokumentationsansvarig" """
    Namn på hälso- och sjukvårdspersonal.
    Kardinalitet: Valfri.
  """

* careDocumentation.header.author.timestamp 1..1 dateTime "Tidpunkt för informationsskapande" """
    Tidpunkt vid vilken journalinformationen skapades av författaren.
    Format: YYYYMMDDhhmmss. Kardinalitet: Obligatorisk.
  """

* careDocumentation.header.author.byRole 0..1 CodeableConcept "Befattning" """
    Information om hälso- och sjukvårdspersonalens befattning vid tidpunkten för dokumentationen.
    Kardinalitet: Valfri.
  """

* careDocumentation.header.author.orgUnit 0..1 BackboneElement "Organisationsenhet" """
    Den organisation som författaren är uppdragstagare i vid dokumentationstillfället.
    Kardinalitet: Valfri.
  """

* careDocumentation.header.author.orgUnit.orgUnitHSAId 0..1 Identifier "HSA-id för organisationsenhet" """
    HSA-id för organisationsenhet.
    Kardinalitet: Valfri (OrgUnitType-konvention).
  """

* careDocumentation.header.author.orgUnit.orgUnitName 0..1 string "Namn på organisationsenhet" """
    Namn på den organisation som författaren är uppdragstagare i.
    Kardinalitet: Valfri.
  """

* careDocumentation.header.signature 0..1 BackboneElement "Signeringsinformation" """
    Signeringsinformation för journaluppgiften.
    Kardinalitet: Valfri.
  """

* careDocumentation.header.signature.signatureId 0..1 Identifier "HSA-id för signerande person" """
    HSA-id för hälso- och sjukvårdspersonal som signerat journaluppgiften.
    Kardinalitet: Valfri.
  """

* careDocumentation.header.signature.name 0..1 string "Namn på signerande person" """
    Namn på hälso- och sjukvårdspersonal som signerat journaluppgiften.
    Kardinalitet: Valfri.
  """

* careDocumentation.header.signature.timestamp 0..1 dateTime "Tidpunkt för signering" """
    Anger tidpunkten för signering av uppgift i patientjournal.
    Format: YYYYMMDDhhmmss. Kardinalitet: Valfri.
  """

* careDocumentation.header.signature.byRole 0..1 CodeableConcept "Befattning vid signering" """
    Information om signerande persons befattning.
    Kardinalitet: Valfri.
  """

* careDocumentation.body 1..1 BackboneElement "Journalanteckningens innehåll" """
    Journalanteckning — informationsinnehållet i anteckningen.
    Kardinalitet: Obligatorisk.
  """
* careDocumentation.body obeys getcaredocumentation-body-xor

* careDocumentation.body.clinicalDocumentNoteCode 1..1 CodeableConcept "Typ av anteckning" """
    Typ av anteckning. Kod tas från KV Anteckningstyp (OID: 1.2.752.129.2.2.2.11).
    Kardinalitet: Obligatorisk.
  """
* careDocumentation.body.clinicalDocumentNoteCode from ClinicalDocumentNoteCodeVS (required)

* careDocumentation.body.clinicalDocumentNoteTitle 0..1 string "Rubrik på anteckningen" """
    Titel på anteckningen.
    Kardinalitet: Valfri.
  """

* careDocumentation.body.clinicalDocumentNoteText 0..1 string "Anteckningens textinnehåll" """
    Journalanteckningens innehåll i text. Texten kan vara formaterad i DocBook-format
    och ska då vara 'entity encoded'. Ömsesidigt uteslutande med multimediaEntry.
    Kardinalitet: Valfri. XSD-regel: exakt ett av clinicalDocumentNoteText/multimediaEntry ska anges.
  """

* careDocumentation.body.multimediaEntry 0..1 BackboneElement "Binär bilaga" """
    Journalanteckningens innehåll i form av en multimediafil.
    Ömsesidigt uteslutande med clinicalDocumentNoteText.
    Kardinalitet: Valfri. XSD-regel: exakt ett av clinicalDocumentNoteText/multimediaEntry ska anges.
  """
* careDocumentation.body.multimediaEntry obeys getcaredocumentation-multimedia-xor

* careDocumentation.body.multimediaEntry.mediaType 1..1 string "Medietyp" """
    Typ av multimedia (MIME-typ). Tillåtna värden enligt MediaTypeEnum.
    Kardinalitet: Obligatorisk.
  """

* careDocumentation.body.multimediaEntry.value 0..1 base64Binary "Binärdata" """
    Binärdata som representerar objektet. Ömsesidigt uteslutande med reference.
    Kardinalitet: Valfri.
  """

* careDocumentation.body.multimediaEntry.reference 0..1 url "Referens till extern fil" """
    Referens till extern binär fil i form av en URL. Ömsesidigt uteslutande med value.
    Kardinalitet: Valfri.
  """

* careDocumentation.body.dissentingOpinion 0..* BackboneElement "Avvikande mening" """
    Om patienten eller någon för denna ansvarig person är av avvikande mening om
    någon del av journalanteckningen.
    Kardinalitet: Valfri, lista.
  """

* careDocumentation.body.dissentingOpinion.opinionId 0..1 Identifier "Id för avvikande mening" """
    En universellt unik identifierare för den avvikande meningen.
    Kardinalitet: Valfri.
  """

* careDocumentation.body.dissentingOpinion.authorTime 1..1 dateTime "Tidpunkt för avvikande mening" """
    Tidpunkten då den avvikande meningen författades. Format: YYYYMMDDhhmmss.
    Kardinalitet: Obligatorisk.
  """

* careDocumentation.body.dissentingOpinion.opinion 1..1 string "Text för avvikande mening" """
    Text som innehåller den avvikande meningen.
    Kardinalitet: Obligatorisk.
  """

* careDocumentation.body.dissentingOpinion.personId 1..1 Identifier "Id för författare till avvikande mening" """
    Id för författaren av den avvikande meningen.
    root sätts till OID för typ av identifierare. För personnummer: 1.2.752.129.2.1.3.1.
    extension sätts till personens identifierare (12 tecken).
    Kardinalitet: Obligatorisk.
  """

* careDocumentation.body.dissentingOpinion.personName 1..1 string "Namn på författare till avvikande mening" """
    Namnet på författaren av den avvikande meningen.
    Kardinalitet: Obligatorisk.
  """

* hasMore 0..* BackboneElement "Indikation om fler poster" """
    Anges av tjänsteproducent när det finns ytterligare information att hämta
    (partiell datahämtning). Referensen ska vara giltig i minst en timme.
    Kardinalitet: Valfri, lista.
  """

* hasMore.logicalAddress 1..1 string "Logisk adress för partiell hämtning" """
    Den logiska adressen till tjänsteproducenten som tillhandahåller resterande information.
    Kardinalitet: Obligatorisk.
  """

* hasMore.reference 1..1 string "Referens för partiell hämtning" """
    En unik identifierare som tjänstekonsumenten anger i nästa anrop via hasMoreReference.
    Kardinalitet: Obligatorisk.
  """

* result 1..1 BackboneElement "Resultat" """
    Innehåller information om det gick bra eller ej att besvara begäran.
    Kardinalitet: Obligatorisk.
  """

* result.resultCode 1..1 code "Resultatkod" """
    Anger resultatet av besvarad förfrågan. Tillåtna värden: OK, INFO, ERROR.
    Kardinalitet: Obligatorisk.
  """

* result.resultText 0..1 string "Resultattext" """
    Optionellt felmeddelande som innehåller information om eventuella fel.
    Kardinalitet: Valfri.
  """
