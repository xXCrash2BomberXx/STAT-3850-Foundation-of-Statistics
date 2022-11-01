# 1
P <- vector()
for (i in 1:10000) {
  P <- append(P, sum(sample(c(rep(0, 20), rep(1, 20)), 4)) %in% c(0, 4))
}
P <- mean(P)

# 2
P <- vector()
for (i in 1:10000) {
  temp <- sample(c(rep('Peyton', 60), rep('Riley', 50)), 110)
  for (t in 1:110) {
    if (!("Riley" %in% temp[1:t])) {
      P <- append(P, TRUE)
      break
    }
    if (!("Peyton" %in% temp[1:t])) {
      P <- append(P, FALSE)
      break
    }
    if ((table(temp[1:t])["Peyton"]) < (table(temp[1:t])["Riley"])) {
      P <- append(P, FALSE)
      break
    }
    if (t==110) {
      P <- append(P, TRUE)
    }
  }
}
P <- mean(P)

# 3
S <- 1:6
E <- sample(S, 2)
P <- vector()
for (i in 1:10000) {
  P <- append(P, sum(sample(S, 2))==4)
}
P <- mean(P)
F <- sample(S, 2)
F <- max(F)-min(F)==0
P <- vector
P <- mean(abs(sample(S, 10000, replace=TRUE)-sample(S, 10000, replace=TRUE))==0)

# 8
P <- mean(sample(1:6, 10000, replace=TRUE)+sample(1:6, 10000, replace=TRUE)==10)

# 9
P <- mean(sample(0:1, 10000, replace=TRUE)+sample(0:1, 10000, replace=TRUE)+sample(0:1, 10000, replace=TRUE)+
            sample(0:1, 10000, replace=TRUE)+sample(0:1, 10000, replace=TRUE)+sample(0:1, 10000, replace=TRUE)+
            sample(0:1, 10000, replace=TRUE)==3)

# 11
P <- vector()
for (i in 1:10000) {
  P <- append(P, 20 %in% cumsum(sample(1:6, 20, replace=TRUE)))
}
P <- mean(P)

# 15
P <- vector()
for (i in 1:10000) {
  P <- append(P, TRUE %in% (table(sample(1:365, 50, replace=TRUE)) >= 3))
}
P <- mean(P)