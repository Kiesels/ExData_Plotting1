## load the reduced dataset from directory Date == "2007-02-01 CET" | Date == "2007-02-02 CET"
## rawdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
## rawdata$Date <- as.POSIXct(as.character(rawdata$Date), format = "%d/%m/%Y")
## data <- subset(rawdata, Date == "2007-02-01 CET" | Date == "2007-02-02 CET")
## write.csv(data, "power.csv")
library(datasets)
library(lubridate)
setwd("C:\\Users\\HP\\Documents\\Tibi\\R\\Exploratory")
data <- read.csv("power.csv")

## plot4
data$Time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

par(mfrow = c(2, 2))

        ##1,1
plot(data$Time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

        ##1,2
plot(data$Time, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

        ##2,1
plot(data$Time, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, type="l", col="red")
lines(data$Time, data$Sub_metering_3, type="l", col="blue")
legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, cex=0.5, bty="n")  

        ##2,2
plot(data$Time, data$Global_reactive_power, type="l", xlab="", ylab="Global_reactive_power")


dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()


