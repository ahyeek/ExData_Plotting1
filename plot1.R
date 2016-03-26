### Exploratory Data Analysis
### plot1.R

# Read in the CSV data.
fn_data = "household_power_consumption.txt"
my_data = read.table(fn_data, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
subset_mydata =  my_data[my_data$Date %in% c("1/2/2007","2/2/2007") ,]
names(subset_mydata)

# Preparing graph data.
global_active_power = as.numeric(subset_mydata$Global_active_power)

# Plot area.
png("plot1.png", width=480, height=480)
hist(global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", font.lab=2)
dev.off()
