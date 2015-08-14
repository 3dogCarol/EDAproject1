# Plot 2
household_power_consumption = read.csv("household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
head(household_power_consumption)
dates = subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

quartz()
dates$DateTime <- as.POSIXct(strptime(paste(dates$Date,dates$Time),"%d/%m/%Y %H:%M:%S"))
plot(dates$DateTime,dates$Global_active_power,type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
dev.print(device=png, height = 480, width = 480, file = "plot2.png", units = "px")
dev.off()
