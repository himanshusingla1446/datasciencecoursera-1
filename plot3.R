# R file for plotting Plot3 graph
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
png(file="plot3.png",width=480, height=480)


# Plot the graph
plot(file2007$DateTime , file2007$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(file2007$DateTime , file2007$Sub_metering_2,col= "red")
lines(file2007$DateTime , file2007$Sub_metering_3,col= "blue")
legend("topright",lty =c (1,1,1), col= c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


# Turn off the graphical device output
dev.off()
