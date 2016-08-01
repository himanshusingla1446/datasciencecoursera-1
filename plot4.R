# R file for plotting Plot4 graph
# Load data.table package
library(data.table)

# Read and extract the classes of columns
read1 <- read.table("household_power_consumption.txt",sep =";",nrows=100,header = TRUE)
classes <- sapply(read1,class)

# Read the txt file using fread function 
fileread <- fread("household_power_consumption.txt",colClasses= classes,sep=";",header = TRUE,na.strings= "?")

# Filter the data for 1/1/2007 and 1/2/2007 only
file2007 <- subset(fileread,fileread$Date == "1/2/2007" | fileread$Date == "2/2/2007")
rm(fileread)

# Change the character date into date format
file2007 <- transform(file2007, Date = as.Date(file2007$Date,"%d/%m/%Y"))

# Create datetime field
file2007$DateTime <- as.POSIXct(paste(file2007$Date,file2007$Time))

# Open the PNG graphical device for plotting graphs.
png(file="plot4.png",width=480, height=480)

# Set the graphical output for 4 graphs
par(mfrow=c(2,2),mar=c(6,6,2,1))

# Plot the 1st graph
plot(file2007$DateTime , file2007$Global_active_power,type = "l",xlab="",ylab="Global Active Power")

# Plot the 2nd graph
plot(file2007$DateTime , file2007$Voltage,type = "l",xlab="datetime",ylab="Voltage")

# Plot the 3rd graph
plot(file2007$DateTime , file2007$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(file2007$DateTime , file2007$Sub_metering_2,col= "red")
lines(file2007$DateTime , file2007$Sub_metering_3,col= "blue")
legend("topright",lty =c (1,1,1), col= c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Plot the 4th graph
plot(file2007$DateTime , file2007$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")

# Turn off the graphical device output
dev.off()
