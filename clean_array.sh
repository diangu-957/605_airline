#!/bin/bash
# clean_array.sh — run clean_one.sh on each file

file=$(sed -n "${SLURM_ARRAY_TASK_ID}p" filelist.txt)

if [[ -z "$file" ]]; then
    echo "ERROR: No file found for TASK_ID = $SLURM_ARRAY_TASK_ID"
    exit 1
fi

echo "Selected file (input): $file"
echo ""


outfile=$(basename "$file")
outfile="cleaned_${outfile}"

bash clean_one.sh "$file" "data/clean/$outfile"
