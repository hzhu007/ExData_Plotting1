plot1 <- function(){
    rawData <- read.csv("household_power_consumption.txt", sep = ";", 
                        colClasses = "character", nrows = 70000)
    data <- subset(rawData, Date == "1/2/2007" | Date == "2/2/2007")
    x <- as.numeric(data$Global_active_power)
    hist(x, main = "Global Active Power", 
         col = "red", xlab = "Global Active Power (kilowatts)")
    dev.copy(png, file = "plot1.png")
    dev.off()
}
