# Import 'household_power_consumption' dataset
hhpc_Path <- "./household_power_consumption/household_power_consumption.txt"
hhpc_FullData <- read.csv(hhpc_Path, nrows=2075259, sep=";", na.strings="?")

# Set 'Date' column to date class
hhpc_FullData$Date <- as.Date(hhpc_FullData$Date, format="%d/%m/%Y")

# Subset the entire dataset between '2007-02-01' and '2007-02-02'
hhpc_Data <- subset(hhpc_FullData, Date >= "2007-02-01" & Date <= "2007-02-02")

# Clean up full dataset
rm(hhpc_FullData)

# Convert 'Date' and 'Time' into date/time class
hhpc_Data$DateTime <- with(hhpc_Data, as.POSIXct(paste(Date, Time, sep = " ")))

# Plot 1: histogram
with(hhpc_Data, 
     hist(Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     col="red"))

# Save to png file
dev.copy(png, file="plot1.png", height=480, width=480)

# Close off graphic device
dev.off()

