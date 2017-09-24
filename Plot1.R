dataSet <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
dataSet$Date <- as.Date(dataSet$Date, format ="%d/%m/%Y")
selectedData <- dataSet[dataSet$Date %in% c(as.Date("2007-02-01", format = "%Y-%m-%d"), as.Date("2007-02-02", format = "%Y-%m-%d")),]
png("plot1.png")
hist(selectedData$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()