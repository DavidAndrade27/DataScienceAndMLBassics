# -*- coding: utf-8 -*-
"""
Created on Sat Jul 25 21:18:00 2020
Thompson sampling 

@author: David Andrade / @Bits2Matter
"""


import numpy as np 
import matplotlib.pyplot as plt
import pandas as pd 

# Read dataset 
dataset = pd.read_csv("Ads_CTR_Optimisation.csv")


# Thompson sampling algorithm 
import random
N = 10000
d = 10

number_rewards_1 = [0] * d
number_rewards_0 = [0] * d 
ads_selected = []
total_reward = 0
for n in range(0, N):
    max_random = 0
    ad = 0
    for i in range(0, d):
        random_betha = random.betavariate(number_rewards_1[i] + 1, number_rewards_0[i] + 1)
            
        if random_betha > max_random:
            max_random = random_betha
            ad = i 
            
    ads_selected.append(ad)
    reward = dataset.values[n, ad] 
    if reward == 1:
        number_rewards_1[ad] = number_rewards_1[ad] + 1 
    else:
        number_rewards_0[ad] = number_rewards_0[ad] + 1
    total_reward = total_reward + reward


# Data vis
plt.hist(ads_selected)
plt.title("Hist of ads selections")
plt.xlabel("Ads")
plt.ylabel(" # of times each ad was selected")
plt.show()
