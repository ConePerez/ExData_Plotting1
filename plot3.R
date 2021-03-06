## File plot3.R
## The file contains code to produce a plot in the screen and then copy it to a PNG file.

## Usage: The file must be loaded into an R workspace with the run function or copy and paste all the lines in the prompt.
## The sequence of the lines below do the following actions:

## 1.- Downloads a zip file containing the data to be plotted
## 2.- Opens a connection to the downloaded file.
## 3.- Reads the files into a data frame objet
## 4.- Create a subset of the data that is going to be used in the plot
## 5.- Remove the complete data set to release memory
## 6.- Set the global parameter to one plot per device.
## 7.- Create the scatter plot
## 7.1.- Add the points for another variable of the data set
## 7.2.- Add the points for another variable of the data set
## 7.3.- Add the legends to the plot.
## 8.- Copy the scatter plot from the screen device to the PNG device
## 9.- Close the PNG device

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")
f = unz(description="data.zip",filename="household_power_consumption.txt")
exp.proj1 = read.delim(f, sep=";", na.string="?")
x = subset(exp.proj1, (Date == "1/2/2007" | Date == "2/2/2007"))
remove(exp.proj1)
t <- paste(x$Date, x$Time)
t <- strptime(t, "%d/%m/%Y %H:%M:%S")
par(mfrow=c(1,1))
plot(t,x$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(t,x$Sub_metering_2, type="l", col="red")
points(t,x$Sub_metering_3, type="l", col="blue")
legend("topright", pch="―", col=c("black","red","blue"), legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
dev.copy(png, file="plot3.png", width=1400, height=504)
dev.off()