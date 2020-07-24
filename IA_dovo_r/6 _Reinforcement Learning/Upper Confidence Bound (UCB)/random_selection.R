# Random selection 


dataset = read.csv("Ads_CTR_Optimisation.csv")

N = 10000
d = 10 
ads_selected = integer(0)
total_reward = 0

for (n in 1:N){
  ad = sample(1:10, 1)
  ads_selected = append(ads_selected, ad)
  reward = dataset[n, ad]
  total_reward = total_reward + reward
}


# Vis Hist 
hist(ads_selected, 
     col = "blue",
     main = "Hist of ads selected", 
     xlab = "Ads", 
     ylab = "Freq of each ad was showed")


# Test A-B. Not efficient 