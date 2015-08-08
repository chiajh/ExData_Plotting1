# Read the data into R
data <- read.table("./Module4_Week1/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                   check.names=FALSE, stringsAsFactors=FALSE, comment.char="")

# Convert the date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Take the wanted data
subData <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]

# Remove the big data from memory
rm(data)

datetime <- strptime(paste(as.character(subData$Date), subData$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(datetime, subData$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(datetime, subData$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subData$Sub_metering_2, type="l", col="red")
lines(datetime, subData$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
plot(datetime, subData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Save to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

