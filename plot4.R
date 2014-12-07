plot4 <- function(x){
print("Reading household_power_consumption.txt ...")	
e_data <- read.table("household_power_consumption.txt",  sep=";", header=TRUE,colClasses = c("character"   ,   "character" ,rep("numeric",1,7)), na.strings="?" )
## Convert Time from charater to date/time type
print("Converting Time ...")
e_data$Time<-strptime(paste(e_data$Date, e_data$Time),"%d/%m/%Y  %H:%M:%S")
## Convert Date from character to date type
print("Converting Date ...")
e_data$Date <- as.Date(e_data$Date, format="%d/%m/%Y")
## Subset the date for the date ranges we are working with
sub_edata<-subset(e_data, Date>='2007-02-01' & Date<='2007-02-02')
## Remove e_data to reduce memory footprint
rm(e_data)
## Open device for PNG file
png(file="plot4.png",width=480,height=480)
par(mfrow = c(2,2), mar=c(5,4,3,1))
## 1
plot(sub_edata$Time, sub_edata$Global_active_power, xlab="", ylab="Global Active Power", lty="solid", type="l")
## 2
plot(sub_edata$Time, sub_edata$Voltage, xlab="datetime", ylab="Voltage", lty="solid", type="l")
## 3
plot(sub_edata$Time, sub_edata$Sub_metering_1, xlab="", ylab="Energy sub metering", lty="solid", type="l", col="black")
lines(sub_edata$Time, sub_edata$Sub_metering_2, lty="solid", type="l", col="red")
lines(sub_edata$Time, sub_edata$Sub_metering_3, lty="solid", type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=1, bty="n")
## 4
plot(sub_edata$Time, sub_edata$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", lty="solid", type="l")
dev.off()
}

