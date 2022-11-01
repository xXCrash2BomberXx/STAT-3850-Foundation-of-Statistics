# 14
plot(density(runif(10000)+runif(10000)),
     main="Sum of two uniform rvs",
     xlab="X + Y")

# 15
# a
plot(density(replicate(10000, {max(runif(2))})),
     main="Max of two uniform rvs",
     xlab="max(X, Y)")
# b
# P(0 <= Z <= 1/3) < P(1/3 <= Z <= 2/3)

# 18
a <- mean(replicate(10000, round(max(rexp(2, rate=1/2)), 1)))-1/2

# 25
plot(density(replicate(10000, max(runif(7)))))
lines(density(rbeta(10000, shape1=6.75, shape2=1)))

# 31
# a
mean(rexp(10000, rate=10))
sd(rexp(10000, rate=10))
# b
# "If the population is moderately skewed, such as exponential or X^2, then it can take between 30-50 samples before getting a good approximation."