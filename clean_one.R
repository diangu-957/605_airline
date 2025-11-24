#!/usr/bin/env Rscript
# Usage: Rscript clean_one.R input.csv output.csv

.libPaths("./Rlib")

library(data.table)

args <- commandArgs(trailingOnly = TRUE)
input_file  <- args[1]
output_file <- args[2]

dt <- fread(input_file, na.strings = c("", "NA"))

write.csv(dt, output_file, row.names = FALSE)

