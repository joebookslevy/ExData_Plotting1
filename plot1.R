##Loading in data set
data<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
               na.strings="?")
##Subsetting the data
mydata<-data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

##Plotting frequency of Global Active Power 
hist(mydata$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")