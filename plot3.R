### Exploratory Data Analysis
### plot3.R

# Read in the CSV data.
fn_data = "household_power_consumption.txt"
my_data = read.table(fn_data, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
subset_mydata =  my_data[my_data$Date %in% c("1/2/2007","2/2/2007") ,]

# Preparing graph data.
my_datetime = strptime(paste(subset_mydata$Date, subset_mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
my_sm_1 = as.numeric(subset_mydata$Sub_metering_1)
my_sm_2 = as.numeric(subset_mydata$Sub_metering_2)
my_sm_3 = as.numeric(subset_mydata$Sub_metering_3)

# Plot area.
png("plot3.png", width=480, height=480)
plot(my_datetime, my_sm_1, type="l", ylab="Energy sub metering", xlab="", font.lab=2)
lines(my_datetime, my_sm_2, type="l", col="red")
lines(my_datetime, my_sm_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black","red","blue"))
dev.off()


  