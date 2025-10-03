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


### 09/23/2025: Nuclear Diversity and Tijima D Analysis

We created a RMD file called Nuclear_Diversity.Rmd where all the code chunk were documented.

Overall, the script was aimed at analyzing the nucleotide diversity patterns across the genome of red spruce using a processed data named diversity in myresult directory. 

The path to the file was stipulated in the code chunk
"~/Projects_Genomics/eco_genomics_2025/population_genomics/myresults/ANGSD/diversity/"

To begin the analysis, libraries were loaded including ggplot2 and tidyverse

library(ggplot2)
library(tidyverse)

Next, code chunk was written to read a file called 2027_ALL_win50000_step50000.thetas and store it in a data frame created called theta. Then we scaled our theta by n sites.

theta <-read.table('2027_ALL_win50000_step50000.thetas',header=T, sep='\t')
head(theta)

We sorted our data (by chromosomes and window), filtered it and saved it into a new file called theta2.

Next, we plot histogram by window and plot nuclear diversity graph as Pi
ggplot

Then, we compared pi and theta-w and look for the deviation. Finally, we calculated the minimum and maximum Tajima D values.

We added class results to google doc. The results suggest a latitudinal trend in diversity (higher in north) and inverse for TajD (more bottlenecked in south)


### 09/25/2025: PCA and Admixture Analysis 
Overall, the script was aimed at performing the PCA and admixture analysis on red spruce using a processed data named PCA_ADMIX in myresult directory. The path to the file was stipulated in the code chunk

~/Projects_Genomics/eco_genomics_2025/population_genomics/myresults/ANGSD/PCA_ADMIX/

We created principal component analyses (PCA) with the 95 red spruce samples (N=113 total)

We used beagle file in the class datashare with genotype likelihoods alraedy computed:

/gpfs1/cl/ecogen/pbio6800/population_genomics/ANGSD/RSBS_poly.beagle.gz

We ran PCAngsd to estimate PCA and admixture analysis. Important options were set the chosen value of k (= # of groups or clusters to assign ancestry to). Note that K is equivalent to the number of PCA eignevalues + 1.

Looking at the results, it appears there is evidence for hybridization. We discussed a bit as a class but would like to follow up with some additional interpretation and analysis. 


### 09/30/2025: Selection Analysis
We wrote a bash script called PCAngsd_allRS_selection.sh that includes the code ckunk for selection analysis.

We recall PCAngsd where genotype likelihoods in “beagle” format has been calculated and located in

/gpfs1/cl/ecogen/pbio6800/population_genomics/ANGSD/allRS_poly.beagle.gz

Prior to selection analysis, we added the following options listed below while some options such as amix or admix-K are removed and other options are remain the same.

--selection-eig $E \
--selection \
--sites-save \
--maf-save \
--snp-weights \


After running the scripts and got the results files, we used R to import selection results and meta-data associated with it. Then p-values were assigned for each tested locus, and  we visualize the results using the ggplot package.

Looking at the results, it appears there is evidence for selection.









