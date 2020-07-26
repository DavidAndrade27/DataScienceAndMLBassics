# Created on 7/25/2020

# Thompson sampling 
# author: David Andrade / @Bits2Matter


dataset = read.csv("Ads_CTR_Optimisation.csv")


N = 10000
d = 10 
number_rewards_1 = integer(d)
number_rewards_0 = integer(d)
ads_selected = integer(0)
total_reward = 0

for(n in 1:N){
  max_random = 0
  ad = 0
  
  for (i in 1:d) {
    random_betha = rbeta(n = 1,
                         shape1 = number_rewards_1[i] + 1,
                         shape2 = number_rewards_0[i] + 1)
    
    if(random_betha > max_random){
      max_random = random_betha
      ad = i 
    }
    
  }
  ads_selected = append(ads_selected, ad)
  reward = dataset[n, ad]
  if (reward == 1){
    number_rewards_1[ad] = number_rewards_1[ad] + 1 
  }else{
    number_rewards_0[ad] = number_rewards_0[ad] + 1
  total_reward = total_reward + reward
  }
  
  total_reward = total_reward + reward 
}

# Data vis hist 
hist(ads_selected,
     col = 'blue',
     main = 'Histogram of ads selections',
     xlab = 'Ads',
     ylab = 'Number of times each ad was selected')



