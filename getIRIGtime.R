source("getRecentMeteoData.R")

normalizeVector <- function(x) { 
  #attr(x, 'normalizeMin') <- min(x);
  #attr(x, 'normalizeMax') <- max(x);
  xMin <- min(x);
  xMax <- max(x);
  
  #x <- (x-min(x))/(max(x)-min(x));
  #x <- (x-min(x))/(max(x));
  xDiff <- xMax - xMin;
  xFactor <- 1/xDiff;
  
  
  x <- x - xMin;
  x <- x * xFactor;
  
  
  x <- (x^2)^(1/2)
  xMin <- (xMin^2)^(1/2)
  
  attr(x,"yMax") <- xMax;
  attr(x,"yMin") <- xMin;
  attr(x,"yFactor") <- xFactor;
  
  return(x);
};


# Script ------------------------------------------------------------------

model <- read.csv("iRigModel", sep="")
model <- t(model)


X <- getRecentWeatherData()
X <- as.vector(X, mode = "integer")

xMin <- model[,1];
xMax <- model[,2];
theta <- model[,3];

r <- (X - xMin) / xMax
r <- r %*% theta
r <- r * 1218