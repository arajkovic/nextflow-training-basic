params.reads = "$baseDir/data/ggal/*_1.fq"

Channel
    .fromPath(params.reads)
    .set { read_ch }

process CONCAT {
  input:
    path '*'

  output:
    path 'top_10_lines'

  script:
  """
  cat * > concatenated.txt
  head -n 10 concatenated.txt > top_10_lines
  """
}

workflow {
    concat_ch = CONCAT(read_ch.collect())
    concat_ch.view()
}