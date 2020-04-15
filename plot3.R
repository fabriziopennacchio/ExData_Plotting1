make_plot3.png <- function(path){    #this is the function to make the plot using your own path and save it in as a png file in your wd
  
  big_file <- read.csv(path,sep=";") #open the file
  big_file$Date<-as.Date(big_file$Date,format ="%d/%m/%Y") #convert the dates from the factor class to the date class
  
  
  big_file_subset1 <- subset(big_file,big_file$Date=="2007/02/01")  #this line is to take only the first day to examinate
  big_file_subset <- subset( big_file,big_file$Date=="2007/02/02")   #this take the second day
  
  global_subset <- rbind(big_file_subset1,big_file_subset)   #here a date frame composed by the two previous day is created with rbind(data.frame())
  global_subset$Sub_metering_1<-as.numeric(as.character(global_subset$Sub_metering_1)) #transform ? in NA
  global_subset$Sub_metering_2<-as.numeric(as.character(global_subset$Sub_metering_2)) #transform ? in NA
  global_subset$Sub_metering_3<-as.numeric(as.character(global_subset$Sub_metering_3)) #transform ? in NA
  
  global_subset$Time <- as.character(global_subset$Time)
  global_subset$Date <- paste(global_subset$Date,global_subset$Time) #because both the days and the times are repeated but their combination are unique. Here I then pasted the times and the dates to obtain unique values
  global_subset$Date <- as.POSIXct(global_subset$Date, format="%Y-%m-%d %H:%M:%S")  #conversion from character to date
  
  plot.new()
  png("plot3.png", width=8, height=7, units="in", res=70)   #png device declaring also the dimension and the resolution of the image
  
  par(mar=c(4,5,5,4))  #define the margins of the image
  
  plot(global_subset$Date,global_subset$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(global_subset$Date,global_subset$Sub_metering_2,col="red")
  lines(global_subset$Date,global_subset$Sub_metering_3,col="blue")
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  dev.off()
  
}
make_plot3.png("put your path here!")
