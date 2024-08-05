# Install and load the necessary package
if (!require(mclust)) install.packages("mclust")
library(mclust)

# Load the iris dataset
data("iris")

# Prepare the data by excluding the species column
iris_data <- iris[, -5]

# Fit the Gaussian Mixture Model
gmm_model <- Mclust(iris_data)

# Print the model summary
summary(gmm_model)

# Plot the BIC values for different models
plot(gmm_model, what = "BIC")

# Plot the clustering results
plot(gmm_model, what = "classification")

# Add the cluster assignments to the original dataset
iris$cluster <- as.factor(gmm_model$classification)

# Print the first few rows of the dataset with clusters
head(iris)

# Evaluate the clustering by creating a confusion matrix with the actual species
confusion_matrix <- table(iris$Species, iris$cluster)
print(confusion_matrix)
