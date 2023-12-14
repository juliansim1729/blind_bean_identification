# library calls
library(readr)
library(ggplot2)

# reading in data
df <- read_csv("source_data/Dry_Bean_Dataset.csv")

df$Class <- paste0(substr(df$Class, 1, 1), tolower(substr(df$Class, 2, 10)))

output <- ggplot(data = df, aes(x = Class)) +
    stat_count(fill = "blanchedalmond", color = "firebrick") +
    geom_text(stat='count', aes(label=..count..), vjust=-1) +
    labs(title = "Counts by Bean Species") + 
    xlab("Bean Class") +
    ylab("Count") +
    theme(axis.text.x=element_text(size=15))

ggsave("figures/counts_by_class.png", output)