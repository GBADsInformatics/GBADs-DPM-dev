########################
# name: create_yaml_files.R
# created by: Anne Meyer
# create on: 2023_10_05
# modified on: 2025_12_05 (converted to csv inputs + multiple countries)
# content: read the input csv files and create yaml files for each scenario column
########################

## File location
inputFileFolder <- "./Input_tables/"
outputFileFolder <- "./Input_files/"
fileNames <- list.files(inputFileFolder, pattern="*.csv", full.names=TRUE)

## Define function
create_yaml_fn <- function (myFileName) {
# read and process
df <- read.csv(myFileName)
keys <- as.character(df$AHLE.Parameter)
df_val <- df[, -1, drop=F]

# !! adjust text below to use the correct species name and number of iterations. Adjust seed_value if you want 
extras <- paste0("
species: ",species,"
nruns: ",numSamples,"
seed_value: NULL\n
")

# prepare the YAML files
for (col_name in colnames(df_val)) {
    print(col_name) # yaml file
    filename <- paste0(outputFileFolder,col_name, ".yaml")

    file <- file(description = filename, open = "w")
    header <- paste0("##### ", col_name, " #####\n")
    writeLines(header, file)
    writeLines(extras, file)
    for (idx in seq_along(df_val[[col_name]])) {
        line <- ""
        if (!is.na(keys[idx])) {
            if (startsWith(keys[idx], "#")) {
                line <- keys[idx]
            } else if (is.na(keys[idx]) || grepl("^\\s*$", keys[idx])) {
                line <- ""
            } else {
                val <- as.character(df_val[[col_name]][idx])
                if ("/" %in% val && !("(" %in% val)) {
                    nums <- strsplit(val, "/")[[1]]
                    val <- as.character(as.numeric(nums[1]) / as.numeric(nums[2]))
                } else if (val == "0.9/(12*4)") {
                    val <- as.character(0.9 / (12 * 4))
                }
                line <- paste0(keys[idx], ": ", val)
            }
            line <- paste0(line, "\n")
            writeLines(line, file)
        }
    }
    close(file)
}

}

## Process all tables in input folder
lapply(fileNames, create_yaml_fn)