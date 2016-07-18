#!/bin/bash
#SBATCH -N 1                         # Number of requested nodes
#SBATCH --time=0:03:00               # Max walltime
#SBATCH --job-name=R_parallel        # Job submission name
#SBATCH --output=R_parallel.out      # Output file name
###SBATCH --reservation=scbasics2    # Reservation - will only work during workshop

ml intel
ml R
Rscript R_parallel.R
