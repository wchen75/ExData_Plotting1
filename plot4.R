mydata <- read.table("household_power_consumption.txt", header=TRUE,sep=";", stringsAsFactors = FALSE)

mydata$jd1 <- as.POSIXct(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")
mydata1 <- subset(mydata, mydata$jd1 >= "2007-02-01" & mydata$jd1 < "2007-02-03" )
attach(mydata1)
Global_active_power <- as.numeric(Global_active_power)
Global_reactive_power <- as.numeric(Global_reactive_power)
Voltage <- as.numeric(Voltage)
Sub_metering_1 <- as.numeric(Sub_metering_1)
Sub_metering_2 <- as.numeric(Sub_metering_2)
Sub_metering_3 <- as.numeric(Sub_metering_3)

png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = NA)

par(mfrow = c(2, 2))     
mar = c(2, 1.5, 1, 1)

with(power, {
  plot(jd1, Global_active_power, type = "l", xlab = "") 
  plot(jd1, Voltage, type = "l", xlab = "datetime")
  plot(jd1, Sub_metering_1, type = "l",                                        
       ylab = "Energy sub metering", xlab = " ")
  lines(jd1,Sub_metering_2, lwd=1, col="red")
  lines(jd1,Sub_metering_3, lwd=1, col="blue")
  legend("topright", bty = "n", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd=c(2,2,2), col=c("black","red","blue"))
  
  plot(jd1, Global_reactive_power, type = "l", xlab = "datetime")
})

dev.off()
   