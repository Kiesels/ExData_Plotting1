## load the reduced dataset from directory Date == "2007-02-01 CET" | Date == "2007-02-02 CET"
## in order to reduce the processing time in my old PC I made the subsetting separetly
## rawdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
## rawdata$Date <- as.POSIXct(as.character(rawdata$Date), format = "%d/%m/%Y")
## data <- subset(rawdata, Date == "2007-02-01 CET" | Date == "2007-02-02 CET")
## write.csv(data, "power.csv")
library(datasets)
library(lubridate)
setwd("C:\\Users\\HP\\Documents\\Tibi\\R\\Exploratory")
data <- read.csv("power.csv")

## plot2
data$Time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
plot(data$Time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()
