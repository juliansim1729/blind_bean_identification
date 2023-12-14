# library calls
library(readr)

df <- read_csv("intermediate_data/labeled_beans_sf4.csv")

df <- df[,-7]

write_csv(df, "intermediate_data/labeled_beans.csv")