#Problem statement:

#Suppose that there are N types of coupons, and each time one obtains a coupon,it is equally likely to be any one 
#of the N types.Find the expected no. of coupons one needs to amass before obtaining a complete set of at least one of each type.

# we create a function that takes up the arguments 
# N: no. of distinct elements in the population
# n: no. of times the exp. is repeated
# and it calculates the no.of draws required in each of the n repititions

no_draws=function(N,n){
  ndraws=rep(0,n)    # no. of draws corresponding to n different repetitions
  for(k in 1:n){
    sample=rep(0,N)  # the sample drawn WR
    ndraws[k]=1
    draw=sample(1:N,1) 
    sample[1]=draw
    i=2
    while (sum(sample!=0)!=N) {  # checks whether the sample contains all the distinct elements
      draw=sample(1:N,1)
      if(!(draw %in% sample)) {
        sample[i]=draw
        i=i+1
      }
      ndraws[k]=ndraws[k]+1
    }
    ndraws[k]
  }
  ndraws
}

# this function calculates the sample mean, which is an unbiased estimator of the desired expected value.
sample_mean=function(N,n){
  y=no_draws(N,n)
  mean(y)
}