# library calls
library(readr)

df <- read_csv("intermediate_data/labeled_beans.csv")

# creating deidentified500 data
df <- df[, -ncol(df)]

write_csv(df, "intermediate_data/deidentified_beans.csv")