# -*- coding: utf-8 -*-
"""
Created on Thu Jul 23 16:42:09 2020

@author: andra
"""


import numpy as np 
import matplotlib.pyplot as plt 
import pandas as pd 

dataset = pd.read_csv("Ads_CTR_Optimisation.csv")

# Random selection 
import random
N = 10000
d = 10 
ads_selected = []
total_reward = 0
for i in range(0,N):
    ad = random.randrange(d)
    ads_selected.append(ad)
    reward = dataset.values[i, ad]
    total_reward = total_reward + reward


# Vis results - hist
plt.hist(ads_selected)
plt.title("Hist of ads selections")
plt.xlabel("Ads")
plt.ylabel(" # of times each ad was selected")
plt.show()


# This is what would be done with an A-B test. You randomly present the ads and with that you determine the number of times that users click.
# This option is valid but with machine learning we can optimize these results.