# Created by: David Andrade /  @Bits2Matter

# Clustering using K-means 
# 
# Important: 
# 1 . Random initialization of centroids (consider using the k-means ++ algorithm)
# 2 . Determine the number of clusters (consider the elbow method) 


dataset = read.csv("Mall_Customers.csv")

X = dataset[ ,4:5]

# Elbow method to determine the number of clusters
set.seed(6)
wcss = vector()
for (i in 1:10){
  wcss[i] = sum(kmeans(X, i)$withinss)
  
}

plot(1:10, wcss, type = "b", main = "elbow method",
     xlab = "Number of clusters (k)", ylab = "WCSS(k)") # number opt = 5 clusters


# Apply k-means method for data segmentation
set.seed(7)
kmeans <- kmeans(X, 5, iter.max = 300, nstart = 10)

# vis clusters 
library("cluster")
clusplot(X,
         kmeans$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = TRUE,
         span = TRUE,
         main = "Client Clustering",
         xlab = "Annual incomes",
         ylab = "Score Mail (1-100)")



