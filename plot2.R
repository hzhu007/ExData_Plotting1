plot2 <- function(){
    rawData <- read.csv("household_power_consumption.txt", sep = ";", 
                        colClasses = "character", nrows = 70000)
    data <- subset(rawData, Date == "1/2/2007" | Date == "2/2/2007")
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    data$timetemp <- paste(data$Date, data$Time)
    data$Time <- strptime(data$timetemp, format = "%Y-%m-%d %H:%M:%S")
    x <- data$Time
    y <- as.numeric(data$Global_active_power)
    plot(x, y, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    dev.copy(png, file = "plot2.png")
    dev.off()
}
