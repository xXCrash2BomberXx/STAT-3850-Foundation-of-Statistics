library(dplyr)
library(ggplot2)

# 2
fosdata::barnacles
# a
lm(barnacle_density ~ depth, data=fosdata::barnacles)

# b
predict(lm(barnacle_density ~ depth, data=fosdata::barnacles), 
        newdata = data.frame(depth = 30))


# 5
# a < -0.3
# b >= -0.3 && <= 0.3
# c > 0.3
# d >= -0.3 && <= 0.3


# 8
# a
x <- rnorm(100000)
x2 <- x^2
cor(x, x2)

# b
# X and X^2 are independent


# 14
# Plot 1: Yes, because it has a U-bend
# Plot 2: Yes, line is not flat
# Plot 3: No
# Plot 4: Yes, substantial outliers
# Plot 5: No
# Plot 6: Yes, the points are not evenly distributed on both sides of the line
# Plot 7: Yes, substantial outliers
# Plot 8: No


# 16
fosdata::cern %>% filter(platform == "Twitter")
# a
fosdata::cern %>% filter(platform == "Twitter") %>% 
  ggplot(aes(x=likes, y=shares)) + 
  geom_point() + 
  geom_smooth(method="lm")

# b
fosdata::cern %>% filter(platform == "Twitter") %>% 
  ggplot(aes(x=log(likes), y=log(shares))) + 
  geom_point() + 
  geom_smooth(method="lm")

# c
# The model of the logs better matches than the original


# 18
dplyr::starwars
# a
dplyr::starwars %>% 
  ggplot(aes(x=mass, y=height)) + 
  geom_point() + 
  geom_smooth(method="lm")

# b
lm(mass ~ height, data=dplyr::starwars)
# c
dplyr::starwars %>% 
  filter(!is.na(mass)) %>% 
  arrange(mass) %>% 
  slice_tail(n=1)

# d
dplyr::starwars %>% 
  filter(mass != 1358) %>% 
  ggplot(aes(x=mass, y=height)) + 
  geom_point() + 
  geom_smooth(method="lm")
# The magnitude and slope better fit the data significantly


# 20
ISwR::juul
# a
ISwR::juul %>% 
  filter(tanner == 5 & age < 20) %>% 
  ggplot(aes(x=age, y=igf1)) + 
  geom_point() + 
  geom_smooth(method="lm")
# b
predict(lm(igf1 ~ age, data=ISwR::juul %>% filter(tanner == 5 & age < 20)), data.frame(age=16), interval="confidence")


# 21
fosdata::cern %>% filter(platform == "Twitter") %>% 
  ggplot(aes(x=log(likes), y=log(shares))) + 
  geom_point() + 
  geom_smooth(method="lm")
predict(lm(shares ~ likes, data=fosdata::cern %>% filter(platform == "Twitter")), interval="confidence")


# 28
Sleuth3::ex0823
# a
Sleuth3::ex0823 %>% 
  ggplot(aes(x=Wine, y=Mortality)) + 
  geom_point()
# No

# b
# Yes, the more you drink, the lower risk you have

# c
# Yes

