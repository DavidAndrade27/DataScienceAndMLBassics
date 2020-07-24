# -*- coding: utf-8 -*-
"""
Created on Wed Jul 22 17:23:50 2020
 
Upper Confidence Bound (UCB)
 

@author: David Andrade / @Bits2Matter
"""

import numpy as np 
import matplotlib as plt
import pandas as pd 

# Read dataset 
dataset = pd.read_csv("Ads_CTR_Optimisation.csv")


# UCB algorithm
import math
N = 10000
d = 10
number_selections = [0] * d 
sums_rewards = [0] * d
ads_selected = []
total_reward = 0
for n in range(0, N):
    max_upper_bound = 0
    ad = 0
    for i in range(0, d):
        if(number_selections[i] > 0):
            
            mean_reward = sums_rewards[i] / number_selections[i]
            delta_i = math.sqrt(3/2 * math.log(n+1) / number_selections[i])
            upper_bound = mean_reward + delta_i
        else:
            upper_bound = 1e400
            
        if (upper_bound > max_upper_bound):
            max_upper_bound = upper_bound
            ad = i 
            
    ads_selected.append(ad)
    number_selections[ad] = number_selections[ad] + 1
    reward = dataset.values[n, ad] 
    sums_rewards[ad] = sums_rewards[ad] + reward
    total_reward = total_reward + reward



# Vis results - hist
plt.hist(ads_selected)
plt.title("Hist of ads selections")
plt.xlabel("Ads")
plt.ylabel(" # of times each ad was selected")
plt.show()


# Thats better     