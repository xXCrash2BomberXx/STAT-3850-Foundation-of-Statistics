library(dplyr)
library(ggplot2)
# 8.1
data <- replicate(10000, (mean(rnorm(12, 1, 3))-1)/(3/sqrt(12)))
plot(density(data))

data <- sort(rnorm(10000, 1, 3))
lines(data, dt(data, df=11), lwd=1, col=4)

lines(density(rnorm(10000, 1, 3)), col=2)

# 8.3
k <- 0.369
mean(replicate(100000, {
  data <- dt(rnorm(1), df=6)
  -k < data & data < k
}))

# 8.6
data <- filter(fosdata::plastics, !is.na(length))
xbar <- mean(data$length)
s <- sd(data$length)
lower_ci <- xbar - s / sqrt(130) * qt(0.99, df = 235-1)
upper_ci <- xbar + s / sqrt(130) * qt(0.99, df = 235-1)

# 8.7
xbar <- mean(morley$Speed)
s <- sd(morley$Speed)
lower_ci <- xbar - s / sqrt(130) * qt(0.95, df = 100-1)
upper_ci <- xbar + s / sqrt(130) * qt(0.95, df = 100-1)
# No

# 8.15
(mean(fosdata::weight_estimate$mean100)-100)/(sd(fosdata::weight_estimate$mean100)/sqrt(80))
(mean(fosdata::weight_estimate$mean200)-200)/(sd(fosdata::weight_estimate$mean200)/sqrt(80))
(mean(fosdata::weight_estimate$mean300)-300)/(sd(fosdata::weight_estimate$mean300)/sqrt(80))
(mean(fosdata::weight_estimate$mean400)-400)/(sd(fosdata::weight_estimate$mean400)/sqrt(80))
# All except the 200 g weights were quite significant

# 8.17
mean(ISwR::bp.obese$obese)
sd(ISwR::bp.obese$obese)/sqrt(102)
# Yes, the bp.obese obesity leves show a mean of 1.313039 while the gap between the null hypothesis is only 0.02552983.
# This is caused due to substantial outliars with some reaching as high as 2x what the expected value is.

# 8.23
# a
data <- rexp(10, rate=1/4)
xbar <- mean(data)
s <- sd(data)
lower_ci <- xbar - s / sqrt(130) * qt(0.95, df = 100-1)
upper_ci <- xbar + s / sqrt(130) * qt(0.95, df = 100-1)
# No
# b
mean(replicate(10000, {
  data <- rexp(10, rate=1/4)
  xbar <- mean(data)
  s <- sd(data)
  lower_ci <- xbar - s / sqrt(130) * qt(0.95, df = 100-1)
  upper_ci <- xbar + s / sqrt(130) * qt(0.95, df = 100-1)
  lower_ci <= 4 & upper_ci >= 4
}))
# Exponential distributions are not the same as linear for probability
# c
mean(replicate(10000, {
  data <- rexp(100, rate=1/4)
  xbar <- mean(data)
  s <- sd(data)
  lower_ci <- xbar - s / sqrt(130) * qt(0.95, df = 100-1)
  upper_ci <- xbar + s / sqrt(130) * qt(0.95, df = 100-1)
  lower_ci <= 4 & upper_ci >= 4
}))
# More values to test against gives more accurate results and more opportunity for the value to be true

# 8.27
data <- fosdata::chimps %>% 
  group_by(subspecies) %>% 
  summarize(mean=mean(grey_score_avg), count=n(), sd=sd(grey_score_avg))
(data$mean[1]-data$mean[2])/sqrt((data$sd[1]^2)/data$count[1]+(data$sd[2]^2)/data$count[2])
t.test(grey_score_avg ~ subspecies, data=fosdata::chimps, mu=mean(fosdata::chimps$grey_score_avg))$p.value < 0.05
# Yes

# 8.36
t.test(day_night_completion_time_secs ~ gender, fosdata::child_tasks, mu=mean(fosdata::child_tasks$day_night_completion_time_secs))$p.value < 0.01
# Yes

# 8.43
power.t.test(delta=1, sd=0.73, power=0.99, sig.level=0.05)$n
