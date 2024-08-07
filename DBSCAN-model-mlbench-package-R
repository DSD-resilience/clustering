# Install and load the necessary packages
if (!require(mlbench)) install.packages("mlbench")
if (!require(dbscan)) install.packages("dbscan")
if (!require(ggplot2)) install.packages("ggplot2")

library(mlbench)
library(dbscan)
library(ggplot2)

# Generate the moons dataset
set.seed(123)
data <- mlbench.circle(150, 2)
df <- data.frame(x = data$x[,1], y = data$x[,2])

# Apply DBSCAN
dbscan_model <- dbscan(df, eps = 0.1, minPts = 5)

# Add cluster assignments to the dataframe
df$cluster <- as.factor(dbscan_model$cluster)

# Plot the clusters
ggplot(df, aes(x = x, y = y, color = cluster)) +
  geom_point(size = 2) +
  labs(title = "DBSCAN Clustering on Moons Dataset") +
  theme_minimal()
