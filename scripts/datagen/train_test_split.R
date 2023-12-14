# library calls
library(readr)

df <- read_csv("intermediate_data/labeled_beans_sf4.csv")

train <- df[1:400,]
test <- df[401:500,]

for (class in 2:length(unique(df$Class))) {
  tmp_tr <- df[(500*class - 499):(500*class - 100),]
  tmp_te <- df[(500*class - 99):(500*class),]
  
  train <- rbind(train, tmp_tr)
  test <- rbind(test, tmp_te)
}

save(train, test, file = "intermediate_data/train_test.RData")