reads_ch = Channel.fromFilePairs('data/ggal/*_{1,2}.fq')

process FOO {
    input:
    tuple val(sample_id), path(sample_id_paths)

    output:
    tuple val(sample_id), path("${sample_id}.bam")

    script:
    """
    echo your_command_here --reads $sample_id_paths > ${sample_id}.bam
    """
}

workflow {
    bam_ch = FOO(reads_ch)
    bam_ch.view()
}
