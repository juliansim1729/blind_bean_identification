library(ggplot2)
library(readr)
library(naivebayes)
library(gridExtra)

load("intermediate_data/train_test.RData")
load("intermediate_data/nbc_models.RData")

colors <- c("#1F77B4", "#FF7F0E", "#2CA02C", "#D62728", "#9467BD",
            "#8C564B", "#7F7F7F")

test$predict <- predict(mod2, test[, -c(7, 8)])

ave_plot_pred <- ggplot(test, aes(x = Area, y = Extent)) +
  geom_point(aes(col = predict), alpha = 0.66) + 
  labs(title = "Area (Scaled) vs Extent for NBC (Predicted)") +
  ylab("Extent") +
  xlab("Scaled Area") +
  scale_x_continuous(labels = function(x) paste0(x)) +
  scale_y_continuous(labels = function(y) paste0(y, "")) +
  scale_color_manual(values = colors)

ave_plot_real <- ggplot(test, aes(x = Area, y = Extent)) +
  geom_point(aes(col = Class), alpha = 0.66) + 
  labs(title = "Area (Scaled) vs Extent for NBC (True)") +
  ylab("Extent") +
  xlab("Scaled Area") +
  scale_x_continuous(labels = function(x) paste0(x)) +
  scale_y_continuous(labels = function(y) paste0(y, "")) +
  scale_color_manual(values = colors)

ggsave("figures/area_vs_extent.png", arrangeGrob(ave_plot_pred, ave_plot_real))

