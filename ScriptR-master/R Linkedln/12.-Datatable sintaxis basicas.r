require(data.table)
dt<-fread("C:/Users/dell/OneDrive - Universidad de Guayaquil/Analista de datos - Linkedin Learning/R/base_datos_2008.csv")


dt[dt$Month==2]


dt[dt$Month==2 , .(dt$ArrDelay,dt$DepDelay) ] 

dt[Month==2 & DayOfWeek==1 , .(ArrDelay,DepDelay) ]



dt[Month==2 | DayOfWeek==1 , .(ArrDelay,DepDelay) ] 


dt[Month==1 & DayOfWeek==1 , .("llegadada"=ArrDelay,"Salida"=DepDelay) ] 


#.N numero total de casos 
dt[Month==1 & DayOfWeek==1 , .N ] 


#En que porcentaje de vuelos se cumple esta condicion 
dt[,mean(ArrDelay<DepDelay, na.rm=TRUE)]




