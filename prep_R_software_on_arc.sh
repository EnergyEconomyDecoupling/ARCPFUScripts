#!/usr/bin/bash

# Run this script with 
#   source prep_R_software.sh
# to avoid conda errors.

echo "Installing R packages ..."

# Activate the R environment
conda activate r_env

# Switch to updated gcc compiler
module switch intel gnu/8.3.0

# Now install R packages via R script
Rscript prep_R_software_on_arc.R

