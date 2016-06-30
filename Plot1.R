plot1 <- function(ucifile = "C:/Users/cwilhelm/Documents/Coursera/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt") {
	ucidata <- read.table(ucifile,header=TRUE,sep=";",na.strings="?")
	subfirst <- subset(ucidata,Date=="1/2/2007")
	subsecond <- subset(ucidata,Date=="2/2/2007")
	subdata <- rbind(subfirst,subsecond)

	png("plot1.png",width=480,height=480)
	with(subdata, hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
	dev.off()

	}