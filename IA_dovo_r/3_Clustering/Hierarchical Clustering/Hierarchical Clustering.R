
# Created on July 13 2020
# Hierarchical Clustering 
# 
# In this section lets see divisive clustering:
# 
# starts by treating each object as a singleton cluster. 
# Next, pairs of clusters are successively merged until all clusters 
# have been merged into one big containing all objects.

# @author: David Andrade / @Bits2Matter


# Import data 
dataset = read.csv("Mall_Customers.csv")
X = dataset[,4:5]

# Use endogram to find best fit numbers of clusters 
dendogram_p = hclust(dist(X, method = "euclidean"), 
                   method = "ward.D")


# Plot endogram 
plot(dendogram_p, 
     main = "Dendogram",
     xlab = "Customers", 
     ylab = "Euclidean distance")


# Adjust Hierarchical Clustering
hc =  hclust(dist(X, method = "euclidean"), 
                    method = "ward.D")
y_hc = cutree(hc, k = 5)


# vis clusters 
library("cluster")
clusplot(X,
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = TRUE,
         span = TRUE,
         main = "Client Clustering",
         xlab = "Annual incomes",
         ylab = "Score Mail (1-100)")
