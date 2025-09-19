# Population Genomics Notebook

## Fall 2025 Ecological Genomics

## Autor: Oyebamiji Yusuf

### 09/11/2025: Cleaning Fastq read of red spruce

We wrote a bash script called "fastq.sh" located within my Github repo:

-/projects/eco_genomics_2025/populations_genomics/myscripts

We wrote a bash script called "fastp.sh"" located within the myscripts folder 
This was used to trim adaptors off red spruce fastq sequence files.

The raw fastq files were located on the class shre space:

'/gpsfs1/cl/ecogen/pbio6800/PopulationGenomics/fastq/red_spruce'

Using the program fastp we processed the raw reads and cleaned and output the cleaned reads to the following directory on the class shared space 
'/gpsfs1/cl/ecogen/pbio6800/PopulationGenomics/cleanreads'

Fastp Reports for each samples, which I saved into the directory:

-/projects/eco_genomics_2025/populations_genomics/myresults/fastp_reports

The results showed high quality sequence, with most Q-scores being >>20, and low amount of the adapted contamination, which we trimmed out. We also trimmed out the leading 12 bp to get rid of barcoded indices.

leaned reads are now ready to proceed to the next step in our pipeline: mapping to the reference genome! 

### 09/16/2025: Mapping Reads to the Reference Genome
* note my population is 2027
* we used clean reads to map to black spruce reference genome using bwa-mem2
* the reference genome is provided here: 
`/users/y/o/yoyebami/Projects_Genomics/eco_genomics_2025/population_genomics`
* we modified the mapping.sh script to our specific population samples and saved resulting sequence files (.sam) to the class shared space: 
`/gpfs1/cl/ecogen/pbio6800/PopulationGenomics/bams`
* We submitted to the VACC SLURM scheduler using sbatch requesting 10 cpus and 64 GB ram 
* some nodes would not compute so we had to run a few times until no more failure 
* While it was running we produced process_bam.sh and bam_stats.sh files and combined them in a wrapper (process_stats_wrapper.sh)

### 09/18/2025: Review Bamstats and set up nucleotide diversity estimation using ANgo

Wrote a short script called "Bamstats Review.R" located in myscripts to evaluate the mapping success

*Roughly 60% of reads mapped in proper pairs

*Obtained depth of coverage between 2-3x -> suggests we need to use a probabilistic framework for analyzing the genotype data.

We then created a bash script to set up ANGSD to estimate nucleotide diversity, which is saved in myscripts/ folder titled "ANGSD.sh". This script created a folder in mydata/ which is populated by a file called "2100_bam.list". The bash script was run using the following code:

bash ANGSD.sh
Then, we added another chunk of code in the "ANGSD.sh" file in order to run the ANGSD portion of the script.

A wrapper script called "ANGSD_do_Thetas.sh" was created to begin analyzing nucleotide diversity. The file is located in myscripts/ folder. We sent this script to the VACC and the output file is stored in mylogs/.


