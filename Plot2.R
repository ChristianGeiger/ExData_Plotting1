dataSet <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
dataSet$FormattedDate <- as.Date(dataSet$Date, format ="%d/%m/%Y")
selectedData <- dataSet[dataSet$FormattedDate %in% c(as.Date("2007-02-01", format = "%Y-%m-%d"), as.Date("2007-02-02", format = "%Y-%m-%d")),]
selectedData$DateTime <- strptime(paste(selectedData$Date, selectedData$Time, sep = "/"), format = "%d/%m/%Y/%H:%M:%S")
png("plot2.png")
plot(selectedData$DateTime, selectedData$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", main = "", type = "n")
lines(selectedData$DateTime, selectedData$Global_active_power)
dev.off()