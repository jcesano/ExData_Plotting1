# Read from file - Only the data needed

# Uncomment this line if package is not installed
#install.packages("sqldf")

Sys.setlocale("LC_TIME", "English")
library(sqldf)
path <- "household_power_consumption.txt"
sql <- "select * from file where Date in ('1/2/2007','2/2/2007')"
colClasses <- c(rep('character',9))
data  <- read.csv.sql(path, 
                      sql = sql,
                      sep = ";", header = TRUE, eol="\n", colClasses = colClasses)

# Make Plot 2

# Open Device
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")

# Plot
dates <- paste(data$Date, data$Time)
dates <- strptime(dates, format="%d/%m/%Y %H:%M:%S")
data <- data.frame(FullDate = dates, data)
plot(data$FullDate, as.numeric(data$Global_active_power), 
     ylab = "Global Active Power (kilowatts)", xlab = "",  type = "l")

# Closing Device
dev.off()


##########################################################################################