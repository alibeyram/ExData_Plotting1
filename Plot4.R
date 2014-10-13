# reading the file using data.table package which is faster
library(data.table)
project1 <- fread("household_power_consumption.txt",colClasses = 'character')

# Converting Date column to "Date" class
project1$Date <- as.Date(project1$Date,"%d/%m/%Y")

# selecting the only 2 days that is needed
sample <- subset(project1, (Date=="2007-02-01"|Date=="2007-02-02"))

# converting to Time format
dates <- strptime(paste(sample$Date,sample$Time),format="%Y-%m-%d %H:%M:%S")

#opening the png file
png('Plot4.png',width = 480, height = 480)

#par(bg="transparent")
par(mfcol = c(2,2))

plot(dates,sample$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",pch= "")
lines(dates,sample$Global_active_power)

plot(dates,sample$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(dates,sample$Sub_metering_1)
lines(dates,sample$Sub_metering_2,col="red")
lines(dates,sample$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch ="-",lwd=1 ,col =c("black","red","blue"),cex=1)

plot(dates,sample$Voltage,xlab="datetime", ylab="Voltage", type="n")
lines(dates,sample$Voltage)

plot(dates,sample$Global_reactive_power,xlab="datetime", ylab="Global_reactive_power", type="n")
lines(dates,sample$Global_reactive_power)

dev.off()