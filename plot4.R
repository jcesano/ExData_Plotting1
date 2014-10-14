# Read from file - Only the data needed

# Uncomment this line if package is not installed
#install.packages("sqldf")

library(sqldf)
Sys.setlocale("LC_TIME", "English")

path <- "household_power_consumption.txt"
sql <- "select * from file where Date in ('1/2/2007','2/2/2007')"
colClasses <- c(rep('character',9))
data  <- read.csv.sql(path, sql = sql,
                      sep = ";", header = TRUE, eol="\n", colClasses = colClasses)

# Make Plot 4

#Format and convert data
dates <- paste(data$Date, data$Time)
dates <- strptime(dates, format="%d/%m/%Y %H:%M:%S")
data <- data.frame(FullDate = dates, data)

# Open Device
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")

par(mfrow=c(2,2))

# Plot 4-1
plot(data$FullDate, as.numeric(data$Global_active_power), 
     ylab = "Global Active Power", xlab = "",  type = "l")

# Plot 4-2
plot(data$FullDate, as.numeric(data$Voltage), 
     ylab = "Voltage", xlab = "datetime",  type = "l")

# Plot 4-3
plot(data$FullDate, as.numeric(data$Sub_metering_1),
     ylab = "Energy sub metering", xlab = "",  type = "l")
lines(data$FullDate, as.numeric(data$Sub_metering_2), col = "red", type = "l")
lines(data$FullDate, as.numeric(data$Sub_metering_3), col = "blue", type = "l")
legend("topright", lwd = 1, col = c("black","red","blue"), 
       legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

# Plot 4-4
plot(data$FullDate, as.numeric(data$Global_reactive_power), 
     ylab = "Global_reactive_power", xlab = "datetime",  type = "l")

# Closing Device
dev.off()

##########################################################################################