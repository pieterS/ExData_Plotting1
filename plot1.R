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

## initialize the png plot device

png(filename = "plot1.png",
    height = 480,
    width = 480
    )

## plot the histogram, without axes

hist(power_subset$Global_active_power,
     xlab= "Global Active Power (kilowatts)",
     col = "red",
     main = "Global Active Power",
     xlim = c(0,8),
     yaxt='n',
     xaxt='n'
     )

## plot the axis

axis(side=1, at=seq(0,6, 2) )
axis(side=2, at=seq(0,1200, 200) )

## close the plot device

dev.off()
