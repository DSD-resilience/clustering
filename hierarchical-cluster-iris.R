# Load the necessary library
library(datasets)

# Load the iris dataset
data("iris")

# View the first few rows of the dataset
head(iris)

# Prepare the data by removing the species column
iris_data <- iris[, -5]

# Compute the distance matrix
distance_matrix <- dist(iris_data)

# Perform hierarchical clustering using the complete linkage method
hclust_model <- hclust(distance_matrix, method = "complete")

# Plot the dendrogram
plot(hclust_model, labels = iris$Species, main = "Dendrogram of Iris Data")

# Cut the dendrogram into 3 clusters
clusters <- cutree(hclust_model, k = 3)

# Add the cluster assignments to the original dataset
iris$cluster <- as.factor(clusters)

# Print the first few rows of the dataset with clusters
head(iris)

# Visualize the clusters using a scatter plot
library(ggplot2)
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = cluster)) +
  geom_point() +
  labs(title = "Hierarchical Clustering of Iris Data", x = "Petal Length", y = "Petal Width")
