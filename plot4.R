household_power_consumption = read.csv("household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
head(household_power_consumption)
dates = subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

# Plot 4
quartz()
par(mfrow = c(2,2))
# first graph
dates$DateTime <- as.POSIXct(strptime(paste(dates$Date,dates$Time),"%d/%m/%Y %H:%M:%S"))
plot(dates$DateTime,dates$Global_active_power,type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")


# second graph
plot(dates$DateTime,dates$Voltage, type = "l",xlab ="datetime", ylab="Votage")

# third graph
with(dates,plot(dates$DateTime,dates$Sub_metering_1,type = "l", col = "black", ylab = "Energy sub metering", xlab=""))
par(new = TRUE)
with(dates,lines(dates$DateTime,dates$Sub_metering_2, type = "l", col = "red"))
par(new=TRUE)
with(dates,lines(dates$DateTime,dates$Sub_metering_3, col = "blue"))
legend("topright",lty = 1, col =c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# fourth graph
plot(dates$DateTime,dates$Global_reactive_power, type = "l",xlab ="datetime", ylab="Global_reactive_power")

dev.print(device=png, height = 480, width = 480, file = "plot4.png", units = "px")
dev.off()