data<-read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, dec=".", header=TRUE)
relevantdata<-subset(data, data$Date %in% c("1/2/2007","2/2/2007"))
numericdata<-as.numeric(relevantdata$Global_active_power)

png("plot1.png", width=480, height=480)
with(relevantdata,hist(x = numericdata, main = "Global Active Power", col="red", xlab = "Global Active Power (kilowatts)"))
dev.off()