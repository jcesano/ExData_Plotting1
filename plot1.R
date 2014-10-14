# Read from file - Only the data needed

# Uncomment this line if package is not installed
#install.packages("sqldf")

library(sqldf)
path <- "household_power_consumption.txt"
sql <- "select * from file where Date in ('1/2/2007','2/2/2007')"
colClasses <- c(rep('character',9))
data  <- read.csv.sql(path, 
                      sql = sql,
                      sep = ";", header = TRUE, eol="\n", colClasses = colClasses)

# Make Plot 1

# Open Device
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")

# Plot
hist(as.numeric(data$Global_active_power), main="Global Active Power",  
    xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Closing Device
dev.off()


##########################################################################################