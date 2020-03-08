xval_glmnet_wrapper <- function(X_train, y_train, X_test, y_test, alpha = 0, grid = 10^seq(10, -2, length = 100)){
  # Let's make it more verbose
  cat("Performing cross-validation")
  if (alpha == 0) {
    cat("Ridge regression\n")
  } else if (alpha == 1){
    cat("Lasso regression\n")
  } else {
    cat("Elastic net regression with alpha =", alpha, "\n")
  }

  cv_out <- cv.glmnet(X_train, y_train, alpha = alpha)
  plot(cv_out)
  bestlam <- cv_out$lambda.min
  mod <- glmnet(X_train, y_train, alpha = alpha, lambda = grid)
  pred <- predict(mod, s = bestlam, newx = X_test)
  test_mse <- mean((pred - y_test)^2)
  # Very large lambda
  pred_intercept <- predict(mod, s = 1e10, newx = X_test)
  test_mse_intercept <- mean((pred_intercept - y_test)^2)

  # OLS
  pred_ols <- predict(mod, s = 0, newx = X_test)
  test_mse_ols <- mean((pred_ols - y_test)^2)

  # Coefficients for regularized regression
  X <- rbind(X_train, X_test)
  y <- c(y_train, y_test)
  out <- glmnet(X, y, alpha = alpha, lambda = grid)

  coef <- predict(out, type = "coefficients", s = bestlam)[1:nrow(coef(out)),]
  output <- list(bestlam = bestlam, test_mse = test_mse, coef = coef )

  # Let's print the output

  cat("The best lambda is lambda = ", bestlam, "\n")
  cat("test MSE = ", test_mse, "\n")
  cat("Compare to test MSE of intercept = ", test_mse_intercept, "and to test MSE of OLS = ", test_mse_ols, "\n")


  # Let's return the output
  return(output)
}
