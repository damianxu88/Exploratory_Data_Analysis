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

# Set up variables for margins, positions etc
par(mfrow=c(2,2), 
    mar=c(4,4,2,1), 
    oma=c(0,0,2,0))

# Plot 4
with(
  hhpc_Data, 
  {
  plot(Global_active_power~DateTime, 
       type="l",
       xlab="",
       ylab="Global Active Power")
  plot(Voltage~DateTime, 
       type="l", 
       xlab="",
       ylab="Voltage")
  plot(Sub_metering_1~DateTime, 
       type="l", 
       xlab="",
       ylab="Global Active Power")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", 
         col=c("black", "red", "blue"),
         lty=1, 
         lwd=2.5, 
         bty="n",
         y.intersp = 0.35,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime, 
       type="l", 
       xlab="",
       ylab="Global_Rective_Power")
  })

# Save to png file
dev.copy(png, file="plot4.png", height=480, width=480)

# Close off graphic device
dev.off()

