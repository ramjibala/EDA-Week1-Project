library(graphics)

plot1 <- function(){
        
        fileName        <- "C:/Users/sg0441538/Documents/Ramji/R/eda/household_power_consumption.txt"

        ## READ DATA
        consumptionData <- read.csv(fileName, sep=";", header=T, stringsAsFactors = F)
        limitedData     <- subset(consumptionData, as.Date(consumptionData$Date, "%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y") | as.Date(consumptionData$Date, "%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y"))

        ## SET DEVICE TYPE TO PNG, RUN GRAPHIC, UNSET DEVICE
        png(file = "plot1.png")
        hist(as.numeric(limitedData$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", mar=c(4,6,2,0), oma=c(3,3,3,3))
        dev.off()
}