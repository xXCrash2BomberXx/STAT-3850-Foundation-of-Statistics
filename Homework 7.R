library(dplyr)
# 6.2
# a
dplyr::filter(tibble::as_tibble(fosdata::austen), novel=="Emma")
# b
dplyr::select(tibble::as_tibble(fosdata::austen), word, word_length, novel)
# c
dplyr::arrange(tibble::as_tibble(fosdata::austen), word_length)
# d
dplyr::slice_max(tibble::as_tibble(fosdata::austen), word_length)
# e
dplyr::summarize(tibble::as_tibble(fosdata::austen), mean(word_length))
# f
tibble::as_tibble(fosdata::austen) %>% 
  dplyr::select(word_length, sentiment_score, word) %>% 
  dplyr::distinct(word, .keep_all = TRUE)

# 6.4
# a
HistData::DrinksWages %>% 
  dplyr::group_by(class) %>% 
  dplyr::summarize(mean(wage))
# b
HistData::DrinksWages %>% 
  dplyr::filter(n >= 10) %>% 
  dplyr::group_by(trade) %>% 
  dplyr::slice_max(drinks/n) %>% 
  head(n=3)

# 6.5
# a
VGAMdata::oly12 %>% 
  dplyr::group_by(Country) %>% 
  dplyr::summarize(sum(Total)) %>% 
  dplyr::slice_max(`sum(Total)`) %>% 
  head(n=1)
# b
VGAMdata::oly12 %>% 
  dplyr::filter(Sex == "M" & dplyr::n() >= 10 & Weight != "NA") %>% 
  dplyr::group_by(Country) %>% 
  dplyr::summarize(mean(Weight)) %>% 
  dplyr::arrange(`mean(Weight)`) %>% 
  tail(n=3)

# 6.6
fosdata::movies %>% 
  dplyr::group_by(title) %>% 
  dplyr::filter(dplyr::n() >= 30) %>% 
  dplyr::summarize(mean(rating)) %>% 
  dplyr::arrange(`mean(rating)`) %>% 
  tail(n=1)

# 6.7
fosdata::movies %>% 
  dplyr::group_by(genres) %>% 
  dplyr::summarize(dplyr::n()) %>% 
  dplyr::arrange(`dplyr::n()`) %>% 
  tail(n=1)

# 6.8
fosdata::movies %>% 
  dplyr::filter(genres == "Comedy|Romance") %>% 
  dplyr::group_by(title) %>% 
  dplyr::summarize(dplyr::n(), mean(rating)) %>% 
  dplyr::filter(`dplyr::n()` >= 50) %>% 
  dplyr::arrange(`mean(rating)`) %>% 
  head(n=1)

# 6.9
fosdata::movies %>% 
  dplyr::group_by(title) %>% 
  dplyr::summarize(dplyr::n(), mean(rating)) %>% 
  dplyr::filter(`mean(rating)` >= 4) %>% 
  dplyr::arrange(`dplyr::n()`) %>% 
  tail(n=1)

# 6.10
fosdata::movies %>% 
  dplyr::group_by(userId) %>% 
  dplyr::summarize(mean(rating)) %>% 
  dplyr::arrange(`mean(rating)`) %>% 
  tail(n=1)

# 6.30
babynames::babynames %>% 
  dplyr::filter(year == 2015 & sex == "F" & n >= 1000) %>% 
  nrow()
babynames::babynames %>% 
  dplyr::filter(year == 2015 & sex == "F" & n >= 1000 & substr(name, nchar(name), nchar(name)) == "a") %>% 
  nrow() / babynames::babynames %>% 
  dplyr::filter(year == 2015 & sex == "F" & n >= 1000) %>% 
  nrow() * 100

# 6.32
phonetic <- babynames::babynames %>% 
  dplyr::filter(year == 2003) %>% 
  dplyr::mutate(phonetic = phonics::metaphone(name))
# a
phonetic %>% 
  dplyr::group_by(phonetic) %>% 
  dplyr::filter(dplyr::n() >= 2)
# b
phonetic %>% 
  dplyr::group_by(phonetic) %>% 
  dplyr::filter(dplyr::n() >= 2) %>% 
  dplyr::filter(n >= sort(n)[2])
# c
phonetic %>% 
  dplyr::group_by(phonetic) %>% 
  dplyr::filter(dplyr::n() >= 2) %>% 
  dplyr::filter(n >= sort(n)[2]) %>% 
  dplyr::group_by(phonetic) %>% 
  dplyr::summarize(sum(n), name) %>% 
  dplyr::arrange(`sum(n)`) %>% 
  tail(n=2)
# d
# same as c
# e
phonetic %>% 
  dplyr::group_by(phonetic) %>% 
  dplyr::filter(dplyr::n() >= 3) %>% 
  dplyr::filter(n >= sort(n)[3]) %>% 
  dplyr::group_by(phonetic) %>% 
  dplyr::summarize(sum(n), name) %>% 
  dplyr::arrange(`sum(n)`) %>% 
  tail(n=3)
