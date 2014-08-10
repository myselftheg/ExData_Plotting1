plot3<-function(){
  z<-readData()
  plot(z$Time,z$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
  lines(z$Sub_metering_1)
  lines(z$Time,z$Sub_metering_1)
  lines(z$Time,z$Sub_metering_2,col="red")
  lines(z$Time,z$Sub_metering_3,col="blue")
  legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  exportPlot("plot3.png")
  
}
readData<-function(){
  data<-read.table("household_power_consumption.txt",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),header=TRUE,na.string="?",strip.white=TRUE,sep=";");
  data$Date<-as.Date(data$Date,format="%d/%m/%Y");
  data$Time<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")
  z<-data[data$Date>="2007-02-01"&data$Date<="2007-02-02",];
  z
}
exportPlot<-function(fileName)
{
  dev.copy(png,file=fileName,width=480,height=480);
  dev.off();
}