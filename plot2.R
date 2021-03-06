plot2 <- function(file) {
    ## This function plots a graph of Global Active Power measurements between
    ## 01/02/2007 and 02/02/2007.
    df <- read.csv2(file, na.string = "?", dec = ".")
    
    ## Vector of logicals for 01/02/2007 and 02/02/2007 observations
    s <- df$Date %in% c("1/2/2007", "2/2/2007")
    
    df1 <- subset(df, subset = s)
    t <- sapply(seq(nrow(df1)), function(x) paste(df1$Date[x], df1$Time[x]))
    df1$Date <- as.Date(df1$Date, format = "%d/%m/%Y")
    df1$Time <- strptime(t, format = "%d/%m/%Y %H:%M:%S")
    
    ## plot graph to png file
    png(filename = "plot2.png", width = 480, height = 480)
    with(df1, plot(Time, Global_active_power,
                   type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    )
    dev.off()
}

plot2("../household_power_consumption.txt")
