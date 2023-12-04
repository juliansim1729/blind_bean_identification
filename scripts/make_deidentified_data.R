# library calls
library(readr)

df <- read_csv("source_data/Dry_Bean_Dataset.csv")

df$Class <- paste0(substr(df$Class, 1, 1), tolower(substr(df$Class, 2, 10)))
labeled500 <- df[sample(which(df$Class == "Seker"), 500),]

for (class in unique(df$Class)[2:7]) {
  samp <- df[sample(which(df$Class == class), 500),]   
  labeled500 <- rbind(labeled500, samp)
}

labeled500 <- labeled500 %>% dplyr::select("Area", "AspectRation", "Extent",
                                           "Solidity", "Compactness", "Class")
labeled500$Area <- scale(labeled500$Area)
labeled500$AspectRation <- scale(labeled500$AspectRation)
labeled500$Extent <- scale(labeled500$Extent)
labeled500$Solidity <- scale(labeled500$Solidity)
labeled500$Compactness <- scale(labeled500$Compactness)

# creating deidentified500 data
deidentified500 <- labeled500[, -ncol(labeled500)]

write_csv(deidentified500, "intermediate_data/deidentified_beans.csv")
write_csv(labeled500, "intermediate_data/labeled_beans.csv")