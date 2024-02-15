#! /bin/bash -login
#SBATCH --mail-type=ALL #for begin, done, fail
#SBATCH --mail-user=mtxtran@ucdavis.edu
#SBATCH -J SRR13201275
#SBATCH -e smashgather.j%j.err
#SBATCH -o smashgatherj%j.out
#SBATCH -c 1
#SBATCH --mem=62g
#SBATCH -t 02-00:00:00
#SBATCH -p med

# initialize conda
module load conda/base/latest

#Activate desired conda environment
conda activate smash

### YOUR COMMANDS GO HERE ###
cd mttran1
#gather
sourmash gather -k 31 SRR13201275.sig gtdb-rs214-reps.k31.zip --linear --scaled=1000 -o SRR13201275_gather.csv

# Print out values of the current jobs SLURM environment variables
env | grep SLURM

# Print out final statistics about resource use before job exits
scontrol show job ${SLURM_JOB_ID}

sstat --format 'JobID,MaxRSS,AveCPU' -P ${SLURM_JOB_ID}.batch

### YOUR COMMANDS GO HERE ###
