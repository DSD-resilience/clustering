# Load the necessary library
library(datasets)

# Load the iris dataset
data("iris")

# View the first few rows of the dataset
head(iris)

# Prepare the data by removing the species column
iris_data <- iris[, -5]

# Set the number of clusters (k)
k <- 3

# Create the k-means clustering model
set.seed(123)  # For reproducibility
kmeans_model <- kmeans(iris_data, centers = k)

# Print the clustering results
print(kmeans_model)

# Add the cluster assignments to the original dataset
iris$cluster <- as.factor(kmeans_model$cluster)

# Visualize the clusters using a scatter plot
library(ggplot2)
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = cluster)) +
  geom_point() +
  labs(title = "K-means Clustering of Iris Data", x = "Petal Length", y = "Petal Width")