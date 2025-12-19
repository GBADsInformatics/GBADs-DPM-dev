##################
# file name: master.R
# created by: Anne Meyer
# created on: 2025-12-18
##################

library(yaml)
library(tools)

numSamples <- 100
seedValue <- 123
species <- "smallruminants"

# working directory
setwd(choose.dir())

# Create the YAML input files and run DPM
source("create_yaml_files.R")

# Run the DPM for each YAML file
source("load.R")
