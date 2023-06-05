#!/usr/bin/bash

#These lines will only be used when script submitted as a job to ARC4.

#Run with current environment (-V) and in the current directory (-cwd)
#$ -V -cwd

#Request some time- min 15 mins - max 48 hours
#$ -l h_rt=24:00:00

#Request some memory per core
#$ -l h_vmem=120G

#Get email at start and end of the job
#$ -m be

while getopts o:y:d:i: flag
do
    case "${flag}" in
        o) output_path=${OPTARG};;
        y) years=${OPTARG};;
        d) data_path=${OPTARG};;
	i) inst_path=${OPTARG};;
    esac
done

# Setting output path if not passed as input.
# Detects whether we are on arc4.
if [[ $SERVICE_NAME == "arc4" ]]; then
	output_path=${o:-'/nobackup/earear/Results/Useful_Stage_EROIs/_targets'}
else
	output_path=${o:-'tar_config_get("store")'}
fi

# Printing variables
#echo "Output path: $output_path";
#echo "Years: $years";
#echo "Input Data Path: $data_path";
#echo "Inst Path: $inst_path";
#echo "Hostname: $HOSTNAME";

# Replacing years if years is not empty
if [[ ! -z "$years" ]]; then
	sed -iE "s/^\(years_analysis_setup <- \).*$/\1 $years/" setup.R
fi

# Replacing path to dataset
if [[ ! -z "$data_path" ]]; then
       sed -iE "s/^\(path_to_datasets_setup <- \).*$/\1 $data_path/" setup.R
fi

# Replacing path to inst
if [[ ! -z "$inst_path" ]]; then
       sed -iE "s/^\(path_to_inst_setup <- \).*$/\1 $inst_path/" setup.R
fi


# Running R script - add tar_make() at the end
R -e "library(targets); targets::tar_config_set(store = '$output_path'); tar_make()"
