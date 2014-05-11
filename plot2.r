## Plot the second plot
plot2 <- function (filename = "household_power_consumption.txt") {
  library(lattice)
  ## read data
  DT <- read.table(filename, header = TRUE, sep = ";", na.strings = "?")
  DT$Date <- as.Date(DT$Date, format = "%d/%m/%Y")
  myData <- DT[DT$Date == "2007-02-01" | DT$Date == "2007-02-02",]
  x <- paste(as.character(myData$Date), as.character(myData$Time))
  myData$TS <- as.POSIXct(x)
  ##define the destination file
  png(filename = "plot2.png",
    width = 480, height = 480, units = "px")
  ## plot
  plot(myData$Global_active_power ~ myData$TS, 
    type = "l",
    ylab = "Global Active Power (kilowatts)",
    xlab = "")
  ## dev off to finish
  dev.off()
}
