



# Stat 6401

# Example 1.4.19
# Newton-Pepys problem

B = 1000000  # number of replications of the experiment

# A : At least one 6 appears when 6 fair dice are rolled.

n = 6  # number of dice

k = 1  # number of time 6 appears in the n dice

r = replicate(B,sum(sample(1:6, n, replace = TRUE) == 6))

sum(r >= k)/B  # estimate probability

# B : At least two 6's appears when 12 fair dice are rolled.

n = 12  # number of dice

k = 2  # number of time 6 appears in the n dice

r = replicate(B,sum(sample(1:6, n, replace = TRUE) == 6))

sum(r >= k)/B  # estimate probability

# C : At least two 6's appears when 18 fair dice are rolled.

n = 18  # number of dice

k = 3  # number of time 6 appears in the n dice

r = replicate(B,sum(sample(1:6, n, replace = TRUE) == 6))

sum(r >= k)/B  # estimate probability

####################################################################################
# using loop

#start time
strt<-Sys.time()

games = 3  # number of times 6 appears

B = 1000000  # number of replications of the experiment

n = 6  # number of dice

r = numeric(games)

for(k in 1:games){
  r[k] = sum(replicate(B,sum(sample(1:6, n, replace = TRUE) == 6)) >= k)/B
}

prob.est = r
prob.est

#end time
print(Sys.time()-strt)

####################################################################################
# parallel code

#start time
strt<-Sys.time()

games = 3  # number of times 6 appears

library(foreach)
library(doParallel)
cl = makeCluster(games)
registerDoParallel(cl)

B = 1000000  # number of replications of the experiment

n = 6  # number of dice

r = numeric(games)

prob.est = foreach(k = 1:games, .combine=rbind) %dopar% {
  r[k] = sum(replicate(B,sum(sample(1:6, n*k, replace = TRUE) == 6)) >= k)/B
}

prob.est

stopCluster(cl)

#end time
print(Sys.time()-strt)

####################################################################################
# parallel code for linux or OSX

#start time
strt<-Sys.time()

games = 3  # number of times 6 appears

library(foreach)
library(doMC)
registerDoMC(games) 

B = 1000000  # number of replications of the experiment

n = 6  # number of dice

r = numeric(games)

prob.est = foreach(k = 1:games, .combine=rbind) %dopar% {
  r[k] = sum(replicate(B,sum(sample(1:6, n*k, replace = TRUE) == 6)) >= k)/B
}

prob.est

#end time
print(Sys.time()-strt)

####################################################################################
# parallel code for Windows

#start time
strt<-Sys.time()

games = 3  # number of times 6 appears

library(foreach)
library(doSNOW)

cl = makeCluster(games)

B = 1000000  # number of replications of the experiment

n = 6  # number of dice

r = numeric(games)

prob.est = foreach(k = 1:games, .combine=rbind) %dopar% {
  r[k] = sum(replicate(B,sum(sample(1:6, n*k, replace = TRUE) == 6)) >= k)/B
}

prob.est

stopCluster(cl)

#end time
print(Sys.time()-strt)

