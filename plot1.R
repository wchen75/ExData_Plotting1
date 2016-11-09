mydata <- read.table("household_power_consumption.txt", header=TRUE,sep=";", stringsAsFactors = FALSE)

mydata$jd1 <- as.POSIXct(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")
mydata1 <- subset(mydata, mydata$jd1 >= "2007-02-01" & mydata$jd1 < "2007-02-03" )
attach(mydata1)
Global_active_power <- as.numeric(Global_active_power)
##Global_reactive_power <- as.numeric(Global_reactive_power)
##Voltage <- as.numeric(Voltage)
##Sub_metering_1 <- as.numeric(Sub_metering_1)
##Sub_metering_2 <- as.numeric(Sub_metering_2)
##Sub_metering_3 <- as.numeric(Sub_metering_3)

hist(Global_active_power, col = "red",  main = "Global Active Power", xlab = "Global Active Power (kilowatts)")                            
dev.copy(png,"plot1.png")

dev.off()