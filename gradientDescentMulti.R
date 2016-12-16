



# Functions ---------------------------------------------------------------

computeCostMulti <- function(X, y, theta) {
  y <- as.vector(y);
  #theta <- as.vector(theta, mode = 'numeric');
  m <- length(y);
  X <- data.matrix(X);
  J <- X %*% (theta);
  #J <- ((t((J) - y ) %*% (J - y  ))) / (2*m);
  #J <- ((t((X %*% theta) - y ) %*% ((X %*% theta) - y  ))) / (m);
  J <- ((sum((J-y)^2)))/(0.5 * m)
  return(J)
}

# gradientDescentMulti <- function(X, y, alpha, num_iters) {
#   m <- length(y); # number of training examples
#   X <- data.matrix(X);
#   theta = data.matrix(rep(0.1,ncol(X)));
#   costH <- 0.1;
#   
#   for(iter in 1:num_iters) {
#     cost <- computeCostMulti(X,y,theta); #Get Error
#     factor <- (alpha/m);
#     htheta <- X %*% theta; #Compute Cost for each record
#     correctionFactor <- t(X) %*% (htheta - y); #Compute Error relative to each feature (Some features contribute to the total error more than others)
#     correctionFactor <- correctionFactor * factor; #Relativate Error to Learning factor
#     
#     theta <- theta - correctionFactor; #Correct theta
#     costH[iter] <- cost;
#   }
#   
#   r <- list(theta = theta, cost = costH);
#   return(r);
# }

gradientDescentMulti <- function(X, y, alpha, num_iters) {
  m <- length(y); # number of training examples
  X <- data.matrix(X);
  #theta = data.matrix(rep(0.1,ncol(X)));
  theta <- data.matrix(runif(ncol(X),min = 0.1, max = 0.9))
  theta <- data.matrix(rep(0,ncol(X)))
  costH <- 0.1;

  for(iter in 1:num_iters) {
    cost <- computeCostMulti(X,y,theta); #Get Error
    factor <- (alpha/m);
    htheta <- X %*% theta;

    correctionX <- t(X) %*% (htheta - y);
    #correctionFactor <- (correctionX * theta) * factor;
    correctionFactor <- (correctionX) * factor;
    #factor <-  factor * cost; #Error by Learning Rate
    #f <- rep(as.numeric(factor), nrow(X)); # Multiplicate Error Rate to be able to vectorize function
    #nF <- t(X) %*% data.matrix(f); # Compute Error for each variable. (There are variables which influence the error more than others)
    #factror <- (factor) %*% t(X);

    theta <- theta - correctionFactor;
    costH[iter] <- cost;

    #if (computeCostMulti(X,y,theta) > cost) break
  }

  r <- list(theta = theta, cost = costH);
  return(r);
}

normalizeMatrix <- function(x) { 
  
  xMin <- apply(x,2,min);
  xMax <- apply(x,2,max);
  xDiff <- xMax - xMin;
  xFactor <- diag((1)/(xMax-xMin));
  
  x <- t(as.matrix(t(x) - xMin));
  x <- x %*% t(xFactor);
  
  attr(x,"xMin") <- xMin;
  attr(x,"xMax") <- xMax;
  xFactor <- 1/xDiff;
  attr(x,"xFactor") <- xFactor;
  return(x);
};

normalizeVector <- function(x) { 
  attr(x, 'normalizeMin') <- min(x);
  attr(x, 'normalizeMax') <- max(x);
  xMin <- min(x);
  xMax <- max(x);
  
  #x <- (x-min(x))/(max(x)-min(x));
  #x <- (x-min(x))/(max(x));
  xDiff <- xMax - xMin;
  xFactor <- 1/xDiff;
  
  x <- x - xMin;
  x <- x * xFactor;
  
  attr(x,"yMax") <- xMax;
  attr(x,"yMin") <- xMin;
  attr(x,"yFactor") <- xFactor;
  
  return(x);
};

trainLinearModell <- function(X, y) {
  X <- normalizeMatrix(X);
  y <- normalizeVector(y);
  
  params = list(); 
  
  params$xMin <- attributes(X)$xMin;
  params$xMax <- attributes(X)$xMax;
  params$xFactor <- attributes(X)$xFactor;
  
  params$yMin <- attributes(y)$normalizeMin;
  params$yMax <- attributes(y)$normalizeMax;
  params$yFactor <- attributes(y)$yFactor;
  
  gD <- gradientDescentMulti(X = X, y = y, alpha = 0.01, num_iters = 10000);
  theta <- gD$theta;
  
  plot(gD$cost, xlab="Iteration", ylab="Error");
  theta <- replace(theta, is.na(theta), 0)
  
  params$theta <- theta;
  
  return(params)
}

polyFeatures <- function(X, degree) {
  c <- ncol(X)
  for(j in 1:c) {
    for (i in 2:degree) {
      X <- cbind(X, X[,j] ^ i)
      names(X)[ncol(X)] <- paste(names(X)[j],degree, sep = "P", collapse = "")
      X[is.na(X)] <- 0
    }
  }
  return(X)
}

# computeCostMulti <- function(X, y, theta) {
#   y <- as.vector(y);
#   #theta <- as.vector(theta, mode = 'numeric');
#   m <- length(y);
#   X <- data.matrix(X);
#   J <- X %*% (theta);
#   J <- ((t((J) - y ) %*% (J - y  ))) / (2*m);
#   #J <- ((t((X %*% theta) - y ) %*% ((X %*% theta) - y  ))) / (m);
#   return(J)
# }
# 
# # gradientDescentMulti <- function(X, y, alpha, num_iters) {
# #   m <- length(y);
# #   X <- data.matrix(X);
# #   theta <- vector("integer", ncol(X));
# #   theta <- as.vector(rep(0.1,ncol(X)), mode = 'numeric');
# #   costH <- 0;
# #   
# #   for(iter in 1:num_iters) {
# #     htheta <- X %*% theta;
# #     thetaTmp <- 1;
# #     for(row in 1:length(theta)) {
# #       theta[row] = theta[row] - (alpha / m) * (t(htheta - y) %*% X[,row]);
# #     }
# #     #costH[iter] <- computeCostMulti(Xtest, ytest, theta);
# #   }
# #   r <- list(theta = theta, cost = costH);
# #   return(r);
# # }
# 



X <- matrix(c(1,1,1,0.5,0.5,0.5,0.1,0.1,0.1), nrow = 3, ncol =3);

y <- c(2,2,2);

t <- gradientDescentMulti(X, y, 0.001, 100)