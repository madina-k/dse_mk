get_cvLassoCoefs <- function(X, y) {
  lasso_reg <- glmnet(X, y, alpha = 1)
  cv_lasso <- cv.glmnet(X, y, alpha = 1)
  bestlam  <- cv_lasso$lambda.min
  lasso_coefficients <- predict(lasso_reg,  type = "coefficients", s = bestlam) %>%
    as.matrix() %>% as.data.frame() %>%
    mutate(coef_names = row.names(.)) %>%
    rename(coef = `1`) %>% filter(coef != 0)
  return(lasso_coefficients)
}
