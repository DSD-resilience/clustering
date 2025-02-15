# Load necessary library
library(ggplot2)

# Generate sample data
set.seed(123)
data <- data.frame(x = rnorm(100), y = rnorm(100))

# Perform k-means clustering
set.seed(123)
kmeans_result <- kmeans(data, centers = 3)

# Add cluster assignments to data
data$cluster <- as.factor(kmeans_result$cluster)

# Plot the clustered data
ggplot(data, aes(x = x, y = y, color = cluster)) +
  geom_point(size = 3) +
  labs(title = "K-means Clustering Example",
       x = "X Axis",
       y = "Y Axis",
       color = "Cluster")

