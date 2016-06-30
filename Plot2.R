plot2 <- function(ucifile = "C:/Users/cwilhelm/Documents/Coursera/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt") {
	ucidata <- read.table(ucifile,header=TRUE,sep=";",na.strings="?")
	subfirst <- subset(ucidata,Date=="1/2/2007")
	subsecond <- subset(ucidata,Date=="2/2/2007")
	subdata <- rbind(subfirst,subsecond)
	subdata$Timestamp <- paste(subdata$Date, subdata$Time)

	png("plot2.png",width=480,height=480)
	plot(strptime(subdata$Timestamp, "%d/%m/%Y %H:%M:%S"), subdata$Global_active_power,type='l',xlab="",ylab="Global Active Power (kilowatts)")
	dev.off()

	}