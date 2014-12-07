#### Load the data
data <- read.csv('household_power_consumption.txt',na.strings='?',sep=';')
household_power <- subset(data,data$Date %in% c('1/2/2007','2/2/2007')) 
#only need 2-1-2007 and 2-2-2007, data in DD/MM/YYYY format

#### Create datetime formatted column for x axis
datetime_temp <- paste(household_power$Date,household_power$Time) #create datetime vector
datetime_temp_fmt <- strptime(datetime,'%Y-%m-%d %H:%M:%S') #format properly
household_power$datetime <- datetime_temp_fmt #add column to dataframe

#### Create time series plot
 with(household_power,plot(datetime,Sub_metering_1,xlab='',ylab='Energy sub metering',type='n')) #create plot
with(household_power,lines(datetime,Sub_metering_1,col='black')) #add sub meter 1 data
with(household_power,lines(datetime,Sub_metering_2,col='red')) #add sub meter 2 data
with(household_power,lines(datetime,Sub_metering_3,col='blue')) #add sub meter 3 data

legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),pch='_') #add legend

####Create 480x480 png file with plot

#if previously created histogram on screen
dev.copy(png,'plot3.png')
dev.off()

#if running for the first time
png(file='plot3.png') #open png device
 with(household_power,plot(datetime,Sub_metering_1,xlab='',ylab='Energy sub metering',type='n')) #create plot
with(household_power,lines(datetime,Sub_metering_1,col='black')) #add sub meter 1 data
with(household_power,lines(datetime,Sub_metering_2,col='red')) #add sub meter 2 data
with(household_power,lines(datetime,Sub_metering_3,col='blue')) #add sub meter 3 data

legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),pch='_') #add legend
dev.off()