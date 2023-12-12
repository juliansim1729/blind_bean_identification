# library calls
library(reshape2)
library(readr)
library(ggplot2)

# reading in data
df <- read_csv("intermediate_data/deidentified_beans.csv")

# creating and graphing correlation matrix
cor_mat <- cor(df)
melted_cor_mat <- reshape2::melt(cor_mat)

heatmap <- ggplot(data = melted_cor_mat, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile(color = "white") + 
  scale_fill_gradient2(low = "plum4", mid = "white", high = "plum4")

output <- heatmap +
  geom_text(aes(x = Var1, y = Var2, label = round(value, 2)), color = "black", size = 2) +
    theme(axis.text.x = element_text(angle = 30, vjust = 1, hjust = 1))

ggsave("figures/correlation_heatmap.png", output)