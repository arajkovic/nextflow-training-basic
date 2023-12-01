params.reads = "$projectDir/data/ggal/gut_{1,2}.fq"
params.transcriptome_file = "$projectDir/data/ggal/transcriptome.fa"
params.multiqc = "$projectDir/multiqc"
params.outdir = "$projectDir/results"

log.info """\
    reads:          ${params.reads}
    transcriptome:  ${params.transcriptome_file}
    multiqc:        ${params.multiqc}
    outdir:         ${params.outdir}\
    """
    .stripIndent(true)

process INDEX {
    cpus 4

    input:
    path transcriptome

    output:
    path 'salmon_index'

    script:
    """
    salmon index --threads $task.cpus -t $transcriptome -i salmon_index
    """
}

workflow {
    index_ch = INDEX(params.transcriptome_file)
    index_ch.view()
}