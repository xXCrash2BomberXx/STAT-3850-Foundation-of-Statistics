library(dplyr)
library(ggplot2)
# 1
wilcox.test(rnorm(30), mu=2)


# 9
fosdata::bechdel
# a
fosdata::bechdel %>% 
  ggplot(aes(x = binary, y=budget_2013)) +
  geom_boxplot()

# b
wilcox.test(budget ~ binary, data=fosdata::bechdel)$p.value

# c
# the mean difference is near zero


# 10
HistData::ZeaMays
# a
union(HistData::ZeaMays %>% 
  summarize(height=self, fertile="self"), 
HistData::ZeaMays %>% 
  summarize(height=cross, fertile="cross")) %>% 
  ggplot(aes(x = fertile, y=height)) + 
  geom_boxplot()

# b
# the mean difference is not near zero

# c
t.test(height ~ fertile, data=union(HistData::ZeaMays %>% 
        summarize(height=self, fertile="self"), 
      HistData::ZeaMays %>% 
        summarize(height=cross, fertile="cross")))


# 11
# a
union(fosdata::masks %>% 
        summarize(mask=TRUE, count=mask_fine),
      fosdata::masks %>% 
        summarize(mask=FALSE, count=no_mask_fine)) %>% 
  ggplot(aes(x=mask, y=count)) + 
  geom_boxplot()

# b
t.test(fosdata::masks$mask_fine, fosdata::masks$no_mask_fine)
# yes

# c
wilcox.test(fosdata::masks$mask_fine, fosdata::masks$no_mask_fine)
# no


# 17
mean(replicate(10000, t.test(runif(30, min=-0.5, max=1))$p.value))
mean(replicate(10000, wilcox.test(runif(30, min=-0.5, max=1))$p.value))

# 22
fosdata::movies
sensible_movies <- fosdata::movies %>%
  filter(movieId == 339 | movieId == 539) %>%  
  group_by(userId) %>% 
  mutate(N = n()) %>% 
  filter(N == 1)
# a
wilcox.test(rating ~ title, data = sensible_movies)
# because the p-value is greater than the alpha-value, we should not reject the NULL hypothesis
# yes, there is sufficient evidence

# b
effsize::VD.A(rating ~ title, data=sensible_movies)


# 23
fosdata::sharks
# a
wilcox.test(vicious ~ music, data=fosdata::sharks %>% 
  filter(av == "video" & (music == "ominous" | music == "uplifting")))
# because the p-value is less than the alpha-value, we should reject the NULL hypothesis
# no, there is not sufficient evidence

# b
# N/A

