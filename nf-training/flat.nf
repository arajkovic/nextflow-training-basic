process SPLITLETTERS {
    output:
    path 'chunk_*'

    script:
    """
    printf 'Hola' | split -b 1 - chunk_
    """
}

workflow {
    letters = SPLITLETTERS()
    letters
        .view { "File: ${it.name} => ${it.text}" }
}
