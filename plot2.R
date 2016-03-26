### Exploratory Data Analysis
### plot2.R

# Read in the CSV data.
fn_data = "household_power_consumption.txt"
my_data = read.table(fn_data, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
subset_mydata =  my_data[my_data$Date %in% c("1/2/2007","2/2/2007") ,]

# Preparing graph data.
my_datetime <- strptime(paste(subset_mydata$Date, subset_mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
global_active_power <- as.numeric(subset_mydata$Global_active_power)

# Plot area.
png("plot2.png", width=480, height=480)
plot(my_datetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", font.lab=2)
dev.off()