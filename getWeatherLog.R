con.weatherDW <- dbConnect(MySQL(),
                           user = "read", 
                           host = "mikmak.cc",
                           password = "809913", 
                           db = "weatherDW");


# Get WeatherLog
query <- dbSendQuery(con.weatherDW, statement = paste("SELECT msgID, msgv1, tmstp FROM log WHERE sysID = '79cf6c22-dcc6-11e5-8e77-00113217113f'"))
eWeatherLog <- fetch(query, n=-1)
#return(eWeatherLog)