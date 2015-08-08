# Read the data into R
data <- read.table("./Module4_Week1/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                   check.names=FALSE, stringsAsFactors=FALSE, comment.char="")

# Convert the date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Filter out the unwanted data
dataSub <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]

# Remove the big data from memory
rm(data)

# Plot the histogram
hist(dataSub$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
