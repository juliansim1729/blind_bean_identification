
df <- read_csv("intermediate_data/deidentified_beans.csv")

full_pca <- prcomp(df, scale. = TRUE)

vars <- full_pca$sdev^2
sum_var <- sum(vars)

a <- c()

for (i in 1:16) { 
    a <- cbind(a, vars[i]/sum_var)
}

barplot(a, names.arg = 1:16, col = "white")

plot(full_pca$x[,1], full_pca$x[,2], col = rgb(red = 0, green = 0, blue = 0, alpha = 0.2))