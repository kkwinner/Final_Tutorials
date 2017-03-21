#!/bin/bash
#SBATCH -N 1                             # Number of requested nodes
#SBATCH --time=0:02:00                   # Max walltime
#SBATCH --job-name=Matlab                # Job submission name
#SBATCH --output=Matlab.out              # Output file name
#SBATCH --qos=debug		         # Specify debug QOS
#SBATCH --partition=shas	         # Specify Summit haswell nodes
#SBATCH --reservation=new_user           # Reservation name


# Written by:	Shelley Knuth
# Date:		24 February 2014
# Updated:      15 July 2016
# Purpose: 	This script is for the Matlab tutorial.  Its purpose is 
#		to demonstrate how to submit a serial Matlab job from a 
#		batch script on the Janus computers	


# Run matlab without a GUI
matlab -nojvm -nodisplay -nodesktop -r "clear; matlab_tic;"

