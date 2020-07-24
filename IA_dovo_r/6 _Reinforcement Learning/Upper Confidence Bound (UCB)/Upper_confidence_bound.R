# Created on Wed Jul 22 17:23:50 2020
 
# Upper Confidence Bound (UCB)
# author: David Andrade / @Bits2Matter


dataset = read.csv("Ads_CTR_Optimisation.csv")


N = 10000
d = 10 
number_selections = integer(d)
sums_rewards = integer(d)
ads_selected = integer(0)
total_reward = 0

for(n in 1:N){
  max_upper_bound = 0
  ad = 0
  
  for (i in 1:d) {
    
    if(number_selections[i] > 0){
      mean_rewards = sums_rewards[i] / number_selections[i]
      delta_i = sqrt(3/2 * log(n) / number_selections[i])
      upper_bound = mean_rewards + delta_i
    }else{
      upper_bound = 1e400
    }
    
    if(upper_bound > max_upper_bound){
      max_upper_bound = upper_bound
      ad = i 
    }
    
  }
  ads_selected = append(ads_selected, ad)
  number_selections[ad] = number_selections[ad] + 1
  reward = dataset[n, ad]
  sums_rewards[ad] = sums_rewards[ad] + reward
  total_reward = total_reward + reward 
}

# Data vis hist 
hist(ads_selected,
     col = 'blue',
     main = 'Histogram of ads selections',
     xlab = 'Ads',
     ylab = 'Number of times each ad was selected')

# Better
