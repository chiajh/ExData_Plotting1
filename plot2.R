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

## Plot 2
plot(datetime, subData$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
