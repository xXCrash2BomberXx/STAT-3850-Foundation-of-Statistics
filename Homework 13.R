library(dplyr)
library(ggplot2)

# Chapter 10
# 1
data <- fosdata::cern %>% 
  group_by(platform, type) %>% 
  mutate(count = n()) %>% 
  mutate(platform = c("Facebook", "Google+", "Instagram", "Twitter French", "Twitter English")[
    match(platform, c("Facebook", "Google+", "Instagra", "Tw Frenc", "Twitter"))
  ]) %>% 
  summarize(platform, type, count) %>% 
  distinct()

data$platform <- factor(data$platform, levels=c("Facebook", "Twitter English", "Twitter French", "Google+", "Instagram"))
data$type <- factor(data$type, levels=c("News", "GWII", "TBT", "Wow"))
xtabs(count~type+platform, data=data) %>% 
  addmargins()
  

# 5
prop.test(5935, 11252, 0.5)$p.value  # 6.005131e-09
# Yes


# 6
# a
binom.test(20245, 40000, conf.level=0.99)$conf.int

# b
# null: p > 0.5 alternative: p <= 0.5
binom.test(20245, 40000, conf.level=0.99)$estimate > 0.5

# c
# yes
binom.test(20245, 40000, conf.level=0.99)$p.value  # 0.0144842


# 10
# 1357/10000 = 0.1357
# 1321/10000 = 0.1321
# 1946/10000 = 0.1946
# 1182/10000 = 0.1182
# 2052/10000 = 0.2052
# 2142/10000 = 0.2142
# yes
chisq.test(c(1357, 1232, 1946, 1182, 2052, 2142), p=c(0.14, 0.13, 0.20, 0.12, 0.20, 0.21))$p.value
# The distribution is accurate at a=0.05


# 13
goals <- fosdata::world_cup %>%
  filter(competition == "2014 FIFA Men's World Cup") %>% 
  tidyr::pivot_longer(cols = contains("score"), values_to = "score") %>%
  pull(score)
table(goals)
lambda <- mean(goals)
expected_goals <- 104 * c(
  dpois(0:3, lambda),
  ppois(3, lambda, lower.tail = FALSE)
)
observed_goals <- c(37, 44, 27, 12, 8)
chi_2 <- sum((observed_goals - expected_goals)^2 / expected_goals)
pchisq(chi_2, df = 3, lower.tail = FALSE)
# Yes


# 18
# a
prop.test(162, 162+138, 0.5)$conf.int

# b
# null: p > 0.5 alternative: p <= 0.5
prop.test(162, 162+138, 0.5)$estimate > 0.5

# c
# no
prop.test(162, 162+138, 0.5)$p.value  # 0.1842093

# d
p1 <- 162/(162+138)
p2 <- 175/(175+125)
n1 <- 162+138
n2 <- 175+125
data_ccorrected <- replicate(10000, {
  x1 <- rbinom(1, n1, p1)
  x2 <- rbinom(1, n2, p2)
  prop.test(c(x1, x2), c(n1, n2), correct = TRUE)$p.value
})
data_not_ccorrected <- replicate(10000, {
  x1 <- rbinom(1, n1, p1)
  x2 <- rbinom(1, n2, p2)
  prop.test(c(x1, x2), c(n1, n2), correct = FALSE)$p.value
})

mean(data_ccorrected < .05)
mean(data_not_ccorrected < .05)
# No


# 22
p1 <- 43/48
p2 <- 12/44
n1 <- 48
n2 <- 12
data_ccorrected <- replicate(10000, {
  x1 <- rbinom(1, n1, p1)
  x2 <- rbinom(1, n2, p2)
  prop.test(c(x1, x2), c(n1, n2), correct = TRUE)$p.value
})
data_not_ccorrected <- replicate(10000, {
  x1 <- rbinom(1, n1, p1)
  x2 <- rbinom(1, n2, p2)
  prop.test(c(x1, x2), c(n1, n2), correct = FALSE)$p.value
})

mean(abs(data_ccorrected -data_not_ccorrected) < .05)


# Chapter 13
# 1
# a
fit_vat = lm(vat ~ waist_cm, data = fosdata::adipose)
summary(fit_vat)
layout(matrix(1:4, 2, 2))
plot( fit_vat )

fit_vat = lm(vat ~ stature_cm, data = fosdata::adipose)
summary(fit_vat)
layout(matrix(1:4, 2, 2))
plot( fit_vat )

# b
fit_vat = lm(log(vat) ~ waist_cm, data = fosdata::adipose)
summary(fit_vat)
layout(matrix(1:4, 2, 2))
plot( fit_vat )

fit_vat = lm(log(vat) ~ stature_cm, data = fosdata::adipose)
summary(fit_vat)
layout(matrix(1:4, 2, 2))
plot( fit_vat )

# c
# Overall, the difference seems mostly negligible but the log seems slightly better

# 8
# a
palmerpenguins::penguins %>% 
  filter(!is.na(body_mass_g) & !is.na(flipper_length_mm)) %>% 
  ggplot(aes(x=body_mass_g, y=flipper_length_mm, group=species)) + 
  geom_point(aes(col=species)) + 
  geom_smooth(aes(col=species), method=lm)

# b
summary(lm(body_mass_g ~ flipper_length_mm + species+flipper_length_mm:species, data=palmerpenguins::penguins))

# c
# The summary shows significant influence in the species of the penguin in the body mass and the plot shows this same statistic


# 11
# a
converse <- fosdata::conversation %>% 
  summarize(proportion_words, gender, f1_psychopathy, f2_psychopathy, total_psychopathy, attractiveness, fighting_ability, strength, height, median_income, highest_class_rank, major_presige, dyad_status_difference)

mod <- lm(proportion_words ~ ., data=converse)

summary(MASS::stepAIC(mod, trace=FALSE))
# b
# About 22% of the variance in the proportion of words spoken is explained by the explanatory variables
