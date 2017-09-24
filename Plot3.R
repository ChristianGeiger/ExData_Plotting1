dataSet <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

dataSet$FormattedDate <- as.Date(dataSet$Date, format ="%d/%m/%Y")

selectedData <- dataSet[dataSet$FormattedDate %in% c(as.Date("2007-02-01", format = "%Y-%m-%d"), as.Date("2007-02-02", format = "%Y-%m-%d")),]

selectedData$DateTime <- strptime(paste(selectedData$Date, selectedData$Time, sep = "/"), format = "%d/%m/%Y/%H:%M:%S")

png("plot3.png")

with(selectedData,{
    plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = "", type = "n")
    lines(DateTime, Sub_metering_1)
    lines(DateTime, Sub_metering_2, col = "red")
    lines(DateTime, Sub_metering_3, col = "blue")
    legend("topright", legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
    })

dev.off()