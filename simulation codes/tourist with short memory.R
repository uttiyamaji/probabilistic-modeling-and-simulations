# problem statement:
# A tourist wants to visit N cities. He travels first to one city
# chosen at random. If he selects A, he next time chooses between B,C,D,...etc(all except A)with the 
# same probability. If he then selects B, next time chooses between A,C,D,...etc(all except B). His 
# memory is so short that he forgets that he has already visited A. Next time he 
# chooses again between others capitals, and so on. Find the expected no. of 
# journeys required to visit all the cities.



S_n=function(N,n){
 
 S=function(N){
 y=c()
 choices=1:N
 x=rep(0,N)
 i=1
 x[i]=sample(choices,1)
 y=1
 while(sum(x!=0)!=N){
   c=sample(choices[-x[i]],1)
   if(!(c %in% x)){
     x[i+1]=c
     i=i+1
   }
   y=y+1
 }
 y
 }

 z=(replicate(n,S(N)))
 z
}