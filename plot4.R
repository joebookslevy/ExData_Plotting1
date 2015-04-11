##Loading in data set
data<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
               na.strings="?")
##Subsetting the data
mydata<-data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

##Creates date/time column to use for plot
library(lubridate)
newvar<-dmy_hms(paste(mydata$Date, mydata$Time))
##Creates voltage variable for voltage plot
voltage<-mydata$Voltage
##Creates voltage variable for voltage plot
gra<-mydata$Global_reactive_power
##Designating y-axis for plot
gap<-mydata$Global_active_power
##Creates voltage variable for voltage plot
gra<-mydata$Global_reactive_power
##Creating varibles to use for Sub metering plot
sub1<-mydata$Sub_metering_1
sub2<-mydata$Sub_metering_2
sub3<-mydata$Sub_metering_3

##Sets up space for all four plots. The cex call proportions text on all plots.
par(mfrow=c(2,2), cex=0.75)

##Creates Global Active Power plot (upper left)
plot(newvar, gap, type="l", col="black", ylab="Global Active Power",
     xlab="") 

##Creates voltage plot (upper right)
plot(newvar, voltage, type="l", col="black", ylab="Voltage", xlab="datetime")

##Set up plot space for sub metering plot (lower left)
plot(newvar,sub1,type="n", ylab="Energy sub metering", xlab="")
##Add in sub metering points one at a time
points(newvar, sub1, type="l", col="black")
points(newvar, sub2, type="l", col="red")
points(newvar, sub3, type="l", col="blue")
##Create legend for sub metering plot
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=1, box.col="transparent")

##Creates Global_reactive_power plot (lower right)
plot(newvar, gra, type="l", col="black", ylab="Global_reactive_power", 
     xlab="datetime")