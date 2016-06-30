plot4 <- function(ucifile = "C:/Users/cwilhelm/Documents/Coursera/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt") {
	ucidata <- read.table(ucifile,header=TRUE,sep=";",na.strings="?")
	subfirst <- subset(ucidata,Date=="1/2/2007")
	subsecond <- subset(ucidata,Date=="2/2/2007")
	subdata <- rbind(subfirst,subsecond)
	subdata$Timestamp <- paste(subdata$Date, subdata$Time)

	png("plot4.png",height=480,width=480)
	par(mfrow=c(2,2))
	plot(strptime(subdata$Timestamp, "%d/%m/%Y %H:%M:%S"),subdata$Global_active_power,type="l",xlab="",ylab="Global Active Power")

	plot(strptime(subdata$Timestamp, "%d/%m/%Y %H:%M:%S"),subdata$Voltage,type="l",xlab="datetime",ylab="Voltage")

	plot(strptime(subdata$Timestamp, "%d/%m/%Y %H:%M:%S"),subdata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
	points(strptime(subdata$Timestamp, "%d/%m/%Y %H:%M:%S"),subdata$Sub_metering_2,type="l",col="red")
	points(strptime(subdata$Timestamp, "%d/%m/%Y %H:%M:%S"),subdata$Sub_metering_3,type="l",col="blue")
	legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")

	plot(strptime(subdata$Timestamp, "%d/%m/%Y %H:%M:%S"),subdata$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
	dev.off()

	}