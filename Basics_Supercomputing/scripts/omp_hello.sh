#!/bin/bash
#SBATCH -N 1                       # Number of requested nodes
#SBATCH --time=0:03:00             # Max walltime
#SBATCH --job-name=omp_hello       # Job submission name
#SBATCH --output=omp_hello.out     # Output file name
#SBATCH --reservation=scbasics2    # Reservation - will only work during workshop


ml intel

ifort -qopenmp omp_hello.f -o hello
./hello
