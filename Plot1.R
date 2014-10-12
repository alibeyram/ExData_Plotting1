# reading the file using data.table package which is faster
library(data.table)
project1 <- fread("household_power_consumption.txt",colClasses = 'character')

# Converting Date column to "Date" class
project1$Date <- as.Date(project1$Date,"%d/%m/%Y")

# selecting the only 2 days that is needed
sample <- subset(project1, (Date=="2007-02-01"|Date=="2007-02-02"))


#opening the png file
png('Plot1.png',width = 480, height = 480)
par(bg="transparent")
hist(as.numeric(sample$Global_active_power),xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")


dev.off()