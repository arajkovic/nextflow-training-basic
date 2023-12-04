params.reads = "$baseDir/data/ggal/*_1.fq"
params.transcriptome_file = "$baseDir/data/ggal/transcriptome.fa"

methods = ["salmon", "kallisto"]

read_ch = Channel.fromPath(params.reads)
trans_ch = Channel.value(params.transcriptome_file)

process COMMAND {
  input:
    path reads
    path transcriptome
    each mode

  output:
    path result

  script:
  """
    echo $mode $reads $transcriptome > result
  """
}

workflow {
    command_ch = COMMAND(read_ch, trans_ch, methods)
    command_ch.view { "To run : ${it.text}"}
}