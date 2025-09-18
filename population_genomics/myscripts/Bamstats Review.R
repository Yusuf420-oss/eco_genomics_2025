# Reviewing Our Bamstats

setwd("population_genomics/myresults/")

stats <- read.table("2027.stats.txt", header=TRUE, sep="")


View(stats)

stats$pctpaired = stats$Num_Paired/stats$Num_reads
