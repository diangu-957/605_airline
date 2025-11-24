#!/bin/bash

mkdir -p data/clean

rm -rf slurm_out
mkdir slurm_out


num_files=$(wc -l < filelist.txt)

echo "Found $num_files files to clean."


jobId1=$(sbatch \
    --partition=short \
    --array=1-$num_files \
    --output=slurm_out/clean_%A_%a.out \
    --error=slurm_out/clean_%A_%a.err \
    clean_array.sh)

jobId1=$(echo $jobId1 | sed 's/Submitted batch job //')
