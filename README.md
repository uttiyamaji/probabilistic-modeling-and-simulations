# Estimating the mortality rate of COVID 19 in India using Empirical bayes 

## Beta - binomial models for rate for each state


# Some well known probability problems solved using simulations

## Problem 1: Banach Matchbox Problem
A person carries two matchboxes at all times: one in his left pocket and one in
his right.Each time he needs a match, he is equally likely to take it from 
either pocket.Suppose he reaches into his pocket and discovers for the first 
time that the box picked is empty. If it is assumed that each of the matchboxes
originally contained N matches, what is the probability that there are exactly
k matches in the other box?

## Problem 2: Coupon Collecting problem
Suppose that there are N types of coupons, and each time one obtains a coupon,it is equally likely to be any one of the N types.Find the expected no. of coupons one needs to amass before obtaining a complete set of at least one of each type.

## Problem 3: Gambler's Ruin (n dimensional)
Consider a gambling situation in which there are r players, with player i
initially having ni units, ni>0,i=1:r. At each stage, two of the players are chosen to play
a game, with the winner of the game receiving 1 unit from the loser.Any player whose fortune
drops to 0 is eliminated, and this continues until a single player has all N units.Assuming that
the results of successive matches are independent and that each match is equally likely to be
won by any of its two palyers, find the expected no of stages until one of the players has all the
wealth.

## Problem 4: Tourist with short memory
A tourist wants to visit N cities. He travels first to one city
chosen at random. If he selects A, he next time chooses between B,C,D,...etc(all except A)with the 
same probability. If he then selects B, next time chooses between A,C,D,...etc(all except B). His 
memory is so short that he forgets that he has already visited A. Next time he 
chooses again between others capitals, and so on. Find the expected no. of 
journeys required to visit all the cities.

# Studying curse of Dimensionality
## (a) 
Draw a sample of size 20 from Nd(0d; Id), and compute the length of each of the
vectors. Estimate the distribution using a kernel density estimate with an adaptive choice
of h, and plot it for d = 2; 5; 10; 20; 50; 100; 200 and 500. Is the mean 0d a representative
summary of the distribution in high dimensions?
## (b) 
Consider a sample of size 3 from Nd(0d; Id), say X1, X2 and X3. Take d =
2; 5; 10; 20; 50; 100; 200 and 500. Compute the angle \(Xi;Xj) for 1  i < j  3. Make a
table of each of these values.
## (c)
Consider a training sample of size 20 by generating 10 observations from f1, and
10 observations from f2. Take d = 2; 5; 10; 20; 50; 100; 200 and 500. Compute the mis-
classication rate for 1NN, kernel discriminant analysis, SVM with linear and radial basis
function kernels and the Bayes' classier, and plot them w.r.t. d for the following proba-
bility distributions:
#### 1. Nd(0_{d}; I_{d}) and Nd((1, 0_{d-1}) ; 1/4Id).
#### 2. Nd(0_{d}; I_{d}) and Nd(1_{d}; 1/4I_{d}).
#### 3. Nd(0_{d}; I_{d}) and Nd(0d; 1/4I_{d}).
