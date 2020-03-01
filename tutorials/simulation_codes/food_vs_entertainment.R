pacman::p_load(tidyverse)
set.seed(911)

# Simulate data
train <- tibble(food = rnorm(20, 400, 80)) %>%
          mutate(entertainment = 0.5*food + rnorm(20, 0, 50))
test  <- tibble(food = 500) %>%
  mutate(entertainment = 0.5*food + rnorm(1, 0, 50))

# Plot the data sample
train %>% ggplot(aes(x = food, entertainment)) +
  geom_point(size = 0.5)

ggsave("../lectures/figures/expenses_train.pdf", width = 8, height = 6, units = "cm")

# Add the true CEF
last_plot() +
  geom_abline(slope = 0.5, intercept = 0) +
  annotate(geom="text", x=600, y=295, label="Truth", colour="black",
          size=2, family="Courier",  angle=35)
ggsave("../lectures/figures/expenses_truth.pdf", width = 8, height = 6, units = "cm")

# Add linear approx
train %>% ggplot(aes(x = food, entertainment)) +
  geom_point(size = 0.5) +
  geom_smooth(method = 'lm', formula = y~x, se = FALSE, linetype = "dashed", color = "forestgreen", size = 0.5)+
  annotate(geom="text", x=600, y=235, label="linear", colour="forestgreen",
           size=2, family="Courier",  angle=15)
ggsave("../lectures/figures/expenses_lm.pdf", width = 8, height = 6, units = "cm")

# Add cubic approx
last_plot() +
  geom_smooth(method='lm', formula = y~poly(x,3), se = FALSE, linetype = "dashed", color = "chocolate4", size = 0.5) +
  annotate(geom="text", x=600, y=260, label="cubic", colour="chocolate4",
           size=2, family="Courier",  angle=0)
ggsave("../lectures/figures/expenses_cube.pdf", width = 8, height = 6, units = "cm")

# Add new observation
last_plot() +
  geom_abline(slope = 0.5, intercept = 0) +
  annotate(geom = "text", x=600, y=295, label="Truth", colour="black",
           size = 2, family="Courier",  angle=35) +
  geom_point(aes(x = food, entertainment), data = test, color = "red", size = 0.5) +
  annotate(geom = "text", x=520, y=190, label="new", colour="red",
           size=2, family="Courier",  angle=0)
ggsave("../lectures/figures/expenses_new.pdf", width = 8, height = 6, units = "cm")

# Create nine different samples
iter <- 9
train <- tibble(food = rnorm(20*iter, 400, 80), sample = rep(1:iter, each=20)) %>%
  mutate(entertainment = 0.5*food + rnorm(20*iter, 0, 50))

# Plot samples and cubic approx for each of them
train %>% ggplot(aes(x = food, entertainment)) +
  geom_point(size = 0.1) +
  geom_smooth(method ='lm', formula = y~poly(x,3), se = FALSE, linetype = "dashed", color = "chocolate4", size = 0.5) +
  facet_wrap(.~sample, nrow = 3, ncol = 3)
ggsave("../lectures/figures/expenses_samples.pdf", width = 8, height = 6, units = "cm")
ggsave("../lectures/figures/expenses_samples.png", width = 8, height = 6, units = "cm", scale = 2)





