plot4 <- function(file) {
    ## This function plots a graph of Global Active Power measurements between
    ## 01/02/2007 and 02/02/2007.
    df <- read.csv2(file, na.string = "?", dec = ".")
    
    ## Vector of logicals for 01/02/2007 and 02/02/2007 observations
    s <- df$Date %in% c("1/2/2007", "2/2/2007")
    
    df1 <- subset(df, subset = s)
    t <- sapply(seq(nrow(df1)), function(x) paste(df1$Date[x], df1$Time[x]))
    df1$Date <- as.Date(df1$Date, format = "%d/%m/%Y")
    df1$Time <- strptime(t, format = "%d/%m/%Y %H:%M:%S")
    
    ## draw plot on png device
    png(filename = "plot4.png", width = 480, height = 480)
    
    par(mfrow = c(2,2))
    with(df1, {
         plot(Time, Global_active_power,type = "l", 
              xlab = "", ylab = "Global Active Power")
         plot(Time, Voltage,type = "l", 
              xlab = "datetime", ylab = "Voltage")
         plot(Time, Sub_metering_1, type = "n",
              xlab = "", ylab = "Energy sub metering")
         points(Time, Sub_metering_1, type = "l", col = "black")
         points(Time, Sub_metering_2, type = "l", col = "red")
         points(Time, Sub_metering_3, type = "l", col = "blue")
         legend("topright", lty = 1, col = c("black", "red", "blue"), bty = "n",
                legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
         plot(Time, Global_reactive_power,type = "l", 
              xlab = "datetime", ylab = "Global_reactive_power")
         })
    
    dev.off()
}

plot4("../household_power_consumption.txt")
