# -*- coding: utf-8 -*-
"""
Created on Sat Jul 11 22:09:56 2020
Hierarchical Clustering 

In this section lets see divisive clustering:

starts by treating each object as a singleton cluster. 
Next, pairs of clusters are successively merged until all clusters have been merged into one big cluster containing all objects.

@author: David Andrade / @Bits2Matter
"""

import numpy as np 
import matplotlib.pyplot as plt 
import pandas as pd 


#Read the dataset 
dataset = pd.read_csv("Mall_Customers.csv")
X = dataset.iloc[:, [3,4]].values


# Dendograms to find the opt number of clusters 
import scipy.cluster.hierarchy as sch 
dendogram = sch.dendrogram(sch.linkage(X, method = "ward"))   
plt.title("Dendogram")
plt.xlabel("Customers")
plt.ylabel("Euclidean Distance")
plt.show

# Adjust Hierarchical Clustering 
from sklearn.cluster import AgglomerativeClustering 
ahc = AgglomerativeClustering(n_clusters = 5, affinity = "euclidean", linkage = "ward")
y_ahc = ahc.fit_predict(X) #Predict 


# Cluster visualization 
plt.scatter(X[y_ahc == 0, 0], X[y_ahc == 0, 1], s = 100, c = "red", label = "Cluster 1")
plt.scatter(X[y_ahc == 1, 0], X[y_ahc == 1, 1], s = 100, c = "blue", label = "Cluster 2")
plt.scatter(X[y_ahc == 2, 0], X[y_ahc == 2, 1], s = 100, c = "green", label = "Cluster 3")
plt.scatter(X[y_ahc == 3, 0], X[y_ahc == 3, 1], s = 100, c = "cyan", label = "Cluster 4")
plt.scatter(X[y_ahc == 4, 0], X[y_ahc == 4, 1], s = 100, c = "magenta", label = "Cluster 5")
plt.title("Clients clusters")
plt.xlabel("Annual income (K$)")
plt.ylabel("Expense score (1-100")
plt.legend()
plt.show()