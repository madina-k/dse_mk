simulate_dml <- function(theta, N, p, nSim){

  source("./functions/get_cvLassoPredict.R")

  thetas <- matrix(NA,nSim,3)
  colnames(thetas) <- c("Naive DML RF","Cross-fiting DML RF", "Cross-fiting DML cvL")

  b <- 1/(1:p)

  for (i in c(1:nSim)){

    z <- matrix(rnorm(N*p), N, p) # = Generate z = #
    g <- as.vector(cos(z%*%b)^2) # = Generate the function g = #
    m <- as.vector(sin(z%*%b) + cos(z%*%b)) # = Generate the function m = #
    d <- m + rnorm(N) # = Generate d = #
    y <- theta*d + g + rnorm(N) # = Generate y = #


    # Naive DML

    # Step 1. Predict y


    model <- randomForest(z,y,maxnodes = 20)
    G <- predict(model,z)



    # Step 2. Predict d

    modeld <- randomForest(z, d, maxnodes = 20)
    M <- predict(modeld, z)
    V <- d - M

    # Step 3. Naive DML
    theta_nv <- mean(V*(y - G))/mean(V*d)



    # Cross-fitting DML

    # Step 0. Split sample
    I  <- sort(sample(1:N,N/2))
    IC <- setdiff(1:N,I)

    # Step 1. Models for y

    model1 <- randomForest(z[IC,],y[IC],maxnodes = 10)
    model2 <- randomForest(z[I,],y[I], maxnodes = 10)
    G1 <- predict(model1,z[I,])
    G2 <- predict(model2,z[IC,])

    # Step 2. Models for d
    modeld1 <- randomForest(z[IC,],d[IC],maxnodes = 10)
    modeld2 <- randomForest(z[I,],d[I],maxnodes = 10)
    M1 <- predict(modeld1,z[I,])
    M2 <- predict(modeld2,z[IC,])
    V1 <- d[I] - M1
    V2 <- d[IC] - M2

    # Step 3. Compute Cross-Fitting DML theta


    theta1 <- mean(V1*(y[I] - G1))/mean(V1*d[I])
    theta2 <- mean(V2*(y[IC] - G2))/mean(V2*d[IC])
    theta_cf <- mean(c(theta1,theta2))




    # Cross-fitting DML using cross-validated Lasso

    # Step 0. Create interaction terms

    X <- z %>%  as.data.frame()
    X <- model.matrix(~.^5-1, data = X)
    dim(X)


    # Step 1. Get predictions for `y`

    G1l <- get_cvLassoPredict(X[IC,], y[IC], newX = X[I,])
    G2l <- get_cvLassoPredict(X[I,], y[I], newX = X[IC,])

    # Step 2. Get predictions for `d`

    M1l <- get_cvLassoPredict(X[IC,], d[IC], newX = X[I,])
    M2l <- get_cvLassoPredict(X[I,], d[I], newX = X[IC,])
    V1l <- d[I] - M1l
    V2l <- d[IC] - M2l


    # Step 3. Cross-fitting DML using cross-validated Lasso

    theta1l <- mean(V1l*(y[I] - G1l))/mean(V1l*d[I])
    theta2l <- mean(V2l*(y[IC] - G2l))/mean(V2l*d[IC])
    theta_cf_l <- mean(c(theta1l,theta2l))


    thetas[i,1] <- theta_nv
    thetas[i,2] <- theta_cf
    thetas[i,3] <- theta_cf_l
  }

  return(thetas)
}
