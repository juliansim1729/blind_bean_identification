# library calls
library(reshape2)
library(ggplot2)

# reading in data
df <- read_csv("intermediate_data/deidentified_beans.csv")

# creating and graphing correlation matrix
cor_mat <- cor(df)
melted_cor_mat <- reshape2::melt(cor_mat)

heatmap <- ggplot(data = melted_cor_mat, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile(color = "white") + 
  scale_fill_gradient2(low = "blue", mid = "white", high = "blue")

output <- heatmap +
  geom_text(aes(x = Var1, y = Var2, label = value), color = "black", size = 2)

ensure_directory("figures")
ggsave("figures/correlation_heatmap.png", output)