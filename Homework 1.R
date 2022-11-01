# 1.3
vec <- 1:10
# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
vec <- 1:10 * 2
# [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
vec <- 1:10^2
# [1, 2, ..., 99, 100]
vec <- 1:10 + 1
# [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
vec <- 1:(10 * 2)
# [1, 2, ..., 19, 20]
vec <- rep(c(1,1,2), times = 2)
# [1, 1, 2, 1, 1, 2]
vec <- seq(from = 0, to = 10, length.out = 5)
# [0, 2.5, 5, 7.5, 10]

# 1.4
p <- seq(from=0, to=1, by=0.2)
plot(p, p*(1-p))

p <- seq(from=0, to=1, by=0.01)
plot(p, p*(1-p))

# 1.5
print(sum((1:100)^2))

# 1.7
mean(rivers)
sd(rivers)
hist(rivers)
summary(rivers)
max(rivers)
min(rivers)
rivers
rivers[rivers > 1000]


# 1.11
mtcars$am <- factor(mtcars$am, levels = c(0, 1), labels = c("auto", "manual"))
length(mtcars$am[mtcars$am == "auto"])
length(mtcars$am[mtcars$am == "manual"])
length(mtcars$am[mtcars$am == "auto" & mtcars$mpg > 25])
length(mtcars$am[mtcars$am == "manual" & mtcars$mpg > 25])

# 1.12
hot_dogs <- fosdata::hot_dogs
length(hot_dogs$type)
typeof(hot_dogs$type)
typeof(hot_dogs$calories)
typeof(hot_dogs$sodium)
# Beef, Meat, Poultry
max(hot_dogs$sodium)
mean(hot_dogs$calories[hot_dogs$type == "Beef"])
