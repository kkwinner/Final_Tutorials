#!/bin/bash
#SBATCH -N 1                       # Number of requested nodes
#SBATCH --time=0:03:00             # Max walltime
#SBATCH --job-name=for       # Job submission name
#SBATCH --output=for.out     # Output file name
#SBATCH --reservation=scbasics2    # Reservation - will only work during workshop

ml intel

icc for.c -o for_noflag
time ./for_noflag 10000000

icc -qopenmp for.c -o for
time ./for 10000000
