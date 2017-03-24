#!/bin/bash
#SBATCH -N 1			   # Number of requested nodes
#SBATCH --time=0:01:00		   # Max wall time
#SBATCH --qos=debug		   # Specify debug QOS
#SBATCH --partition=shas	   # Specify Summit haswell nodes
#SBATCH --output=hostname.out      # Name of output file
#SBATCH --reservation=new_user   # Reservation name

hostname
