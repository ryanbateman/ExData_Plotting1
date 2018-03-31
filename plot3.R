# Load the data
data <- read.delim("household_power_consumption.txt", sep=";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Combine columns to create datetime object
data$DateTime <- as.POSIXlt(strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#plot3
png(filename="plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()