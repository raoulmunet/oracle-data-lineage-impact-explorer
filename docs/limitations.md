# Limitations

Oracle dependency metadata is not the same as end-to-end semantic data lineage.

Examples of situations that may not be fully represented:

- dynamic SQL;
- database links;
- runtime-generated table names;
- external ETL tools;
- file transformations;
- application-side SQL;
- transformations hidden behind APIs.

The project therefore calls itself an **explorer** rather than a complete enterprise data catalog.

This distinction is important in real impact-analysis work.
