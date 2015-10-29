# October 15, 2015
library(dplyr)
library(lubridate)

# reads in data
d <- read.csv("CB7-10023-10024-10025-10069.csv", stringsAsFactors = FALSE, header = TRUE)

# d$hurt is greater than 0 if someone is injured or killed
d$hurt <- d[,11] + d[,12]

# filter data to include only rows w/ injury or death
d2 <- filter(d, d$hurt >0)

col <- c("pink","red","lightblue","blue","lightgreen","darkgreen")
size <- c(.2,1,.2,1,.2,1)

# first plot location of pedestrians injured
d3 <- filter (d2, d2[,13]>0)
sym <- c(1,16,2,17,5,23)
plot(d3$LONGITUDE,d3$LATITUDE,col=col[1], cex =size[1]*d3[,13], pch=sym[1])

# plot columns 14 - 18, each with a different color and shape
for (i in (2:6)) {
   d3 <- filter (d2,d2[,i+12]>0)
   points(d3$LONGITUDE,d3$LATITUDE,col=col[i], cex =size[i]*d3[,i+12], pch=sym[i])
}
