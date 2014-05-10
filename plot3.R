# Exploratory Data Analysis
# David H. Millis
# 05-10-2014
# Plot 3

# ===============================
# READ THE DATA.
# ===============================

# Read in the complete file.
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", colClasses="character")

# Change date from string to Date format, to make filtering easier.
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Extract just the data from 2007-02-01 and 2007-02-02.
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]

# Convert columns 3=9 to numeric format.
# ? will be converted to NA.

data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# Create a DateTime field that combines the values
#   in the Date and Time columns.
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# ===============================
# CREATE THE PLOT.
# ===============================

# PLOT 3
png(file = "plot3.png", width=480, height=480)

with(data, plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", ylim=c(0,40), type="n"))
with(data, lines(DateTime, Sub_metering_1, col="black"))
par(new=TRUE)
with(data, plot(DateTime, Sub_metering_2, type="n", ylab = "", ylim=c(0,40)))
with(data, lines(DateTime, Sub_metering_2, col="red"))
par(new=TRUE)
with(data, plot(DateTime, Sub_metering_3, type="n", ylab = "", ylim=c(0,40)))
with(data, lines(DateTime, Sub_metering_3, col="blue"))
par(new=FALSE)

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()