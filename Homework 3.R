# 20
# a
print(mean(replicate(10000, {
  sum(sample(1:6, 2, replace=TRUE)) == 10
})))
# b
print(mean(replicate(10000, {
  sum(sample(1:6, 2, replace=TRUE)) >= 10
})))
# c
print(mean(replicate(10000, {
  d <- 0
  while (d < 10) {
    d <- sum(sample(1:6, 2, replace=TRUE))
  }
  d == 10
})))

# 21
# a
print(mean(replicate(10000, {
  sum(sample(1:6, 2)) == 10
})))
# b
print(mean(replicate(10000, {
  sum(sample(1:6, 2)) >= 10
})))
# c
print(mean(replicate(10000, {
  d <- 0
  while (d < 10) {
    d <- sum(sample(1:6, 2))
  }
  d == 10
})))

# 22
# a
# A & D, C & D
# b
# A & B, A & C, B & C, B & D
# C
# None

# 1
# a
X <- sample(0:3, 1, prob=c(1/4, 1/2, 1/8, 1/8))
# b
print(mean(replicate(10000, {
  sample(0:3, 1, prob=c(1/4, 1/2, 1/8, 1/8)) >= 2
})))
# c
print(mean(replicate(10000, {
  x <- sample(0:3, 1, prob=c(1/4, 1/2, 1/8, 1/8)) 
  x >= 1 | x >= 2
})))
# d
print(mean(replicate(10000, {
  x <- sample(0:3, 1, prob=c(1/4, 1/2, 1/8, 1/8)) 
  x >= 1 & x >= 2
})))
# 2
# a
print(mean(replicate(10000, {
  sample(0:3, 1, prob=c(1/4, 1/2, 1/8, 1/8)) == 1
})))
# b
print(table(replicate(10000, {
  sample(0:3, 1, prob=c(1/4, 1/2, 1/8, 1/8))
}))/10000)

# 5
print(mean(replicate(10000, {
  sample(0:3, 1, prob=c(1/4, 1/2, 1/8, 1/8))
})))

# 8
print(mean(replicate(10000, {prod(sample(1:3, 2))})))

# 10
# a
print(table(replicate(10000/2, {
  1 %in% sample(0:1, 2, replace=TRUE, prob=c(0.95, 0.05))
}))/10000)
# b
# run 1 test for 2 people and then a test for each if there is a positive
X <- mean(replicate(10000/2, {
  1 %in% sample(0:1, 2, replace=TRUE, prob=c(0.95, 0.05))
})*2)
# c
# run 1 test for 3 people and then a test for each if there is a positive
Y <- mean(replicate(10000/3, {
  1 %in% sample(0:1, 3, replace=TRUE, prob=c(0.95, 0.05))
})*3)
# d
# Second method