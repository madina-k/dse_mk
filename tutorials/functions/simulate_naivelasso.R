simulate_naiveLasso <- function(data){
  # Create X matrix
  X <- data %>%  select(-y)  %>%  as.matrix()

  # Cross-validation
  cv_lasso <- cv.glmnet(X, data$y, alpha = 1)
  bestlam <- cv_lasso$lambda.min
  lasso_reg <- glmnet(X, data$y, alpha = 1)

  # Get lasso coefficients at best lambda
  lasso_coefficients <- predict(lasso_reg,  type = "coefficients", s = bestlam)
  lasso_coefficients <- lasso_coefficients %>% as.matrix() %>% as.data.frame() %>%
    mutate(coef_names = row.names(.)) %>%
    rename(coef = `1`) %>% filter(coef != 0)

  # Run OLS y on d and selected control variables
  data %>% select(y, lasso_coefficients$coef_names[-1]) %>%
    lm(y ~ d + ., data = .) %>%  tidy() %>% filter(term == "d") %>%
    return(.)
}
