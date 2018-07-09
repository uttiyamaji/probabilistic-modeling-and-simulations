# problem statement:
# A person carries two matchboxes at all times: one in his left pocket and one in
# his right.Each time he needs a match, he is equally likely to take it from 
# either pocket.Suppose he reaches into his pocket and discovers for the first 
# time that the box picked is empty. If it is assumed that each of the matchboxes
# originally contained N matches, what is the probability that there are exactly
# k matches in the other box?


# Banach_n(N,n) takes up N(no. of matches in each box) and n(#repititions)

Banach_n=function(N,n){
  
  banach=function(N){
    b1=b2=0
    i=0
    
    while(max(b1,b2)<N){
      x=sample(c(0,1),1)
      b1=b1+x
      i=i+1
      b2=i-b1
    }
    k=N-min(b1,b2)
    k
  }
  p=replicate(n,banach(N))
  p
}