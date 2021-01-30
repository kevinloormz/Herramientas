df<-as.data.frame(read.csv("C:/Users/dell/OneDrive - Universidad de Guayaquil/Analista de datos - Linkedin Learning/R/base_datos_2008.csv",nrows = 100000))
df2<-df[,c("CarrierDelay","WeatherDelay","NASDelay","SecurityDelay","LateAircraftDelay")]


df_clean<-df2[complete.cases(df2),]

sapply(1:10,function(x) x*x)

#cumplen con el mismo objetivo estas dos funciones 
apply(df_clean,1,mean,trim=0.01)
apply(df_clean,1,function(x) mean(x,trim = 0.01))


#nuestra funcion hace lo mismo que la implementacion basica de r 
media2<-function(fila){
  return(sum(fila)/length(fila))
}

resul1<-apply(df_clean, 1,mean)
resul2<-apply(df_clean,1,media2)

all(resul1==resul2)
