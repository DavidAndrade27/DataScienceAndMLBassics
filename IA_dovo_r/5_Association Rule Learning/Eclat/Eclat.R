
# Created on July 20 2020
# Eclat / Assosiation Rules Learning 
# 
# The ECLAT algorithm stands for Equivalence Class Clustering and bottom-up Lattice Traversal. 
# The basic idea is to use Transaction Id Sets(tidsets) intersections to compute the support value
# of a candidate and avoiding the generation of subsets which do not exist in the prefix tree. 
# In the first call of the function, all single items are used along with their tidsets.
#
# @author: David Andrade / @Bits2Matter

# Read dataset 
library("arules")
library("arulesViz")
dataset = read.transactions("Market_Basket_Optimisation.csv", 
                            sep = ",", rm.duplicates = TRUE, 
                            header = FALSE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 10)


# Train algorithm apriori 
rules = eclat(data = dataset, parameter = list(support = 0.004, minlen = 2))
# support = 3*7/7500 -> 3/7(at least bought 3 times in a week)


#Data vis
inspect(sort(rules, by = "support")[1:10])
