#!/usr/bin/env Rscript

library("jsonlite")

url <- "http://192.168.1.118/battery";

data = fromJSON(url);
data$battery;

library("RMySQL");

con <- dbConnect(MySQL(),
                 user = "mikmak", 
                 host = "mikmak.cc", 
                 password = "Gaffe2014", 
                 db = "wateringStation");

#p <- paste('CALL writeWeatherData(', temperature, ',', 0,')', sep= ' ') 

#r <- dbCallProc(con,c(temperature,0,0,windSpeed,windDirection,rain,pressure,humidity));

Query <- dbSendQuery(con, statement = paste("CALL writeSolarVoltage(
                                            ","
                                            @p0" ,
                                            ","
                                            , 
                                            data$battery,
                                            ")"));