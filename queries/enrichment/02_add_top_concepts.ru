PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

WITH ?graph
INSERT {
  ?concept skos:topConceptOf ?scheme .
  ?scheme skos:hasTopConcept ?concept .
}
WHERE {
  ?concept a skos:Concept ;
    skos:inScheme ?scheme .
  FILTER (isIRI(?concept))
  FILTER NOT EXISTS {
    {
      ?scheme skos:hasTopConcept ?concept .
    } UNION {
      ?concept skos:topConceptOf ?scheme .
    } UNION {
      ?concept skos:broader [] .
    } UNION {
      ?concept skos:broaderTransitive [] .
    } UNION {
      ?concept skos:editorialNote "Temporary concept to be linked"@en .
    }
  }
}
