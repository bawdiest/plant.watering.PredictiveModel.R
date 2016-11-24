d <- read.table("~/Downloads/066600-99999-2016.op", quote="\"", comment.char="")

d$V3 <- strptime(d$V3,format="%Y%m%d")

d$V4 <- (d$V4 - 32) * (5/9) #Convert Farenheit to Celsius

plot(d[, c("V3", "V4")], type = "l")