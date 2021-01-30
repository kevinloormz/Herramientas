df<-as.data.frame(read.csv("C:/Users/dell/OneDrive - Universidad de Guayaquil/Analista de datos - Linkedin Learning/R/base_datos_2008.csv",nrows = 100000))

#el by tiene una lista siempre fijo se envia una lista
aggregate(x = df$ArrDelay,by=list(df$DayOfWeek), FUN=mean, na.rm=TRUE)



aggregate(x = list(df$DepDelay, df$ArrDelay),by=list(df$DayOfWeek), 
          FUN=mean, na.rm=TRUE)


aggregate(x = list("Dep"=df$DepDelay,"Arr"=df$ArrDelay),by=list("Day"=df$DayOfWeek), 
          FUN=mean, na.rm=TRUE)


