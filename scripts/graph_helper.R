library(ggplot2)
library(bbplot)

colors <- c("#1F77B4", "#FF7F0E", "#2CA02C", "#D62728", "#9467BD",
            "#8C564B", "#7F7F7F")

temp <- labeled500
temp$Class <- as.factor(cluster$clus[,1])

ggplot(test, aes(x = Area, y = AspectRation)) +
  geom_point(aes(col = predict), alpha = 0.66) + 
  labs(title = "Area vs Aspect Ratio for NBC (Scaled)") +
  ylab("Aspect Ratio (post Scaling)") +
  xlab("Scaled Area") +
  scale_x_continuous(labels = function(x) paste0(x)) +
  scale_y_continuous(labels = function(y) paste0(y, "")) +
  scale_color_manual(values = colors)

