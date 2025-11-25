#!/usr/bin/env Rscript
# Usage: Rscript clean_one.R input.csv output.csv

.libPaths("./Rlib")

library(data.table)

args <- commandArgs(trailingOnly = TRUE)
input_file  <- args[1]
output_file <- args[2]

dt <- fread(input_file, na.strings = c("", "NA"))
setnames(dt, trimws(names(dt)))

keep_vars <- c(
  "Year", "Month", "DayofMonth", "DayOfWeek", "FlightDate",
  "CRSDepTime", "CRSArrTime", "CRSElapsedTime",
  
  "Operating_Airline", "Origin", "Dest",
  "OriginState", "DestState", "OriginCityName", "DestCityName",
  
  "Distance", "AirTime", "Flights", "Cancelled",
  
  "DepDelay", "DepDel15", "ArrDelay",
  "CarrierDelay", "WeatherDelay", "NASDelay",
  "SecurityDelay", "LateAircraftDelay"
)


keep_vars <- keep_vars[keep_vars %in% names(dt)]
dt <- dt[, ..keep_vars]

write.csv(dt, output_file, row.names = FALSE)

