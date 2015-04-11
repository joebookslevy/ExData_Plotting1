##Loading in data set
data<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
               na.strings="?")
##Subsetting the data
mydata<-data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

##Creates date/time column to use for plot
library(lubridate)
newvar<-dmy_hms(paste(mydata$Date, mydata$Time)) 

##Designating y-axis for plot
gap<-mydata$Global_active_power

##Plot call
plot(newvar, gap, type="l", col="black", ylab="Global Active Power (kilowatts)",
     xlab="") 
