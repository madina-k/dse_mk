simulate_cvDS <- function(data){
  X <- data %>%  select(-y, -d)  %>%  as.matrix()
  lasso_coefficients_y <- get_cvLassoCoefs(X, data$y)
  lasso_selection_y <- lasso_coefficients_y$coef_names[-1]
  lasso_coefficients_x <- get_cvLassoCoefs(X, data$d)
  lasso_selection_d <- lasso_coefficients_x$coef_names[-1]
  lasso_selection_joint <- c("y", "d", lasso_selection_y, lasso_selection_d)

  data %>% select(all_of(lasso_selection_joint)) %>%
    lm(y ~ ., data = .) %>%  tidy() %>%
    filter(term == "d") %>%
    return(.)
}
