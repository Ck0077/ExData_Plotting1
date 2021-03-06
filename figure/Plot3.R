data<-read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, dec=".", header=TRUE)
relevantdata<-subset(data, data$Date %in% c("1/2/2007","2/2/2007"))
numericdata<-as.numeric(relevantdata$Global_active_power)
datetime <- strptime(paste(relevantdata$Date, relevantdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
submet1<-as.numeric(relevantdata$Sub_metering_1)
submet2<-as.numeric(relevantdata$Sub_metering_2)
submet3<-as.numeric(relevantdata$Sub_metering_3)

png("Plot3.png")
plot(datetime, submet1, type="l", ylab = "Energy Submetering", xlab="")
lines(datetime, submet2, col="red", type="l")
lines(datetime, submet3, col="blue", type="l")
legend("topright", legend = c("Sub_Metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, lwd = 2.5)
dev.off()