plot4<-function(){
  
  #source("plot1.R");
  #source("plot2.R");
  z<-readData1();
  z1<-z;
  plot2();
  
  
  #source("plot3.R");
  par(mfrow=c(2,2));
  plot2();secondplot();plot3();fourthplot();    
  exportPlot("Plot4.png");
}
readData1<-function(){
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
secondplot<-function(){
  plot(z$Time,z$Voltage,type="l",xlab="datetime",ylab="Global_reactive_power")
}
fourthplot<-function(){
  plot(z1$Time,z1$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
}
plot2<-function(){  
  plot(z$Time,z$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")  
}
plot3<-function(){
  plot(z$Time,z$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
  lines(z$Sub_metering_1)
  lines(z$Time,z$Sub_metering_1)
  lines(z$Time,z$Sub_metering_2,col="red")
  lines(z$Time,z$Sub_metering_3,col="blue")
  legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
}