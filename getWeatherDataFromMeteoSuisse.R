library(XML)

# Pressure
url <- "http://www.meteoschweiz.admin.ch/web/de/wetter/aktuelles_wetter.par0005.sub0040.html?region=7";
html <-  htmlTreeParse(url, useInternalNodes=T);
pressure <- xpathSApply(html, "//div[@id='karte_data_luftdruck_qnh___WAE']", xmlValue);

# Temperature
url <- "http://www.meteoschweiz.admin.ch/web/de/wetter/aktuelles_wetter.par0001.html?region=7";
html <-  htmlTreeParse(url, useInternalNodes=T);
temperature <- xpathSApply(html, "//div[@id='karte_data_aktuelle_temperatur___WAE']", xmlValue);

# Humidity
url <- "http://www.meteoschweiz.admin.ch/web/de/wetter/aktuelles_wetter.par0023.html?region=7";
html <-  htmlTreeParse(url, useInternalNodes=T);
humidity <- xpathSApply(html, "//div[@id='karte_data_aktuelle_relative___WAE']", xmlValue);

# Wind
# url <- "http://www.meteoschweiz.admin.ch/web/de/wetter/aktuelles_wetter.par0010.html?region=7";
# html <-  htmlTreeParse(url, useInternalNodes=T);
# wind <- xpathSApply(html, "//div[@id='karte_data_aktueller_wind_numerisch___WAE']", xmlValue);
# windSpeed <- unlist(strsplit(wind, "|", fixed = TRUE))[2];
# windDirection <- unlist(strsplit(wind, "|", fixed = TRUE))[1];

# Rain
url <- "http://www.meteoschweiz.admin.ch/web/de/wetter/aktuelles_wetter.par0006.html?region=7";
html <-  htmlTreeParse(url, useInternalNodes=T);
rain <- xpathSApply(html, "//div[@id='karte_data_niederschlag_in_den___WAE']", xmlValue);


#---  Write to MySQL

library("RMySQL");

con <- dbConnect(MySQL(),
                 user = "mikmak", 
                 host = "mikmak.cc", 
                 password = "Gaffe2014", 
                 db = "wateringStation");

#p <- paste('CALL writeWeatherData(', temperature, ',', 0,')', sep= ' ') 

#r <- dbCallProc(con,c(temperature,0,0,windSpeed,windDirection,rain,pressure,humidity));

Query <- dbSendQuery(con, statement = paste("CALL writeWeatherData(",
                                            "@p0", ",",
                                            temperature, ",", 
                                            0, ",", 
                                            0, ",",
                                            0, ",",
                                            0, ",", 
                                            rain, ",", 
                                            pressure, ",",
                                            humidity,                                            
                                            ")"));