# library calls
library(readr)

df <- read_csv("source_data/Dry_Bean_Dataset.csv")

# sample 500 rows (beans) from each class
labeled500 <- df[sample(which(df$Class == "SEKER"), 500),]

for (class in unique(df$Class)[2:7]) {
  samp <- df[sample(which(df$Class == class), 500),]   
  labeled500 <- rbind(labeled500, samp)
}

# select pertinent rows and adjust for capitalization/typos
labeled500 <- dplyr::select(labeled500, "Area", "AspectRation", "Extent",
                            "Solidity", "Compactness", "roundness", 
                            "ShapeFactor4", "Class")

labeled500$Class <- paste0(substr(labeled500$Class, 1, 1), 
                           tolower(substr(labeled500$Class, 2, 10)))
colnames(labeled500)[2] <- "AspectRatio"
colnames(labeled500)[6] <- "Roundness"

# scale all numeric rows
for (col_num in 1:ncol(labeled500)) {
  col <- labeled500[,col_num]
  if (is.numeric(col[[1]])) {
    labeled500[,col_num] <- scale(col)[,1]
  }
}

write_csv(labeled500, "intermediate_data/labeled_beans_sf4.csv")

