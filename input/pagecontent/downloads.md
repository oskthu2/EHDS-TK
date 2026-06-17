# Downloads

The following downloads are available for this Implementation Guide.

### Full IG package

The full npm package for this IG, for use with the FHIR validator and other tooling:

- [Package (tgz)](package.tgz)

### Validator setup

To validate instances against profiles in this IG, use the [HL7 FHIR Validator](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator) with the package above:

```
java -jar validator_cli.jar <instance.json> -ig inera.core.template#0.1.0
```

---

> **Guidance for authors:** Add links to any additional artefacts relevant to your IG, such as example collections, mapping spreadsheets, or integration guides.
