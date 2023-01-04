library(dplyr)
library(ggplot2)

# 1
table(fosdata::chimps$population)
# n1 = 43, n2 = 75, n3 = 47
fosdata::chimps %>% 
  group_by(population) %>% 
  summarize(mean(grey_score_avg))


# 2
# DoF = 2
# F = k-1 & N-k = 2 & 27


# 3
three_groups <- data.frame(
  group = rep(1:4, times = c(25, 25, 25, 25)),
  value = rnorm(100, 1, 2)
)
k <- 4
N <- 60
three_groups$group <- factor(three_groups$group)
sim_data <- replicate(1000, {
  three_groups <- data.frame(
    group = rep(1:3, times = c(10, 20, 30)),
    value = rnorm(60, 0, 1)
  )
  three_groups$group <- factor(three_groups$group)
  aov.mod <- anova(lm(value ~ group, data = three_groups))
  aov.mod$`F value`[1]
})
plot(density(sim_data),
     main = "F test statistic"
)
curve(df(x, k-1, N-k), add = T, col = 2)


# 4
anova(lm(mean300 ~ factor(age), data=fosdata::weight_estimate))


# 9
# a
InsectSprays %>% 
  group_by(spray) %>% 
  ggplot(aes(x=spray, y=count)) + 
  geom_boxplot()
# C, D, E

# B
oneway.test(count ~ spray, data=InsectSprays %>% filter(spray=='C' | spray=='D' | spray == 'E'))
# The data has a low p-value and errors are unlikely

# C
oneway.test(count ~ spray, data=InsectSprays %>% filter(spray=='A' | spray=='B' | spray == 'F'))
# The data has a higher p-value and erros are more likely

# d
# No, because the means are quite different

# e
oneway.test(count ~ spray, data=InsectSprays)
# We fail to reject the null hypothesis


# 12
mean(replicate(10000, {
  three_groups <- data.frame(
    group = factor(rep(1:4, times = c(20, 20, 20, 100))),
    values = rnorm(160, 0, rep(c(1, 1, 1, 2), times = c(20, 20, 20, 100)))
  )
  anova(lm(values ~ group, data = three_groups))$`Pr(>F)`[1] < 0.05
}))
