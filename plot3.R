household_power_consumption = read.csv("household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
head(household_power_consumption)
dates = subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

# Plot 3
quartz()
with(dates,plot(dates$DateTime,dates$Sub_metering_1,type = "l", col = "black", ylab = "Energy sub metering", xlab=""))
par(new = TRUE)
with(dates,lines(dates$DateTime,dates$Sub_metering_2, type = "l", col = "red"))
par(new=TRUE)
with(dates,lines(dates$DateTime,dates$Sub_metering_3, col = "blue"))
legend("topright",lty = 1, col =c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.print(device=png, height = 480, width = 480, file = "plot3.png", units = "px")
dev.off()

