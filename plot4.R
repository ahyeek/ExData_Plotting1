### Exploratory Data Analysis
### plot4.R

# Read in the CSV data.
fn_data = "household_power_consumption.txt"
my_data = read.table(fn_data, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
subset_mydata =  my_data[my_data$Date %in% c("1/2/2007","2/2/2007") ,]

# Preparing graph data.
my_datetime <- strptime(paste(subset_mydata$Date, subset_mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(subset_mydata$Global_active_power)
global_reactive_power <- as.numeric(subset_mydata$Global_reactive_power)
voltage <- as.numeric(subset_mydata$Voltage)
my_sm_1 <- as.numeric(subset_mydata$Sub_metering_1)
my_sm_2 <- as.numeric(subset_mydata$Sub_metering_2)
my_sm_3 <- as.numeric(subset_mydata$Sub_metering_3)

# Plot area.
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(my_datetime, global_active_power, type="l", xlab="", ylab="Global Active Power", font.lab=2, cex=0.8)

plot(my_datetime, voltage, type="l", xlab="datetime", ylab="Voltage", font.lab=2, cex=0.8)

plot(my_datetime, my_sm_1, type="l", ylab="Energy sub metering", xlab="", font.lab=2, cex=0.8)
lines(my_datetime, my_sm_2, type="l", col="red")
lines(my_datetime, my_sm_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n", cex=0.8)

plot(my_datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", font.lab=2, cex=0.8)

dev.off()
