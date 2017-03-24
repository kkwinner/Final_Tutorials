#!/bin/bash
#SBATCH -N 1                        	 # Number of requested nodes
#SBATCH --time=0:01:00             	 # Max walltime
#SBATCH --job-name=R_code          	 # Job submission name
#SBATCH --output=R_code.out        	 # Output file name
#SBATCH --qos=debug		         # Specify debug QOS
#SBATCH --partition=shas	         # Specify Summit haswell nodes
###SBATCH --reservation=new_user           # Reservation name

# Load the R module
ml R/3.3.0

# Run R Script
Rscript R_program.R
