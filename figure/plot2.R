#### Load the data
data <- read.csv('household_power_consumption.txt',na.strings='?',sep=';')
household_power <- subset(data,data$Date %in% c('1/2/2007','2/2/2007')) 
#only need 2-1-2007 and 2-2-2007, data in DD/MM/YYYY format

#### Create datetime formatted column for x axis
datetime_temp <- paste(household_power$Date,household_power$Time) #create datetime vector
datetime_temp_fmt <- strptime(datetime_temp,'%d/%m/%Y %H:%M:%S') #format properly
household_power$datetime <- datetime_temp_fmt #add column to dataframe

#### Create time series plot
with(household_power,plot(datetime,Global_active_power,xlab='',ylab='Global Active Power (kilowatts)',type='n')) # generate plot

with(household_power,lines(datetime,Global_active_power)) #add lines to plot connecting each point

####Create 480x480 png file with plot

#if previously created histogram on screen
dev.copy(png,'plot2.png')
dev.off()

#if running for the first time
png(file='plot2.png') #open png device
with(household_power,plot(datetime,Global_active_power,xlab='',ylab='Global Active Power (kilowatts)',type='n')) # generate plot
with(household_power,lines(datetime,Global_active_power)) #add lines to plot connecting each point
dev.off()