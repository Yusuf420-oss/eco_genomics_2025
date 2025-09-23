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

Cleaned reads are now ready to proceed to the next step in our pipeline: mapping to the reference genome! 


### 09/16/2025: Mapping Reads to the Reference Genome

Scripts were copied from the shared space and put them into our own repo using the following UNIX code:

-   `/gpfs1/cl/ecogen/pbio6800/PopulationGenomics/`
-   `/gpfs1/cl/ecogen/pbio6800/PopulationGenomics/scripts`
-   `~/projects/eco_genomics_2025/population_genomics/myscripts`

Then, the the bash script called "mapping.sh" was edited and included details from the "SBATCH_header.txt" file to customize what we are asking the VACC to do (i.e. file input, file output, nodes, cpu, etc). We submitted the bash script to the VACC using the following UNIX code:

-   `sbatch ~/Projects_Genomics/eco_genomics_2025/population_genomics/myscripts/mapping.sh`

After submitting the job on the VACC, we edited the "process_bam.sh" file which will do the following:

1.  Convert .sam to .bam files
2.  Sort the bam files - all contigs and reads will be sorted in order
3.  Use the rmdup command to remove PCR duplicates from the bam files
4.  Index the bam files.

Then, a file called "process_stats_wrapped.sh" was created which combines the scripts "process_bam.sh" and "bam_stats.sh" and wraps them, which tells the two scripts to run together. We saved this new file into our own personal directory, using the UNIX code:

-   `~/Projects_Genomics/eco_genomics_2025/population_genomics/myscripts/`

We submitted to the VACC SLURM scheduler using sbatch requesting 10 cpus and 64 GB ram. I ran my files on the VACC during the class session and was a success. 

-   `sbatch ~/Projects_Genomics/eco_genomics_2025/population_genomics/myscripts/process_stats_wrapped.sh`

 The files were saved into my `myscripts` folder.

NB: We used clean reads to map to black spruce reference genome using bwa-mem2


### 09/18/2025: Review Bamstats and set up nucleotide diversity estimation using ANgo

Wrote a short script called "Bamstats Review.R" located in myscripts to evaluate the mapping success

*Roughly 60% of reads mapped in proper pairs

*Coverage depth between 2-3x was observed -> indicating a probabilistic framework is required for analyzing the genotype data.

A bash script was created to set up ANGSD to estimate nucleotide diversity, which is saved in myscripts/ folder titled "ANGSD.sh". This script created a folder in mydata/ which is populated by a file called "2027_bam.list" among other file generated. The bash script was run using the following code:

bash ANGSD.sh

Then, we added another chunk of code in the "ANGSD.sh" file in order to run the ANGSD portion of the script.

A wrapper script called "ANGSD_do_Thetas.sh" was created to begin analyzing nucleotide diversity. The file is located in myscripts/ folder. We sent this script to the VACC and the output file is stored in mylogs/.


### 09/23/2025:

