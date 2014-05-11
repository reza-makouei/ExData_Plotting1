## Plot the plot
plot1 <- function (filename = "household_power_consumption.txt") {
  library(datasets)
  ## read data
  DT <- read.table(filename, header = TRUE, sep = ";", na.strings = "?")
  DT$Date <- as.Date(DT$Date, format = "%d/%m/%Y")
  myData <- DT[DT$Date == "2007-02-01" | DT$Date == "2007-02-02",]
  ## define destination file
  png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
  ## plot the histogram
  hist(myData$Global_active_power, 
    col = "red", 
    main = "Global Active Power", 
    xlab = "Global Active Power (kilowatts)")
  ## dev off to finish
  dev.off()
}
