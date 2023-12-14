# library calls
library(readr)

df <- read_csv("source_data/Dry_Bean_Dataset.csv")

# sample 500 rows (beans) from each class
labeled500 <- df[sample(which(df$Class == "SEKER"), 500),]

for (class in unique(df$Class)[2:7]) {
  samp <- df[sample(which(df$Class == class), 500),]   
  labeled500 <- rbind(labeled500, samp)
}

write_csv(labeled500, "intermediate_data/cleaned_beans.csv")
