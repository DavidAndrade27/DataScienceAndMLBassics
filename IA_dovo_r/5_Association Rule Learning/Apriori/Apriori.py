# -*- coding: utf-8 -*-
"""
Created on Mon Jul 20 16:29:02 2020


Apriori / Assosiation Rules Learning 
 
Apriori is an algorithm for frequent item set mining and association rule learning 
over relational databases. It proceeds by identifying the frequent individual items 
in the database and extending them to larger and larger item sets as long as those item sets 
appear sufficiently often in the database.


@author: David Andrade / @Bits2Matter
"""

import matplotlib as plt
import pandas as pd 

dataset = pd.read_csv("Market_Basket_Optimisation.csv", header = None)
tran = len(dataset)
transaction = []
for i in range(0, tran):
    transaction.append([str(dataset.values[i, j]) for j in range(0,20)])
    

# Train apriori algorithm
from apyori import apriori
rules = apriori(transaction, min_support = 0.003 , min_confidence = 0.2, min_lift = 3, min_lenght = 2)


# vis rules 
results = list(rules)


rule = list()
support = list()
confidence = list()
lift = list()
 
for item in results:
    # first index of the inner list
    # Contains base item and add item
    pair = item[0] 
    items = [x for x in pair]
    rule.append(items[0] + " -> " + items[1])
    
    #second index of the inner list
    support.append(str(item[1]))
 
    #third index of the list located at 0th
    #of the third index of the inner list
 
    confidence.append(item[2][0][2])
    lift.append(item[2][0][3])

output_ds  = pd.DataFrame({'rule': rule,
                           'support': support,
                           'confidence': confidence,
                           'lift': lift
                          }).sort_values(by = 'lift', ascending = False)
output_ds
