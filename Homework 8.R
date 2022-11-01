library(dplyr)
library(ggplot2)
# 8
fosdata::austen %>% 
  mutate(length=nchar(word)) %>% 
  ggplot(aes(x = length)) +
  geom_bar() +
  facet_grid(novel ~ .)

# 9
fosdata::austen %>% 
  filter(novel == "Emma" & sentiment_score != 0) %>% 
  group_by(chapter) %>% 
  mutate(percentage=(n()>0)/n()*100) %>% 
  ggplot(aes(x = percentage, y = chapter)) +
  geom_point() + 
  geom_smooth()
# smooth provides a more 'mean' line than a line from point to point

# 10
fosdata::austen %>% 
  filter(novel == "Emma") %>% 
  group_by(chapter) %>% 
  summarize(mean(sentiment_score)) %>% 
  ggplot(aes(x = chapter, y = `mean(sentiment_score)`))+
  geom_col()

# 11
# a
ISwR::juul %>% 
  ggplot(aes(x = igf1, y = age)) + 
  geom_point()

# b
ISwR::juul %>% 
  ggplot(aes(x = igf1, y = age, color=tanner)) + 
  geom_point()

# c
# geom_smooth could be appropriate as it would get the mean of both and exclude significant outliars

# 30
fosdata::biomass %>% 
  mutate(to2=to) %>% 
  tidyr::separate(to2, c("day", "month")) %>% 
  mutate(day=as.numeric(day), month=as.numeric(month)) %>% 
  filter(biomass/as.numeric(lubridate::ydm(paste(year, to)) - lubridate::ydm(paste(year, from))) <= 20) %>% 
  ggplot(aes(x = month+day/30,
             y = biomass/as.numeric(lubridate::ydm(paste(year, to)) - lubridate::ydm(paste(year, from))),
             color = year)) + 
  geom_point() +
  scale_color_gradient(low = "blue", high = "orange") +
  labs(x="Month of Collection",
       y="biomass (grams/day)")

# Extra
file = file.choose()
file = haven::read_sav(file)
file %>%  
  filter(abs(duration.residuals) <= 720) %>% 
  ggplot(aes(x = diversity.party, y = abs(duration.residuals))) + 
  geom_point() + 
  geom_smooth(se = FALSE) + 
  geom_smooth(aes(y = (abs(duration.residuals)*race.white)), alpha=0.8, se = FALSE)+
  geom_smooth(aes(y = (abs(duration.residuals)*(!race.white))), alpha=0.8, se = FALSE)+
  labs(x="Political Diversity", y="Thanksgiving Dinner Duration (minutes)")
