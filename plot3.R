## plot the first plot for first exploratory data analysis programming
## assignment. 

## read the data

power_data <- read.table("household_power_consumption.txt",
                         header=TRUE,
                         sep=";",
                         quote="",
                         na.strings="?"
)

## subset the data 

power_subset <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007"),]

## create a datetime column

power_subset$DateTime <- strptime(paste(power_subset$Date, power_subset$Time),
                                  format = "%d/%m/%Y %H:%M:%S")

## initialize the png plot device

png(filename = "plot3.png",
    height = 480,
    width = 480
    )

## plot the sub metering in time

plot(power_subset$DateTime,
     power_subset$Sub_metering_1,
     type = "l",
     xlab ="",
     ylab = "Energy sub metering"
     )

## add sub metering 2 in red

lines(power_subset$DateTime,
      power_subset$Sub_metering_2,
      type = "l",
      col="red"
      )

## add sub metering 3 in blue

lines(power_subset$DateTime,
      power_subset$Sub_metering_3,
      type = "l",
      col="blue"
      )

## add the legend

legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1
       )

## close the plotting device
dev.off()