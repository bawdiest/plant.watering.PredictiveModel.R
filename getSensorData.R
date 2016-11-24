library("RMySQL");
library("reshape2");
library("scales");


# Functions ---------------------------------------------------------------

calc2DayMean <- function (x, data, col, fun, offsetH = 0, offsetL = -1) {
  
  data <- data[data$date >= as.Date(x)+offsetL & data$date <= as.Date(x)+offsetH,col];
  
  if (fun == 'mean') {
    x <- mean(data, na.rm = TRUE);
  } 
  if(fun == 'sd') {
    x <- sd(data, na.rm = TRUE);
  }
  if(fun == 'sum') {
    x <- sum(data, na.rm = TRUE);
  }
  
  return(x);
}

simulate <- function(x, theta, params) {
  test <- (diag(c(10,1010,70) - params$xMin,3) %*% (params$xFactor));
  test <- t(test) %*% (theta)
  test <- test %/% params$yFactor
}

computeCostMulti <- function(X, y, theta) {
  y <- as.vector(y);
  #theta <- as.vector(theta, mode = 'numeric');
  m <- length(y);
  X <- data.matrix(X);
  J <- X %*% (theta);
  J <- ((t((J) - y ) %*% (J - y  ))) / (2*m);
  #J <- ((t((X %*% theta) - y ) %*% ((X %*% theta) - y  ))) / (m);
  return(J)
}

gradientDescentMulti <- function(X, y, alpha, num_iters) {
  m <- length(y); # number of training examples
  X <- data.matrix(X);
  theta = data.matrix(rep(0.1,ncol(X)));
  costH <- 0.1;
  
  for(iter in 1:num_iters) {
    cost <- computeCostMulti(X,y,theta); #Get Error
    factor <- (alpha/m);
    htheta <- X %*% theta; #Compute Cost for each record
    correctionFactor <- t(X) %*% (htheta - y); #Compute Error relative to each feature (Some features contribute to the total error more than others)
    correctionFactor <- correctionFactor * factor; #Relativate Error to Learning factor
    
    theta <- theta - correctionFactor; #Correct theta
    costH[iter] <- cost;
  }
  
  r <- list(theta = theta, cost = costH);
  return(r);
}

mapFeature <- function(X, degree) {
  
#   for(i in 3:ncol(X)) {
#     X <- cbind(X, X[,i-2] * X[,i]);
#   }
  Xnew <- X;
  for(deg in 2:degree) {
    Xnew <- cbind(Xnew, X^(deg));
  }
  return(Xnew);
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

# Download Sensor Data ----------------------------------------------------

con <- dbConnect(MySQL(),
                 user = "read", 
                 host = "mikmak.cc", 
                 password = "809913", 
                 db = "weatherDW");

query <- dbSendQuery(con, statement = paste("SELECT sensID, sensVal, timestamp","FROM log","order by timestamp DESC"));

weatherRaw <- fetch(query, n = -1);

query <- dbSendQuery(con, statement = paste("SELECT msgid, var1, timestamp","FROM msgLog", "WHERE msgid = 101 AND timestamp >= '2014-06-01 00:00:00' AND timestamp <= '2015-01-01 00:00:00'", "order by timestamp DESC"));
pumpLogRaw <- fetch(query);
dbDisconnect(con);

pumpLogRaw[,1] <- 1;
pumpLogRaw[,2] <- as.integer(pumpLogRaw[,2]);
names(pumpLogRaw) <- names(weatherRaw);


# Enhance Features Set ------------------------------------------

weatherRaw <- melt(weatherRaw, id = c("sensID", "timestamp"), measure.vars = c("sensVal"));
weatherRaw <- dcast(weatherRaw, timestamp ~ sensID, fun.aggregate = mean);
weatherRaw <- cbind(as.Date(weatherRaw$timestamp), weatherRaw);

weatherRaw <- cbind(weatherRaw, as.numeric(strftime(as.POSIXlt(weatherRaw$timestamp), format = '%H')));

# Add Day or Night
names(weatherRaw) <- c("date", "timeStamp", "temperature", "obsolete1", "obsolete2", "wind", "windDirection", "rain", "pressure", "humidity", "day");
weatherRaw$day <- replace(weatherRaw$day, weatherRaw$day < 20 & weatherRaw$day > 7, 100);
weatherRaw$day <- replace(weatherRaw$day, weatherRaw$day < 100 , 0);
weatherRaw$day <- replace(weatherRaw$day, weatherRaw$day == 100 , 1);
names(weatherRaw) <- c("date", "timeStamp", "temperature", "obsolete1", "obsolete2", "wind", "windDirection", "rain", "pressure", "humidity", "day");

# Calculate absolute Humidity
weatherRaw <- cbind(weatherRaw, weatherRaw$temperature * (weatherRaw$humidity / 100) );
names(weatherRaw) <- c("date", "timeStamp", "temperature", "obsolete1", "obsolete2", "wind", "windDirection", "rain", "pressure", "humidity", "day", "Temp/Humidity");

# Select Features ------------------------------------------
weatherRaw <- subset( weatherRaw, select = -c(4,5,6,7,8) ); #Omit these columns for further processing




# Technical Statement
l <- length(unique(weatherRaw[,1]));
# View(weatherTable);


# # Prepaire PumpLog --------------------------------------------------------
 pumpLogRaw <- cbind(as.Date(pumpLogRaw$timestamp), pumpLogRaw);
 names(pumpLogRaw) <- c("date","var", "value", "timestamp" );
 
 pumpLogTable <- data.frame(date = unique(pumpLogRaw$date),
                            pumpDuration = integer(1));
 
 pumpLogTable$pumpDuration <- sapply(pumpLogTable$date, function(x) { calc2DayMean(x, pumpLogRaw, 3, 'sum', offsetL = 0) });
 
 
# # Create Training Set -----------------------------------------------------
 
 trainingSet <- merge(pumpLogTable, weatherRaw, by = "date", all.x = FALSE, all.y = FALSE);
# 
# pumpHistory <- data.frame(date = unique(pumpLogRaw$date),
#                           pumpHistory = integer(1)
# );
# pumpHistory$pumpHistory <- sapply(pumpLogTable$date, function(x) { calc2DayMean(x, pumpLogRaw, 3, 'sum', offsetL = -1, offsetH = -1) });
# 
# trainingSet <- merge(trainingSet, pumpHistory, by = "date", all.x = TRUE, all.y = FALSE);
# 
# 

# 

trainingSet <- trainingSet[complete.cases(trainingSet),];

 X <- trainingSet[,4:ncol(trainingSet)];

 # attr(X,"min") <- apply(X,2,min);
 y <- as.matrix(trainingSet[,2]);
# X <- mapFeature(X, 3);



# # Normalize Set  ------------------------------------------- 
 X <- normalizeMatrix(X);
 y <- normalizeVector(y);

params = list(); 

params$xMin <- attributes(X)$xMin;
params$xMax <- attributes(X)$xMax;
params$xFactor <- attributes(X)$xFactor;
params$yMin <- attributes(y)$normalizeMin;
params$yMax <- attributes(y)$normalizeMax;
params$yFactor <- attributes(y)$yFactor;
 


# # Split TrainingSet and TestSet -------------------------------------------
 sV <- sample(nrow(X), 100);
 
 Xtrain <- X[sV,];
 ytrain <- y[sV];
 Xtest <- X[sV*-1,];
 ytest <- y[sV*-1];
 
# # Train Model -------------------------------------------------------------
# 
 gD <- gradientDescentMulti(X = Xtrain, y = ytrain, alpha = 0.01, num_iters = 100000);
 theta <- gD$theta;
 
 plot(gD$cost, xlab="Iteration", ylab="Error");
 theta <- replace(theta, is.na(theta), 0);



 #cost  <- computeCostMulti(Xtest, ytest, theta);





 scale  <- as.vector(attributes(X)$`scaled:scale`, mode = "numeric");
 center <- as.vector(attributes(X)$`scaled:center`, mode = "numeric");
# 
# 
# # Test --------------------------------------------------------------------
# 
# row <- nrow(weatherTable);
 
# actWeatherRow <- as.vector(weatherTable[row,c(2:ncol(weatherTable))]); # get latest Weather Info
# res <- cbind(actWeatherRow,0);
# 
# test <- rescale(res, to = c(0,1), from(RANGE));
# #res <- mapFeature(res, 3);
# res <- (as.vector(res) - center)  / scale;
# res <- as.matrix(res) %*% theta;
# res <- res * attr(y, 'scaled:scale') + attr(y, 'scaled:center');
# View(res);
# test <- test %*% theta;
# View(test);
 
 test <- (diag(c(10,1010,70,1) - params$xMin,4) %*% (params$xFactor));
 test <- t(test) %*% (theta)
 test <- test %/% params$yFactor
 