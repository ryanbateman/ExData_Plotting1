# Load the data
data <- read.delim("household_power_consumption.txt", sep=";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Combine columns to create datetime object
data$DateTime <- as.POSIXlt(strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#plot1
png(filename="plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global active power", col="red", xlab = "Global Active Power (Kilowatts)")
dev.off()
