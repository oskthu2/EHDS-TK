<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile Flag
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Flag</sch:title>
    <sch:rule context="f:Flag">
      <sch:assert test="count(f:extension[@url = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-information-comment']) &lt;= 1">extension with URL = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-information-comment': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-ascertained-date']) &lt;= 1">extension with URL = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-ascertained-date': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-verified-time']) &lt;= 1">extension with URL = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-verified-time': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-asserted-date']) &lt;= 1">extension with URL = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-asserted-date': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-asserter']) &lt;= 1">extension with URL = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-asserter': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-degree-of-severity']) &lt;= 1">extension with URL = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-degree-of-severity': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-degree-of-certainty']) &lt;= 1">extension with URL = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-degree-of-certainty': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-pharmaceutical-hypersensitivity']) &lt;= 1">extension with URL = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-pharmaceutical-hypersensitivity': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-treatment-description']) &lt;= 1">extension with URL = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-treatment-description': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-route-of-transmission']) &lt;= 1">extension with URL = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-route-of-transmission': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-restriction-of-care-comment']) &lt;= 1">extension with URL = 'https://fhir.inera.se/ig/ehds-tk/StructureDefinition/alert-restriction-of-care-comment': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Flag/f:meta</sch:title>
    <sch:rule context="f:Flag/f:meta">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:versionId) &lt;= 1">versionId: maximum cardinality of 'versionId' is 1</sch:assert>
      <sch:assert test="count(f:lastUpdated) &lt;= 1">lastUpdated: maximum cardinality of 'lastUpdated' is 1</sch:assert>
      <sch:assert test="count(f:source) &lt;= 1">source: maximum cardinality of 'source' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Flag/f:period</sch:title>
    <sch:rule context="f:Flag/f:period">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:start) &gt;= 1">start: minimum cardinality of 'start' is 1</sch:assert>
      <sch:assert test="count(f:start) &lt;= 1">start: maximum cardinality of 'start' is 1</sch:assert>
      <sch:assert test="count(f:end) &lt;= 1">end: maximum cardinality of 'end' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
