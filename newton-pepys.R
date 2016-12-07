
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


