#!/bin/bash
#SBATCH -N 1                       # Number of requested nodes
#SBATCH --time=0:01:00             # Max walltime
#SBATCH --job-name=sleep           # Job submission name
#SBATCH --output=sleep.out         # Output file name
#SBATCH --reservation=tutorial1    # Reservation - will only work during workshop
#SBATCH --mail-type=end		   # Email at of script 
###SBATCH --mail-user=<user>@colorado.edu

whoami
sleep 90
hostname
