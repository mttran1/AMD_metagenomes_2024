#! /bin/bash -login 
#SBATCH -J smashtable_trial.j%j.err
#SBATCH -o smashtable_trial.j%j.out
#SBATCH -c 1
#SBATCH --mem=62Gb
#SBATCH -t 02-00:00:00
#SBATCH -p med

# initialize conda
module load conda/base/latest

#Activate desired conda environment
conda activate smash

### YOUR COMMANDS GO HERE ###
cd mttran1
# gather
sourmash gather SRR13201271.sig gtdb-rs214-reps.k31.zip -o SRR13201271_gtdbrs214_k31_gather.csv

# summarize
sourmash tax metagenome --gather-csv SRR13201271_gtdbrs214_k31_gather.csv --taxonomy gtdb-rs214.lineages.csv --output-format krona --rank species -o SRR13201271_metagenome_krona.csv
### YOUR COMMANDS GO HERE ###

# Print out values of the current jobs SLURM environment variables
env | grep SLURM

# Print out final statistics about resource use before job exits
scontrol show job ${SLURM_JOB_ID}

sstat --format 'JobID,MaxRSS,AveCPU' -P ${SLURM_JOB_ID}.batch### YOUR COMMANDS GO HERE ###

