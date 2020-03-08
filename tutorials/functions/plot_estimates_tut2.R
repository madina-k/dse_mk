plot_estimates_tut2 <- function(data){
  data %>%
    ggplot(aes(x = estimate)) +
    geom_density() +
    geom_vline(xintercept = 1, linetype = "dashed", color = "red")
}
