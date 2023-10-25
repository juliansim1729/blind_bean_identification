# library calls
library(readr)
library(ggplot2)

# reading in data
df <- read_csv("source_data/Dry_Bean_Dataset.csv")

output <- ggplot(data = df, aes(x = Class)) +
    stat_count(fill = "blanchedalmond", color = "firebrick")

ggsave("figures/counts_by_class.png", output)