#!/bin/bash
#SBATCH -N 1                       # Number of requested nodes
#SBATCH --time=0:01:00             # Max walltime
#SBATCH --job-name=hostname        # Job submission name
#SBATCH --output=hostname.out      # Output file name
#SBATCH --reservation=scbasics     # Reservation - will only work during workshop

hostname
