# 4.8
X <- sum(sample(-1:2, 2, replace=TRUE))
# a
mean(replicate(10000, {
  sum(sample(-1:2, 2, replace=TRUE))
}))
# b
sd(replicate(10000, {
  sum(sample(-1:2, 2, replace=TRUE))
}))
# c
print(mean(replicate(10000, {
  sum(sample(-1:2, 2, replace=TRUE))
}))-2/2)
# d
print(mean(replicate(10000, {
  X <- sum(sample(-1:2, 2, replace=TRUE))
  return(0 <= X && X <= 2)
})))

# 4.10
X <- rnorm(1, 1, 2)
# a
print(mean(replicate(10000, {
  X <- rnorm(1, 1, 2)
  return (3 <= X && X <= 3+2)
})))
# b
tbl <- table(round(replicate(10000, {
  rnorm(1, 1, 2)
})))
plot(tbl, type="l")
lines(c(3, 3+2), rep(max(tbl), 2), type="h")
# c
print(mean(replicate(10000, {
  rnorm(1, 1, 2)
}))-2/2)

# 4.12
# a
plot(table(round(rnorm(10000, 5036, 122), -2))/10000, type="l")
# b
print(pnorm(5000, 5036, 122))
# c
print(qnorm(0.95, 5036, 122))

# 4.17
X <- qexp(1/4)
# a
print(mean(replicate(10000, qexp(1/4))))
# b
a <- mean(replicate(10000, qexp(1/4)))-1/2 # yes
