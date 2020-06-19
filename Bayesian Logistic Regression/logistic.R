set.seed(123)

dat <- read.table("http://home.iitk.ac.in/~dootika/assets/course/Log_data/181164.txt",header = F)

n=dim(dat)[1]
p=dim(dat)[2]-1

X=as.matrix(dat[,-1])
y=dat$V1

# function to calculate the log-posterior probabilities 
log.post=function(y,X,beta)-sum(beta^2)/200+sum(y*X%*%beta-log(1+exp(X%*%beta)))

# function to draw samples from the posterior distribuion of beta using metropolis hastings algorithm
# h can be given as a vector for different values of h for diffferent components
mcmc=function(y,X,T=1e3,start,h){
  
  beta=matrix(0,nrow=T,ncol=p) 
  
  beta[1,]=start
  
  acc=0
  for(t in 2:T){
    prop=c(beta[t-1,])+rnorm(p,sd=sqrt(h)) # proposal
    
    ratio=log.post(y,X,prop)-log.post(y,X,beta[t-1,]) 
    
    if(runif(1)<exp(ratio)){
      acc=acc+1
      beta[t,]=prop
    }else
      beta[t,]=beta[t-1,]
  }
  print(paste("Acceptance prob= ",acc/T))
  outp=list('acc.prob'=acc/T,'beta'=beta) # storing the acceptance prob and estimates 
  return(outp)
}

# starting values can be chosen using MLEs
glm.obj=glm(as.factor(V1)~.-1,dat,family='binomial')
print(glm.obj$coefficients)

# calculates the MH estimates
chain_all=mcmc(y,X,T=1e5,start=glm.obj$coefficients,h=0.15) # this choice of h is giving desirable acceptance probability
# it contains the samples and acceptance probability

# calculating the posterior means and quantiles for each beta
post.mean=apply(chain_all$beta,2,mean) 
post.quant1=apply(chain_all$beta,2,quantile,0.25)
post.quant2=apply(chain_all$beta,2,quantile,0.75)


# plotting the acfs for each beta
for(i in 1:5)acf(chain_all$beta[,i],main=paste0('beta',i),lag.max=100)

# plotting the marginal densities of beta1 and beta5

plot(density(chain_all$beta[,1]),main='Marginal density of beta1',xlab='beta1')
abline(v = c(post.mean[1], post.quant1[1], post.quant2[1]), col = c("red", "blue", "blue"))

plot(density(chain_all$beta[,5]),main='Marginal density of beta5',xlab='beta5')
abline(v = c(post.mean[5], post.quant1[5], post.quant2[5]), col = c("red", "blue", "blue"))


beta.est=post.mean
acc.prob=chain_all$acc.prob
chain=chain_all$beta

print(acc.prob)
print(beta.est)
