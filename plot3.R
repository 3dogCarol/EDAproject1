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

# Plot 3
quartz()
with(power,plot(power$DateTime,power$Sub_metering_1,type = "l", col = "black", ylab = "Energy sub metering", xlab=""))
par(new = TRUE)
with(power,lines(power$DateTime,power$Sub_metering_2, type = "l", col = "red"))
par(new=TRUE)
with(power,lines(power$DateTime,power$Sub_metering_3, col = "blue"))
legend("topright",lty = 1, col =c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.print(device=png, height = 480, width = 480, file = "plot3.png", units = "px")
dev.off()

