require(data.table)
require(dplyr)
dt<-fread("C:/Users/dell/OneDrive - Universidad de Guayaquil/Analista de datos - Linkedin Learning/R/base_datos_2008.csv")


df<-dt[sample(x=1:nrow(dt),size = 1e6)]

origenes<-group_by(df,df$Origin)


retraso<-summarise(origenes,
                   recuento=n(),
                   distancia=mean(df$Distance, na.rm = TRUE),
                   retraso_llegada=mean(df$ArrDelay, na.rm = TRUE)
                   )


filter(retraso,retraso_llegada>10,distancia<500)



#filtrando por fechas 

diario<-group_by(df,df$Year,df$Month,df$DayofMonth)

(dias<-summarise(diario,vuelos=n()))
(meses<-summarise(dias,vuelos=sum(vuelos)))
(años<-summarise(meses,vuelos=sum(vuelos)))



#filtrando con sintaxis %>% encadenar procesos uno con otros
#se lee asi al df aplicale un group by, al group by selecciona dos columnas 
#a la selecccion de columnas se le aplica el resumen del summarize
#por ultimo a todo lo anterior aplicale un filtro 
df %>%
  group_by(Year,Month,DayofMonth) %>%
  select(ArrDelay,Distance) %>%
  summarise(
    Retraso=mean(ArrDelay,na.rm = TRUE),
    Distancia=mean(Distance,na.rm = TRUE)
  )%>%
  filter(Retraso>15&Distancia>500)



dt %>%
  group_by(Month) %>%
  select(ArrDelay,Distance) %>%
  summarise(
    Retraso=mean(ArrDelay,na.rm = TRUE),
    Distancia=mean(Distance,na.rm = TRUE)
  )
 






