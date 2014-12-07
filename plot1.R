plot1 <- function(x){
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
png(file="plot1.png",width=480,height=480)
par(mar=c(5,4,3,2))
hist(sub_edata$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
}

