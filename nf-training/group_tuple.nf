Channel
    .fromPath("data/meta/*")
    .map { file -> [file.baseName, file]}
    .groupTuple()
    .view()