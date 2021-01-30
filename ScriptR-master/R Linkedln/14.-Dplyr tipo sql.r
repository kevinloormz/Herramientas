require(data.table)
require(dplyr)
dt<-fread("C:/Users/dell/OneDrive - Universidad de Guayaquil/Analista de datos - Linkedin Learning/R/base_datos_2008.csv")

df<-dt[sample(x=1:nrow(dt), size = 1e5 )]


#filtrado
filter(df,df$Month==1 & df$DayOfWeek==1)

#ordenar 
arrange(df,df$ArrDelay)


#seleccionar variables 
select(df,ArrDelay)


#rango de columnas 
select(df,ArrDelay:Origin)

#generar nueva columna 
mutate(df,Retraso=ArrDelay>0)

#solo nos muestra la variable que hemos creado
transmute(df,Retraso=ArrDelay>0)


summarise(df, "Dist. median"=median(Distance, na.rm = TRUE))

#las mismas funciones se pueden usar para datatable y dataframe 

#cuantos casos al azar seleccionamos 
sample_n(df,10)


#nos da el 10% de nuestra base 
sample_frac(df,0.1)



