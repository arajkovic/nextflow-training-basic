ch = Channel.fromFilePairs('./data/ggal/*_{1,2}.fq', flat: true)
ch.view()