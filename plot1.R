#Setting working directory
setwd('D:/DataScienceSpecialization/4-Exploratory_Data_Analysis/Week1/Project/ExData_Plotting1')

#Downloading data
if (!file.exists('./data'))
{dir.create('./data')}

url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(url,destfile = './data/data.zip',method = 'curl')
rm(url)

#Unzip data
if (!file.exists('./data/household_power_consumption.txt'))
{unzip('./data/data.zip',exdir = './data')}

#Reading data and formatting
data <- read.csv('./data/household_power_consumption.txt',sep=';')

data$Date <- as.Date(data$Date,'%d/%m/%Y')


#Subsetting 
subdata <- subset(data,Date == '2007-02-01' | Date == '2007-02-02')
rm(data)

#Plotting
png(filename = 'plot1.png',bg= 'transparent', width=480, height=480)
par(mar=c(4,4,2,1),oma=c(4.5,4.5,3,1))

hist(as.numeric(subdata$Global_active_power),col = 'red',ylab = 'Frequency',
     xlab = 'Global Active Power (kilowatts)',main = 'Global Active Power')
mtext('Plot 1',outer = TRUE)

dev.off()
