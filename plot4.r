## Plot the last plot
plot4 <- function (filename = "household_power_consumption.txt") {
  library(lattice)
  ## read data
  DT <- read.table(filename, header = TRUE, sep = ";", na.strings = "?")
  DT$Date <- as.Date(DT$Date, format = "%d/%m/%Y")
  myData <- DT[DT$Date == "2007-02-01" | DT$Date == "2007-02-02",]
  x <- paste(as.character(myData$Date), as.character(myData$Time))
  myData$TS <- as.POSIXct(x)
  ## define destination file
  png(filename = "plot4.png",
    width = 480, height = 480, units = "px")
  ## define the plot area
  par(mfrow = c(2, 2), 
    mar = c(4, 4, 2, 1), 
    oma = c(0, 0, 2, 0))
  ## initiate the plot
  with(myData, {
    ## plot the 1x1 plot
    plot(Global_active_power ~ TS, 
      type = "l",
      ylab = "Global Active Power",
      xlab = "")
    ## plot the 1x2 plot
    plot(Voltage ~ TS, 
      type = "l",
      ylab = "Voltage",
      xlab = "datetime")
    ## plot the 2x1 plot
    plot(myData$Sub_metering_1 ~ myData$TS, 
      type = "l",
      ylab = "Energy sub metering",
      xlab = "")
    ## add the second line - red
    lines(myData$Sub_metering_2 ~ myData$TS,
      col = "red")
    ## add the third line - blue
    lines(myData$Sub_metering_3 ~ myData$TS,
      col = "blue")
    ## add the legend
    legend("topright", 
      c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
      col = c("black", "red", "blue"),
      lty = c(1, 1, 1),
      bty = 'n')
    ## plot the 2x2 plot
    plot(Global_reactive_power ~ TS, 
      type = "l",
      ylab = "Global_reactive_power",
      xlab = "datetime")
  })
  ## dev.off to finish
  dev.off()
}
