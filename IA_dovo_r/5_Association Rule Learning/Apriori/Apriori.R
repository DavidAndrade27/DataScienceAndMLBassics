
# Created on July 20 2020
# Apriori / Assosiation Rules Learning 
# 
# Apriori is an algorithm for frequent item set mining and association rule learning 
# over relational databases. It proceeds by identifying the frequent individual items 
# in the database and extending them to larger and larger item sets as long as those item sets 
# appear sufficiently often in the database.

# @author: David Andrade / @Bits2Matter

# Read dataset 
library("arules")
library("arulesViz")
dataset = read.transactions("Market_Basket_Optimisation.csv", 
                            sep = ",", rm.duplicates = TRUE, 
                            header = FALSE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 20)


# Train algorithm apriori 
rules = apriori(data = dataset, parameter = list(support = 0.003, confidence = 0.2))
# support = 3*7/7500 -> 3/7(at least bought 3 times in a week)


#Data vis
inspect(sort(rules, by = "lift")[1:10])
plot(rules, method = "graph", engine = "htmlwidget")
