#!/usr/bin/bash

# These lines will only be used when script submitted as a job to ARC4.

#Run with current environment (-V) and in the current directory (-cwd)
#$ -V -cwd

#Request some time- min 15 mins - max 48 hours
#$ -l h_rt=00:15:00

#Request some memory per core
#$ -l h_vmem=64G

#Get email at start and end of the job
#$ -m be

# Set the number of cores
#$ -pe smp 8

# Set up the conda environment
conda activate r_env

# Change to directory
cd ~/github/PFUAggDatabase

# Kick off the pipeline
Rscript targets::tar_make_future(workers = 8)



# Rest of Emmanuel's script below

# while getopts o:y:d:i: flag
# do
#     case "${flag}" in
#         o) pfu_output_path=${OPTARG};;
#         y) pfu_years=${OPTARG};;
#         d) pfu_data_path=${OPTARG};;
#         i) inst_path=${OPTARG};;
#     esac
# done
#
# # Setting output path if not passed as input.
# # Detects whether we are on arc4.
# if [[ $SERVICE_NAME == "arc4" ]]; then
# 	output_path=${o:-'/nobackup/$USER/Fellowship 1960-2015 PFU database/OutputData/_targets'}
# else
# 	output_path=${o:-'tar_config_get("store")'}
# fi
#
# # Printing variables
# #echo "Output path: $output_path";
# #echo "Years: $years";
# #echo "Input Data Path: $data_path";
# #echo "Inst Path: $inst_path";
# #echo "Hostname: $HOSTNAME";
#
# # Replacing years if years is not empty
# if [[ ! -z "$pfu_years" ]]; then
# 	sed -iE "s/^\(years_analysis_setup <- \).*$/\1 $pfu_years/" setup.R
# fi
#
# # Replacing path to dataset
# if [[ ! -z "$pfu_data_path" ]]; then
#        sed -iE "s/^\(path_to_datasets_setup <- \).*$/\1 $pfu_data_path/" setup.R
# fi
#
# # Replacing path to inst
# if [[ ! -z "$pfuinst_path" ]]; then
#        sed -iE "s/^\(path_to_inst_setup <- \).*$/\1 $pfu_inst_path/" setup.R
# fi
#
# # Running R script - add tar_make() at the end
# R -e "targets::tar_config_set(store = '$pfu_output_path'); targets::tar_make_future(workers = 8)"

