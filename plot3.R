##Loading in data set
data<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
               na.strings="?")
##Subsetting the data
mydata<-data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

##Creates date/time column to use for plot
library(lubridate)
newvar<-dmy_hms(paste(mydata$Date, mydata$Time)) 

##Creating varibles to use for Sub metering plot
sub1<-mydata$Sub_metering_1
sub2<-mydata$Sub_metering_2
sub3<-mydata$Sub_metering_3

##Set up plot space
plot(newvar,sub1,type="n", ylab="Energy sub metering", xlab="")

##Add in sub metering points one at a time
points(newvar, sub1, type="l", col="black")
points(newvar, sub2, type="l", col="red")
points(newvar, sub3, type="l", col="blue")

##Create legend for plot
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=1)

