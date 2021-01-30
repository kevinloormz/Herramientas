df<-as.data.frame(read.csv("C:/Users/dell/OneDrive - Universidad de Guayaquil/Analista de datos - Linkedin Learning/R/base_datos_2008.csv",nrows = 100000))
df<-df[,c("CarrierDelay","WeatherDelay","NASDelay","SecurityDelay","LateAircraftDelay")]


#existen muchos procesos que funcionanm mas rapidos con apply que con bucle pero
#tambien a la inversa 


#Bucle 
start<-Sys.time()

resultado<-rep(0,nrow(df))

for (i in 1:nrow(df)) {
  resultado[i]<- mean(as.numeric(df[i,]),na.rm = TRUE  )
}

print(Sys.time()-start)



#Apply
start<-Sys.time()

#margin 1 para fila 2 para columna
resultado2<-apply(X = df,MARGIN = 1, FUN = mean, na.rm=TRUE)

print(Sys.time()-start)


all(resultado==resultado2,na.rm = TRUE)


