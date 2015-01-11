#Exploratory Data Analysis - Course Project 1 - plot2.R
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
png("plot2.png", width = 480, height = 480)

#Plot the graph
plot(EPC$new_time, EPC$active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" )

#Turn off the PNG graphic device
dev.off()