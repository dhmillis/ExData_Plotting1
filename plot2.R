# Exploratory Data Analysis
# David H. Millis
# 05-10-2014
# Plot 2

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

# PLOT 2
png(file = "plot2.png", width=480, height=480)

with(data, plot(DateTime, Global_active_power, type="n", xlab="", ylab = "Gloabl Active Power (kilowatts)"))
with(data, lines(DateTime, Global_active_power))

dev.off()