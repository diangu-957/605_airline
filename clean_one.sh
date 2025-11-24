#!/bin/bash
# clean_one.sh
# Usage: bash clean_one.sh input.csv output.csv

export PATH=/workspace/software/R-4.1.2/bin:$PATH

/workspace/software/R-4.1.2/bin/Rscript clean_one.R "$1" "$2"
