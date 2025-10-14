# Load libraries
library(tximport)
library(readr)

# Path to sample table
samples <- read.csv("/gpfs1/home/y/o/yoyebami/Projects_Genomics/eco_genomics_2025/Transcriptomics/myresults/samples.csv")

# Make a named vector of quant.sf file paths
files <- file.path(samples$path, "quant.sf")
names(files) <- samples$sample

# Import Salmon quantifications
txi <- tximport(files, type = "salmon", txOut = TRUE)

# Write counts to txt
write.table(txi$counts, "/gpfs1/home/y/o/yoyebami/Projects_Genomics/eco_genomics_2025/Transcriptomics/mydata/counts_matrix.txt")
