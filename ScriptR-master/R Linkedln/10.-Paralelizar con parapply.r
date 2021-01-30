df<-as.data.frame(read.csv("C:/Users/dell/OneDrive - Universidad de Guayaquil/Analista de datos - Linkedin Learning/R/base_datos_2008.csv"))

df2<-df[,c("CarrierDelay", "WeatherDelay", "NASDelay", "SecurityDelay","LateAircraftDelay")]

head(df2)

start<-Sys.time()

result2<-apply(df2, 1,mean,na.rm=TRUE)

print(Sys.time()-start)




#vamos a paralelizar acorde a los nucleos de nuestro ordenador para procesos mas rapidos

require(parallel)

ncl<-detectCores()

clc<-makeCluster(ncl-1)

start<-Sys.time()

result2<-parApply(cl = clc,df2, 1,
                  mean,na.rm=TRUE)

print(Sys.time()-start)

stopCluster(clc)



