library("RMySQL");

con <- dbConnect(MySQL(),
                 user = "mikmak", 
                 host = "mikmak.cc", 
                 password = "Gaffe2014", 
                 db = "wateringStation");

insert <- function(id, data) {
  rec <- data[id,];
  print(rec$timestamp);
Query <- dbSendQuery(con, statement = paste("CALL restore(",
                                            rec$sensID, ",",
                                            rec$sensVal, ",",
                                            "'",rec$timestamp,"'",
                                        ")"));
}

sapply(1:nrow(dataRaw), function(x) insert(x, dataRaw));