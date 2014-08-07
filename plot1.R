plot1 <- function(file) {
    ## This function returns a data frame of householde power consumption measurements
    df <- read.csv2(file, na.string = "?", dec = ".")
    df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
    df$Time <- strptime(df$Time, format = "%H:%M:%S")
    
    # Vector of logicals for 01/02/2007 and 02/02/2007 observations
    s <- df$Date == as.Date(c("1/2/2007", "2/2/2007"), format = "%d/%m/%Y")
    
    png(filename = "plot1.png", width = 480, height = 480)
    with(subset(df, subset = s),  
         hist(df$Global_active_power, 
              col = "red", 
              main = "Global Active Power", 
              xlab = "Global Active Power (kilowatts)")
         )
    dev.off()
}

plot1("household_power_consumption.txt")
