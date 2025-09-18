#!/bin/bash

module purge
module load gcc angsd


### Set up directories and variables

mkdir ~/projects/eco_genomics_2025/population_genomics/mydata/ANGSD

INPUT="/gpfs1/cl/ecogen/pbio6800/PopulationGenomics/bams"

OUT="/users/y/o/yoyebami/projects/eco_genomics_2025/population_genomics/mydata/ANGSD"

REF="/gpfs1/cl/ecogen/pbio6800/PopulationGenomics/ref_genome/Pmariana1.0-genome_reduced.fa"

MYPOP="2027"

ls ${INPUT}/${MYPOP}*sorted.rmdup.bam >${OUT}/${MYPOP}_bam.list