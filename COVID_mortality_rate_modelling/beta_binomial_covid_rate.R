df = read.csv('covid_india.csv')

library(dplyr)
library(ggplot2)
theme_set(theme_minimal())

df = df %>%
  mutate(rate = deaths/tot)


ggplot(df[deaths != 0,],aes(x = rate))+geom_histogram(bins = 35)

# beta prior

# MLE estimation of the prior parameters

# like = function(a,b){
#   -sum(dbeta(deaths[deaths != 0]/tot[deaths != 0],a,b,log = T))
# }
# 
# library(stats4)
# m <- mle(like, start = list(a = 1, b = 1), method = "L-BFGS-B",
#          lower = c(0.0001, .1))

# method of moment estimation of the prior parameters
xbar = mean(df$rate)
svar = var(df$rate)
b = ((xbar*(1-xbar)/svar) - 1)*(1- xbar)
a = (mean(df$rate^2)*(1-mean(df$rate)))/var(df$rate) - mean(df$rate)
#b = ((mean(df$rate)*(1-mean(df$rate)))/var(df$rate)-1)*(1-mean(df$rate))


# posterior parameter estimates 

est_1 = df %>% mutate(est_rate = (deaths + a)/(tot + a + b))


est_1 %>% ggplot()+ geom_point(aes(x = rate, y = est_rate))

barplot(as.matrix(est_1[,3:4]), beside = T)

#plot()



est_1 %>%
  ggplot()+geom_histogram(aes(x = rate),bins = 40)+
  geom_density(aes(x = rate))+
  geom_density(aes(x = est_rate), col = 'red')


est_1 = est_1 %>%
  mutate(a1 = a + deaths, b1 = b + tot - deaths )


x = seq(0,0.1,0.001)


## credible intervals 
est_1 = mutate(est_1, low = qbeta(0.025, a1, b1), high = qbeta(0.975, a1,b1))

rownames(est_1) = states

which(est_1$rate > est_1$low & est_1$rate < est_1$high)


est_1$state = states

x  = seq(0,0.1,0.001)
par(mfrow = c(2,2))
for(i in 1:4){
  probs = dbeta(x, est_1$a1[i], est_1$b1[i])
  plot(x, probs, type= 'l', main = est_1$state[i])
  xticks = c(round(est_1$low[i],5),round(est_1$high[i],5))
  axis(1,at = xticks,las = 2)
  abline(v = est_1$low[i], lty = 2, col = 'red')
  abline(v = est_1$high[i], lty = 2, col = 'red')
}

