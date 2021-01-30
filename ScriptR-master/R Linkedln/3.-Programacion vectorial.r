df<-as.data.frame(read.csv("C:/Users/dell/OneDrive - Universidad de Guayaquil/Analista de datos - Linkedin Learning/R/base_datos_2008.csv",nrows = 100000))
delay<-df$ArrDelay
delay<-delay[!is.na(delay)]


a<-delay[delay>0]*2
b<-delay[delay>0]+delay[delay>0]

a==b
#validar que todas las filas son iguales 
all(a == b)

sum(delay)

df2<-df[,c("CarrierDelay","WeatherDelay","NASDelay","SecurityDelay","LateAircraftDelay")]

df2<-as.matrix(df2)

#kimpiando df matrix 
df2<-df2[complete.cases(df2),]



rep(1,nrow(df2)) %*% df2
