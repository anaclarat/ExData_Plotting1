#Setting working directory
setwd('D:/DataScienceSpecialization/4-Exploratory_Data_Analysis/Week1/Project/ExData_Plotting1')

#Downloading data
if (!file.exists('./data'))
{dir.create('./data')}

url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(url,destfile = './data/data.zip',method = 'curl')

#Unzip data
if (!file.exists('./data/household_power_consumption.txt'))
{unzip('./data/data.zip',exdir = './data')}

#Reading data and formatting
data <- read.csv('./data/household_power_consumption.txt',sep=';')

data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))
data$Date <- as.Date(data$Date,'%d/%m/%Y')

#Subsetting
subdata <- subset(data,Date == '2007-02-01' | Date == '2007-02-02')
rm(data)

#Plotting
png(filename = 'plot2.png',bg= 'transparent', width=480, height=480)
plot(as.numeric(subdata$Global_active_power)~subdata$DateTime,xlab = "",
     ylab = 'Global Active Power (kilowatts)',type='l')
mtext(title('Plot 2'))

dev.off()