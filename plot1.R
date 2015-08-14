household_power_consumption = read.csv("household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
head(household_power_consumption)
dates = subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

# Plot 1
quartz()
with(dates, sep = ";", hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",ylab = "Frequency", main = "Global Active Power"))
par(yaxp = c(0,1200,100))

dev.print(device=png, height = 480, width = 480, file = "plot1.png", units = "px")
dev.off()
