plot3 <- function(){
    rawData <- read.csv("household_power_consumption.txt", sep = ";", 
                        colClasses = "character", nrows = 70000)
    data <- subset(rawData, Date == "1/2/2007" | Date == "2/2/2007")
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    data$timetemp <- paste(data$Date, data$Time)
    data$Time <- strptime(data$timetemp, format = "%Y-%m-%d %H:%M:%S")
    x <- data$Time
    
    y1 <- as.numeric(data$Sub_metering_1)
    y2 <- as.numeric(data$Sub_metering_2)
    y3 <- as.numeric(data$Sub_metering_3)
    
    png(file = "plot3.png", 480, 480)
    
    plot(x, y1, xlab = "", ylab = "Energy sub metering", type = "n")
    points(x, y1, type = "l", col = "black")
    points(x, y2, type = "l", col = "red")
    points(x, y3, type = "l", col = "blue")
    legend("topright", col = c("black", "red", "blue"), lty = "solid",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    dev.off()
}
