library(readr)
library(ggplot2)
library(naivebayes)
library(dplyr)

load("intermediate_data/nbc_models.RData")
load("intermediate_data/train_test.RData")

# determining which is better
sf4_comp <- data.frame(class = test$Class, with = predict(mod1, test[, -8]) == test$Class,
                       without = predict(mod2, test[, -c(7, 8)]) == test$Class)

sf4_comp$good_pred <- "neither"
sf4_comp$good_pred[which(sf4_comp$with == TRUE & sf4_comp$without == TRUE)] <- "both"
sf4_comp$good_pred[which(sf4_comp$with == TRUE & sf4_comp$without == FALSE)] <- "with_sf4"
sf4_comp$good_pred[which(sf4_comp$with == FALSE & sf4_comp$without == TRUE)] <- "without_sf4"

# making a 14 x 50 matrix for graphing with geom_tile
sf4_comp$i <- (as.numeric(rownames(sf4_comp)) - 1) %% 50
sf4_comp$j <- (as.numeric(rownames(sf4_comp)) - 1) %/% 50

# vectorized spacing -- math is fun?!
sf4_comp$j <- sf4_comp$j + (sf4_comp$j %/% 2)

very_cool_plot <- ggplot(sf4_comp) + 
  geom_tile(aes(x = i, y = j, fill = good_pred), color = "black", alpha = 0.5) +
  scale_fill_manual(values = c("neither" = "black", "both" = "white",
                               "with_sf4" = "cyan", "without_sf4" = "pink")) +
  annotate("text", x = c(0.6, 1.2, 1, 0.2, 0.7, 0.2, 1.4), y = seq(2, 20, by = 3), 
           label = c("Seker", "Barbunya", "Bombay", "Cali", "Horoz", "Sira", "Dermason")) +
  theme_void()

ggsave("figures/sf4_comparison.png", very_cool_plot)