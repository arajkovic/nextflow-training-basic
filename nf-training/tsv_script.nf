Channel
    .fromPath("data/meta/regions.tsv", checkIfExists: true)
    // use `sep` option to parse TAB separated files
    .splitCsv(sep: '\t', header: true)
    // row is a list object
    .view { row -> "${row.patient_id}" }