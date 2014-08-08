plot1 <- function(file) {
    ## This function plots a graph of Global Active Power measurements between
    ## 01/02/2007 and 02/02/2007.
    df <- read.csv2(file, na.string = "?", dec = ".")
    
    ## Vector of logicals for 01/02/2007 and 02/02/2007 observations
    s <- df$Date %in% c("1/2/2007", "2/2/2007")
    
    df1 <- subset(df, subset = s)
    t <- sapply(seq(nrow(df1)), function(x) paste(df1$Date[x], df1$Time[x]))
    df1$Date <- as.Date(df1$Date, format = "%d/%m/%Y")
    df1$Time <- strptime(t, format = "%d/%m/%Y %H:%M:%S")
    
    ## plot graph
    png(filename = "plot1.png", width = 480, height = 480)
    with(df1, hist(Global_active_power, 
                   col = "red",
                   main = "Global Active Power",
                   xlab = "Global Active Power (kilowatts)")
         )
    dev.off()
}

plot1("../household_power_consumption.txt")
