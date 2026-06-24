// Genererad från TKB clinicalprocess:healthcond:basic v2.0
// Kontrakt: GetObservations v2.0
// Genererad: 2026-05-18

Logical: IneraEHDSLMObservations
Id: inera-ehds-lm-observations
Title: "GetObservations"
Description: """
  Logisk modell för tjänstekontraktet GetObservations
  (RIV-TA urn:riv:clinicalprocess:healthcond:basic:GetObservationsInteraction:2).
  Representerar responsens informationsstruktur — en samling observationer som
  matchar sökkriterier i begäran, inklusive header-information.
  Meddelandemodellen från avsnitt 5.1 V-MIM — Observationer i TKB motsvarar
  en observation i svarsmeddelandet.
"""
Characteristics: #can-be-target

* observations 0..* BackboneElement "De observationer som matchar sökkriterierna, inklusive header."
    """
    Kardinalitet: Valfri, lista (0..*) — tomt svar returneras om inga observationer matchar.
    """
  * header 1..1 BackboneElement "Header enligt RIV-TA standard."
      """
      Se separat dokument med fältregler för header [R10].
      Kardinalitet: Obligatorisk (1..1).
      """
  * observationBody 1..1 BackboneElement "Information om en observation (ObservationType)."
      """
      Motsvarar klasserna Observation och Uppgift i patientjournal i NI 2017.
      Kardinalitet: Obligatorisk (1..1).
      """
    * observationId 1..1 Identifier "Identitet för observationen, unik inom vårdgivaren."
        """
        - root: Den informationsägande vårdgivarens HSA-id
        - extension: Den inom vårdgivaren unika id-beteckningen för observationen
        Kardinalitet: Obligatorisk (1..1).
        """
    * registrationTime 1..1 instant "Dokumentationstidpunkt — när uppgiften registrerades i journalen."
        """
        Kan skilja sig från signeringstidpunkt (som återfinns i header).
        Kardinalitet: Obligatorisk (1..1).
        """
    * observationType 0..1 CodeableConcept "NI 2017 (Observation.typ) — typ av observation."
        """
        Kod för den typ av observation, används då typen inte framgår av attributet värde.
        Exempel: "längd mätt utan skor" eller "huvuddiagnos".
        CVType-regler (TKB): displayName är 1..1 (obligatorisk om fältet anges).
        codeSystemVersion är 0..1.
        Kardinalitet: Valfri (0..1).
        """
    * observationValue 1..1 BackboneElement "NI 2017 (Observation.värde) — det faktiska observerade hälsotillståndet."
        """
        Representeras av ValueANYType — en av: cv (CVType/kodat värde), pq (mätvärde),
        ivl_pq (intervall), ts (tidpunkt), ivl_ts (tidsintervall), st (fritext), int (heltal).
        Kardinalitet: Obligatorisk (1..1).
        """
      * cv 0..1 CodeableConcept "Kodat värde (CVType). Exempelvis diagnoskod ICD-10 eller Snomed CT."
      * pq 0..1 Quantity "Mätvärde (PQType). Exempelvis 174 cm eller 37,8 °C."
      * ivlpq 0..1 Range "Intervall av mätvärden (PQIntervalType, RIV-TA: ivl_pq). Exempelvis 37,1-37,8 °C." """
          Villkor: Minst ett av low och high måste anges per TKB.
        """
      * ts 0..1 string "Tidpunkt med variabel precision (PartialTimeStampType)." """
          Format: YYYY | YYYYMM | YYYYMMDD | YYYYMMDDhh | YYYYMMDDhhmm | YYYYMMDDhhmmss.
          Precision är explicit i formatet. Se OBS-001 (beslutad mappning i FHIR).
        """
      * ivlts 0..1 Period "Tidsintervall med variabel precision (PartialTimePeriodType, RIV-TA: ivl_ts)." """
          Villkor: Minst ett av start och end måste anges per TKB.
        """
      * st 0..1 string "Textuell beskrivning."
      * intValue 0..1 integer "Heltal (RIV-TA: int)." """
          Ska ENBART användas för skalvärden (t.ex. poäng på AUDIT-skalan).
          Får INTE användas för fysiskt uppmätta värden (längd, vikt etc.) — använd pq för dessa.
        """
    * scale 0..1 CodeableConcept "NI 2017 (Observation.skala) — den mätskala som värdet är uppmätt på."
        """
        Två huvudtyper: nominalskala (kategorisk) och ordinalskala (rangordnad).
        Exempel: AUDIT-skalan (0-40 poäng) eller AB0-blodgruppsystemet.
        CVType-regler (TKB): displayName är 1..1 (obligatorisk om fältet anges).
        Kardinalitet: Valfri (0..1).
        """
    * observationStatus 1..1 CodeableConcept "NI 2017 (Observation.status) — observationens status."
        """
        Koder tillhandahålls av Socialstyrelsen som urval ur Snomed CT (urvals-id: 56431000052106).
        Snomed CT OID: 1.2.752.116.2.1.1.
        En instans av klassen observation kan inte byta status.
        CVType-regler (TKB): displayName är 1..1 (obligatorisk).
        Kardinalitet: Obligatorisk (1..1).
        """
    * observationStatus from SEObservationStatusVS (required)
    * targetSite 0..* CodeableConcept "NI 2017 (Observation.lokalisation) — lokalisation för observationen."
        """
        Används för att beskriva vad observationen avser gällande anatomi, funktion eller system.
        Kan beskriva lateralitet, organs position, orientering i relation till kroppen etc.
        Används endast om value inte innefattar tillräcklig information om lokalisation.
        Kardinalitet: Valfri, lista (0..*).
        """
    * description 0..1 string "NI 2017 (Observation.beskrivning) — textuell beskrivning som komplement till value."
        """
        Används som komplement till value i de fall ytterligare textuell beskrivning krävs.
        OBS: Om observationen ENDAST består av fritext ska denna anges i value/st.
        Kardinalitet: Valfri (0..1).
        """
    * time 0..1 BackboneElement "NI 2017 (Observation.tid) — tidpunkt eller tidsintervall för observationen (TimeType)."
        """
        Angivelse av den tid då det som observerats faktiskt förekom eller förväntas förekomma.
        Skiljer sig från registrationTime (dokumentationstidpunkt).
        Kardinalitet: Valfri (0..1).
        """
      * ts 0..1 string "Tidpunkt med variabel precision." """
          Format: YYYY | YYYYMM | YYYYMMDD | YYYYMMDDhh | YYYYMMDDhhmm | YYYYMMDDhhmmss.
          Se OBS-001 (beslutad mappning i FHIR).
        """
      * ivlts 0..1 Period "Tidsintervall med variabel precision (RIV-TA: ivl_ts)." """
          Villkor: Minst ett av start och end måste anges per TKB.
        """
    * valueNegation 1..1 boolean "NI 2017 (Observation.negation) — negerar betydelsen av value."
        """
        Normalvärde: false (positiv utsaga).
        true = man har letat efter ett visst tillstånd och konstaterat att det inte föreligger.
        Kardinalitet: Obligatorisk (1..1).
        """
    * patient 1..1 BackboneElement "Den patient som observationen avser (PatientInformationType)."
        """
        Motsvarar klassen Patient i NI 2017. Se PatientInformationType.
        Kardinalitet: Obligatorisk (1..1).
        """
      * patientId 0..1 Identifier "NI 2017 (Patient.id) — nationell reservidentitet om tillämpligt."
          """
          OID: 1.2.752.74.9.1. Obligatoriskt att ange antingen person-id (i person) eller id på patient.
          """
      * person 1..1 BackboneElement "Uppgifter om den person som har rollen som patient (PersonType)."
          """
          Se övrig regel 3 (avsnitt 6.1.3.3). Inkluderar id, givenName, surname, gender,
          dateOfBirth, confidentialityIndicator m.m.
          """
        * personId 0..1 Identifier "Person-id (personnummer eller samordningsnummer)."
        * givenName 0..* string "NI 2017 (Person.förnamn)."
        * middleSurname 0..1 string "NI 2017 (Person.mellannamn)."
        * surname 0..1 string "NI 2017 (Person.efternamn)."
        * givenNameMarker 0..1 integer "NI 2017 (Person.tilltalsnamnsmarkering). Giltiga värden: 10-99."
        * gender 0..1 CodeableConcept "NI 2017 (Person.kön). KV Kön OID: 1.2.752.129.2.2.1.1." """
            Koder: 0=okänt, 1=man, 2=kvinna, 9=ej tillämpligt.
            CVType-begränsning: originalText är förbjudet (0..0) för könsfältet per TKB.
          """
        * dateOfBirth 0..1 date "NI 2017 (Person.födelsedatum). Format ÅÅÅÅMMDD."
        * confidentialityIndicator 1..1 boolean "NI 2017 (Person.sekretessmarkering). Defaultvärde: false."
        * maritalStatus 0..1 CodeableConcept "NI 2017 (Person.civilstånd)."
        * address 0..* BackboneElement "NI 2017 (Person.adress). Se AddressType."
        * electronicAddress 0..* BackboneElement "NI 2017 (Person.elektroniskAdress). Se TelType."
      * address 0..* BackboneElement "NI 2017 (Patient.adress). Särskild kallelseadress etc. Se AddressType."
      * electronicAddress 0..* BackboneElement "NI 2017 (Patient.elektroniskAdress). Exempelvis telefon till telemedicinutrustning. Se TelType."
    * participation 0..* BackboneElement "Deltagare i observationen (ParticipationType)."
        """
        Kan vara hälso- och sjukvårdspersonal, patienten, annan person, organisation,
        plats eller resurs.
        En och endast en av: healthcareProfessional, patient, otherPerson, locationRole,
        resource, organisation.
        Motsvarar klassen Deltagande i NI 2017.
        Kardinalitet: Valfri, lista (0..*).
        """
      * participantType 1..1 CodeableConcept "Typ av deltagande (utförare, vittne, ansvarig etc.)."
          """
          Koder tillhandahålls av Socialstyrelsen som urval ur Snomed CT (urvals-id: 53351000052100).
          Snomed CT OID: 1.2.752.116.2.1.1.
          """
      * time 0..1 BackboneElement "Tidpunkt för deltagandet om den skiljer sig från observationens tid. Se TimeType."
      * healthcareProfessional 0..1 BackboneElement "Hälso- och sjukvårdspersonal (HealthcareProfessionalType)."
          """
          Fält: id (HSA-id), person (PersonType), jobCode (befattning, 0..1),
          license (legitimation, 0..*), specialistQualification (specialistkompetens, 0..*),
          organisation (1..1), address (0..*), electronicAddress (0..*).
          """
        * performerId 0..1 Identifier "HSA-id. OID: 1.2.752.129.2.1.4.1."
        * person 1..1 BackboneElement "Uppgifter om personen. Se PersonType."
        * jobCode 0..1 CodeableConcept "NI 2017 (Hälso- och sjukvårdspersonal.befattning). 0..1 pga tillgänglighet i källsystem."
        * license 0..* CodeableConcept "NI 2017 (Hälso- och sjukvårdspersonal.legitimation)."
        * specialistQualification 0..* CodeableConcept "NI 2017 (Hälso- och sjukvårdspersonal.specialistkompetens)."
        * organisation 1..1 BackboneElement "Organisation för uppdraget. Se OrganisationType."
        * address 0..* BackboneElement "NI 2017 (Hälso- och sjukvårdspersonal.adress). Se AddressType."
        * electronicAddress 0..* BackboneElement "NI 2017 (Hälso- och sjukvårdspersonal.elektroniskAdress). Se TelType."
      * patient 0..1 BackboneElement "Patienten som deltagare (PatientInformationType) — ej som subjekt för observationen."
      * otherPerson 0..1 BackboneElement "Övrig person — ej patienten eller hälso- och sjukvårdspersonal (OtherPersonType)."
          """
          Fält: type (1..1, CVType), person (1..1, PersonType), organisation (0..1, OrganisationType).
          """
      * locationRole 0..1 BackboneElement "Plats eller platsroll som deltar i observationen (LocationRoleType)."
          """
          Typ av roll: t.ex. patientens hem, semesterboende, arbetsplats.
          Fält: type (0..1, CVType), location (0..1) med id, type, name, locationAddress, electronicAddress, position.
          """
      * resource 0..1 BackboneElement "Resurs som deltar — t.ex. medicinteknisk utrustning (ResourceType)."
          """
          Fält: id (0..1, IIType), type (0..1, CVType), groupId (0..*, IIType),
          amount (0..1, AmountType), resourceProperty (0..*, typ + value).
          """
      * organisation 0..1 BackboneElement "Organisation som deltar i observationen (OrganisationType)."
    * relation 0..* BackboneElement "Typade samband till andra informationsmängder (RelationType)."
        """
        Motsvarar delvis klassen Samband i NI 2017.
        Exempel: ett systoliskt blodtryck (observation) är resultat av aktiviteten blodtrycksmätning.
        Kardinalitet: Valfri, lista (0..*).
        """
      * relationType 1..1 CodeableConcept "NI 2017 (Samband.typ) — kod för relationstyp."
          """
          Koder tillhandahålls av Socialstyrelsen som urval ur Snomed CT (urvals-id: 53371000052106).
          Snomed CT OID: 1.2.752.116.2.1.1.
          """
      * referredInformation 1..1 BackboneElement "Referens till en uppgift i patientjournal som observationen har samband till."
        * referenceId 1..1 Identifier "Identitet på den refererade informationen."
        * time 1..1 string "Starttid för refererad information. Format: ÅÅÅÅMMDDttmmss (varierande precision). Se övrig regel 4."
        * categorization 1..1 string "Typ av information som sambandet pekar ut (kod från Categorization i engagemangsindexposten)."
        * informationOwner 1..1 BackboneElement "Vårdgivare som är informationsägare av den refererade informationen."
          * careGiverId 1..1 Identifier "Identitet för informationsägande vårdgivare. OID: 1.2.752.129.2.1.4.1."
