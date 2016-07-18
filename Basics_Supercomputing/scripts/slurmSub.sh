#!/bin/bash
#SBATCH -N 1                       # Number of requested nodes
#SBATCH --ntasks-per-node=12       # number of cores per node
#SBATCH --time=1:00:00             # Max walltime
#SBATCH --job-name=SLURMDemo       # Job submission name
#SBATCH --output=SLURMDemo.out     # Output file name
###SBATCH -A <account>             # Account name
###SBATCH --mail-type=end          # Send Email on completion
###SBATCH --mail-user=<your@email> # Email account

module load openmpi/openmpi-1.8.0_intel-13.0.0

mpirun ./hello
