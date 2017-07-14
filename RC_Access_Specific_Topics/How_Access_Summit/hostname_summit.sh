#!/bin/bash
#SBATCH -N 1                       # Number of requested nodes
#SBATCH --time=0:01:00             # Max walltime
#SBATCH --qos=debug		   # Specify debug QOS
#SBATCH --partition=shas	   # Specify Summit haswell nodes

hostname
