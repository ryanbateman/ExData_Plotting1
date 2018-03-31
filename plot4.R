# Load the data
data <- read.delim("household_power_consumption.txt", sep=";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Combine columns to create datetime object
data$DateTime <- as.POSIXlt(strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#plot4
png(filename="plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(5.1, 4.1, 4.1, 2.1), oma = c (0,0,0,0))
plot(data$DateTime, data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
plot(data$DateTime, data$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
plot(data$DateTime, data$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global reactive power")
dev.off()