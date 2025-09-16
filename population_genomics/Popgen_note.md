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









