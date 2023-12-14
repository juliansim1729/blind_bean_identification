# library calls
library(readr)
library(naivebayes)

load("intermediate_data/train_test.RData")

mod1 <- naive_bayes(Class ~ Area + AspectRatio + Extent + Solidity + Compactness +
                      Roundness + ShapeFactor4, data = train)

mod2 <- naive_bayes(Class ~ Area + AspectRatio + Extent + Solidity + Compactness +
                      Roundness, data = train)

save(mod1, mod2, file = "intermediate_data/nbc_models.RData")


