#Exploratory Data Analysis - Course Project 1 - plot3.R
# The data file is downloaded and unzipped and kept in the current folder
# Datafile name is: household_power_consumption.txt
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- "household_power_consumption.zip"

# download the file
download.file(fileUrl, destfile)

# Set the file to read
datafile <- file("./household_power_consumption.txt", "r");

# Read in the data into a data frame for the given dates
EPC <- read.table(text = grep("^[1,2]/2/2007", readLines(datafile), value = TRUE), sep = ";", skip = 0, na.strings = "?", stringsAsFactors = FALSE)

#Rename the columns of the data frame
names(EPC) <- c("date", "time", "active_power", "reactive_power", "voltage", "intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")

#Add a new column "new_time"
EPC$new_time <- as.POSIXct(paste(EPC$date, EPC$time), format = "%d/%m/%Y %T")

#Open a PNG graphic device with required heigth and width
png("plot3.png", width = 480, height = 480)

#Plot the graph
with(EPC, {
  plot(new_time, sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering") 
  lines(new_time, sub_metering_2, col = "red") 
  lines(new_time, sub_metering_3, col = "blue") 
  legend("topright", col = c("black", "red", "blue"), cex = 0.8, lty = 1, 
         legend = c("Sub_metering_1", 
                    "Sub_metering_2", 
                    "Sub_metering_3"))
})

#Turn off the PNG graphic device
dev.off()