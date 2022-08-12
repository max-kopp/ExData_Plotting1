# Download files
setwd("C:/Users/mk11_/Desktop/Coursera/John Hopkins Data Science/ExploratoryDataAnalysis/ExData_Plotting1")
fileName <- "electricData"
if(!file.exists(fileName)&!file.exists("household_power_consumption.txt")) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, fileName)
}
if(!file.exists("household_power_consumption.txt")) {
    unzip(fileName)
    unlink(fileName)
}

# Load in data
power <- read.table("household_power_consumption.txt", header=TRUE, 
                    sep=";", na.strings="?")
power_sub <- subset(power, is.element(power$Date, c("1/2/2007", "2/2/2007")))

# Convert the Date and Time variables
power_sub$Date <- as.Date(power_sub$Date, format="%d/%m/%Y")
time <- as.POSIXct(paste(power_sub$Date, power_sub$Time))

# Prepare file
png(file="plot3.png", width=480, height=480)

# Create plot
plot(time, power_sub$Sub_metering_1, col="black", type="l", 
     xlab="", ylab="Energy sub metering")
lines(time, power_sub$Sub_metering_2, col="red")
lines(time, power_sub$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1)

# Save file
dev.off()
