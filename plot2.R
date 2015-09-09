# Plot 2
read.table("household_power_consumption.txt", sep="", nrow=20)
## Used awk program to pull out data for 01/02/2007 and 02/02/2007 and put in file power
##  BEGIN {
##     FS=";"
##  }
##     NR >1  && $1=="Date" || $1 == "1/2/2007" || $1 == "2/2/2007"  {print $0}
power <- read.table("power",sep=";")
header = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
colnames(power) <- header
power$DateTime <- as.POSIXct(strptime(paste(power$Date,power$Time),"%d/%m/%Y %H:%M:%S"))
plot(power$DateTime,power$Global_active_power,type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
dev.print(device=png, height = 480, width = 480, file = "plot2.png", units = "px")
dev.off()
