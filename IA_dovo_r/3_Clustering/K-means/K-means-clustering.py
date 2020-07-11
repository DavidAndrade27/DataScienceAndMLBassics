# -*- coding: utf-8 -*-
"""
Created on Fri Jul 10 18:03:14 2020

Clustering using K-means 

Important: 
1 . Random initialization of centroids (consider using the k-means ++ algorithm)
2 . Determine the number of clusters (consider the elbow method) 

@author: andra
"""


# Libraries
import numpy as np 
import matplotlib.pyplot as plt 
import pandas as pd 

# Reading the dataset
dataset = pd.read_csv("Mall_Customers.csv")
X = dataset.iloc[:, [3,4]].values


# Elbow method to determine the number of clusters
from sklearn.cluster import KMeans
wcss = []
for i in range(1, 11):
    kmeans_det = KMeans(n_clusters = i, init="k-means++", max_iter = 300, n_init = 10, random_state = 0)
    kmeans_det.fit(X)
    wcss.append(kmeans_det.inertia_) # + square  

plt.plot(range(1,11), wcss)
plt.title("Elobow method")
plt.xlabel("Clusters number")
plt.y_label("WCSS(k)")
plt.show()  # the most optimal value of clusters are 5


# Apply k-means method for data segmentation
kmeans = KMeans(n_clusters = 5, init="k-means++", max_iter = 300, n_init = 10, random_state = 0)
y_kmeans = kmeans.fit_predict(X)


# Vis of clusters 
plt.scatter(X[y_kmeans == 0, 0], X[y_kmeans == 0, 1], s = 100, c = "red", label = "Cluster 1")
plt.scatter(X[y_kmeans == 1, 0], X[y_kmeans == 1, 1], s = 100, c = "blue", label = "Cluster 2")
plt.scatter(X[y_kmeans == 2, 0], X[y_kmeans == 2, 1], s = 100, c = "green", label = "Cluster 3")
plt.scatter(X[y_kmeans == 3, 0], X[y_kmeans == 3, 1], s = 100, c = "cyan", label = "Cluster 4")
plt.scatter(X[y_kmeans == 4, 0], X[y_kmeans == 4, 1], s = 100, c = "magenta", label = "Cluster 5")
plt.scatter(kmeans.cluster_centers_[:,0], kmeans.cluster_centers_[:,1], s = 300, c = "yellow", label = "Baricenters")
plt.title("Clients clusters")
plt.xlabel("Annual income (K$)")
plt.ylabel("Expense score (1-100")
plt.legend()
plt.show()

