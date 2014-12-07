#### Load the data
data <- read.csv('household_power_consumption.txt',na.strings='?',sep=';')
household_power <- subset(data,data$Date %in% c('1/2/2007','2/2/2007')) 
#only need 2-1-2007 and 2-2-2007, data in DD/MM/YYYY format

#### Create datetime formatted column for x axis
datetime_temp <- paste(household_power$Date,household_power$Time) #create datetime vector
datetime_temp_fmt <- strptime(datetime,'%Y-%m-%d %H:%M:%S') #format properly
household_power$datetime <- datetime_temp_fmt #add column to dataframe


#### Plot 2 x 2 graphs
par(mfrow=c(2,2)) ## creates plot area of 2x2

# First - global active power over time
with(household_power,plot(datetime,Global_active_power,xlab='',ylab='Global Active Power',type='n')) # generate plot
with(household_power,lines(datetime,Global_active_power)) #add lines to plot connecting each point

# Second - voltage vs. datetime
with(household_power,plot(datetime,Voltage,xlab='datetime',ylab='Voltage',type='n')) # generate plot
with(household_power,lines(datetime,Voltage)) #add lines to plot connecting each point

# Third - sub metering data over time
with(household_power,plot(datetime,Sub_metering_1,xlab='',ylab='Energy sub metering',type='n')) #create plot
with(household_power,lines(datetime,Sub_metering_1,col='black')) #add sub meter 1 data
with(household_power,lines(datetime,Sub_metering_2,col='red')) #add sub meter 2 data
with(household_power,lines(datetime,Sub_metering_3,col='blue')) #add sub meter 3 data
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),pch='_',bty='n') #add legend

# Fourth - Global reactive power vs. datetime
with(household_power,plot(datetime,Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='n')) # generate plot
with(household_power,lines(datetime,Global_reactive_power)) #add lines to plot connecting each point

####Create 480x480 png file with plot

#if previously created histogram on screen
dev.copy(png,'plot4.png')
dev.off()

#if running for the first time
png(file='plot4.png') #open png device
 ##recreate plot using code above here 
dev.off()