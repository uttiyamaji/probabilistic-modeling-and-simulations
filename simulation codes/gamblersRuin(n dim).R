# problem statement: Consider a gambling situation in which there are r players, with player i
# initially having ni units, ni>0,i=1:r. At each stage, two of the players are chosen to play
# a game, with the winner of the game receiving 1 unit from the loser.Any player whose fortune
# drops to 0 is eliminated, and this continues until a single player has all N units.Assuming that
# the results of successive matches are independent and that each match is equally likely to be
# won by any of its two palyers, find the expected no of stages until one of the players has all the
# wealth.


# N: total wealth
# r: no. of players

Gamblers_Ruin=function(N,r){

#InitialStakeAllocation
players=1:r
stakes=rep(0,r)
stakes[-r]=floor(N*diff(c(0,sort(runif(r-2)),1)))
stakes[r]=N-sum(stake)

# Game play
stage=1
while(T){
 eliminated=which(stakes==0)
 if(sum(eliminated)!=0){
  players=players[-eliminated]
  stakes=stakes[-eliminated]
 }
 if(length(players)>=2){
   player=sample(players,2,replace=F)
   toss=sample(c(0,1),1)
   if(toss==0){
     stakes[which(players==player[1])]=stakes[which(players==player[1])]+1
     stakes[which(players==player[2])]=stakes[which(players==player[2])]-1
   } else{
     stakes[which(players==player[1])]=stakes[which(players==player[1])]-1
     stakes[which(players==player[2])]=stakes[which(players==player[2])]+1
   }
 } else break  
 if(any(stakes==N)) break
 stage=stage+1
 
}

stage
}








