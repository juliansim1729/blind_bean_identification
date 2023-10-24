# library calls
library(readr)

# creating deidentified data
df <- read_csv("source_data/Dry_Bean_Dataset.csv")
deidentified <- df[, -ncol(df)]

ensure_directory("intermediate_data")
write_csv(df, "intermediate_data/deidentified_beans.csv")