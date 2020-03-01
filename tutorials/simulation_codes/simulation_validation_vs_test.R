pacman::p_load(tidyverse)
set.seed(12134)
simdata <- tibble(MSE1 = rnorm(n = 1000, mean = 5, sd = 1),
       MSE2 = rnorm(n = 1000, mean = 5, sd = 1)) %>%
  rowwise() %>%
  mutate(minMSE = min(MSE1, MSE2))
simdata %>% head()
simdata %>%
gather(key, value) %>%
  ggplot(aes(x = value, color = key)) + geom_density()

ggsave("../lectures/figures/sim_MSE.pdf", width = 8, height = 6, units = "cm")

