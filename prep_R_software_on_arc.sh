#!/bin/bash

# Run this script with 
#   source prep_R_software.sh
# to avoid conda errors.

echo "Installing R packages ..."

# Activate the R environment
conda activate r_env

Rscript install_R_packages.R

