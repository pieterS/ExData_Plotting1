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

png(filename = "plot2.png",
    height = 480,
    width = 480
    )

## plot the global active power in time

plot(power_subset$DateTime,
     power_subset$Global_active_power,
     type = "l",
     xlab ="",
     ylab = "Global Active Power (kilowatts)"
     )

## close the plotting device
dev.off()