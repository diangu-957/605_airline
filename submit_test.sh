#!/bin/bash
# submit_test.sh

sbatch --partition=short --output=test.out --error=test.err clean_one.sh data/raw/Flights_2018_1.csv test_output.csv
