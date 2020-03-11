get_cvLassoPredict <- function(X, y, newX) {
  lasso_reg <- glmnet(X, y, alpha = 1)
  cv_lasso <- cv.glmnet(X, y, alpha = 1)
  bestlam  <- cv_lasso$lambda.min
  lasso_predict <- predict(lasso_reg,  newX, s = bestlam)
  return(lasso_predict)
}
