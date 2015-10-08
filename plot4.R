plot4 <- function(){
    rawData <- read.csv("household_power_consumption.txt", sep = ";", 
                        colClasses = "character", nrows = 70000)
    data <- subset(rawData, Date == "1/2/2007" | Date == "2/2/2007")
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    data$datetime <- paste(data$Date, data$Time)
    data$datetime <- strptime(data$datetime, format = "%Y-%m-%d %H:%M:%S")
    x <- data$datetime
    
    png(file = "plot4.png", 480, 480)
    par(mfrow = c(2, 2), lwd = 0.1)
    
    y <- as.numeric(data$Global_active_power)
    plot(x, y, type = "l", xlab = "", ylab = "Global Active Power")
    
    y <- as.numeric(data$Voltage)
    plot(x, y, type = "l", xlab = "datetime", ylab = "Voltage")
    
    y1 <- as.numeric(data$Sub_metering_1)
    y2 <- as.numeric(data$Sub_metering_2)
    y3 <- as.numeric(data$Sub_metering_3)
    plot(x, y1, xlab = "", ylab = "Energy sub metering", type = "n")
    points(x, y1, type = "l", col = "black")
    points(x, y2, type = "l", col = "red")
    points(x, y3, type = "l", col = "blue")
    legend("topright", lty = "solid", bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           col = c("black", "red", "blue"))
    
    y <- as.numeric(data$Global_reactive_power)
    plot(x, y, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
    
    dev.off()
}
