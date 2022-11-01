# 3.16
# a
print(mean(replicate(10000, sample(c(0,0,0,1), 20, replace=TRUE))))
# b
print(mean(replicate(10000, sum(sample(c(0,0,0,1), 20, replace=TRUE)) >= 10)))

# 3.17
# a
print(mean(replicate(10000, sum(sample(c(1, 0), 10, replace=TRUE, prob=c(0.91, 0.09))))))
# b
print(mean(replicate(10000, sum(sample(c(1, 0), 10, replace=TRUE, prob=c(0.91, 0.09))) >= 8)))

# 3.18
print(mean(replicate(10000, {
  temp <- sample(c(1, 0), 20, replace=TRUE, prob=c(0.91, 0.09));
  return(sum(temp)==19 && temp[20]==0);
})))

# 3.23
print(var(replicate(10000, sample(c(0, 1, 2, 3), 1, prob=c(1/4, 1/2, 1/8, 1/8)))))
print(sd(replicate(10000, sample(c(0, 1, 2, 3), 1, prob=c(1/4, 1/2, 1/8, 1/8)))))

# 3.27
# a
print(var(rbinom(10000, 100, 0.2 )))
print(var(rbinom(10000, 40, 0.5)))
# b
print(var(replicate(10000, rbinom(1, 100, 0.2)+rbinom(1, 40, 0.5))))
print(var(rbinom(10000, 100, 0.2 ))+var(rbinom(10000, 40, 0.5)))

# 3.32
# a
print(mean(replicate(10000, {
  return(sum(replicate(36, {
    note <- sample(1:12, 1);
    guess <- sample(1:12, 1);
    if (note == guess) {
      return(1)
    } else if (guess+1 == note || guess-1 == note) {
      return(3/4)
    } else {
      return(0)
    }
  })))
})))
# b
print(sd(replicate(10000, {
  return(sum(replicate(36, {
    note <- sample(1:12, 1);
    guess <- sample(1:12, 1);
    if (note == guess) {
      return(1)
    } else if (guess+1 == note || guess-1 == note) {
      return(3/4)
    } else {
      return(0)
    }
  })))
})))

# 3.33
# a
plot(table(rpois(10000, 3.9))/10000)
# b
print(mean(rpois(10000, 3.9)))
# c
a <- mean(rpois(10000, 3.9))-1/2
print(mean(replicate(10000, {
  X <- rpois(1, 3.9)
  return(a <= X && X <= a+1)
})))
# d
b <- mean(rpois(10000, 3.9))-1
print(mean(replicate(10000, {
  X <- rpois(1, 3.9)
  return(b <= X && X <= b+1)
})))

# 4.1
# a
print(mean(replicate(10000, runif(1)*2>= 1/2)))
# b

print(mean(replicate(10000, {
  X <- runif(1, min=1/4)
  return(X*2>= 1/2)
})))

# 4.6
# b
print(mean(replicate(10000, 3*(1-runif(1))^2)))
print(var(replicate(10000, 3*(1-runif(1))^2)))