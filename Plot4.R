## read data
dataSet <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

## prepare data
dataSet$FormattedDate <- as.Date(dataSet$Date, format ="%d/%m/%Y")
selectedData <- dataSet[dataSet$FormattedDate %in% c(as.Date("2007-02-01", format = "%Y-%m-%d"), as.Date("2007-02-02", format = "%Y-%m-%d")),]
selectedData$DateTime <- strptime(paste(selectedData$Date, selectedData$Time, sep = "/"), format = "%d/%m/%Y/%H:%M:%S")

## prepare plot
png("plot4.png")
par(mfcol = c(2,2))

## plot top left
plot(selectedData$DateTime, selectedData$Global_active_power, xlab = "", ylab = "Global Active Power", main = "", type = "n")
lines(selectedData$DateTime, selectedData$Global_active_power)

## plot bottom left
with(selectedData,{
    plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = "", type = "n")
    lines(DateTime, Sub_metering_1)
    lines(DateTime, Sub_metering_2, col = "red")
    lines(DateTime, Sub_metering_3, col = "blue")
    legend("topright", legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
    }
)

## plot top right
plot(selectedData$DateTime, selectedData$Voltage, xlab = "datetime", ylab = "Voltage", main = "", type = "n")
lines(selectedData$DateTime, selectedData$Voltage)

## plot bottom right
plot(selectedData$DateTime, selectedData$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", main = "", type = "n")
lines(selectedData$DateTime, selectedData$Global_reactive_power)

## close grphics device
dev.off()