df<-as.data.frame(read.csv("C:/Users/dell/OneDrive - Universidad de Guayaquil/Analista de datos - Linkedin Learning/R/base_datos_2008.csv",nrows = 100000))
df2<-df[,c("CarrierDelay","WeatherDelay","NASDelay","SecurityDelay","LateAircraftDelay")]

df_clean<-df2[complete.cases(df2),]
head(df_clean)

#ejes del objeto margin 2do parametro 1 filas 2 columnas 

filas<-apply(df_clean, 1, mean)
columnas<-apply(df_clean, 2, mean)

apply(df_clean, 2, summary)

#lista
lapply(df_clean$CarrierDelay, factorial)

#vector
resul<-sapply(df_clean$CarrierDelay, factorial)


apply(df2, 2, mean, na.rm=TRUE)

#eliminar el 0.01 por abajo y 0.01 por arriba
apply(df2, 2, mean, na.rm=TRUE,trim=0.01)

