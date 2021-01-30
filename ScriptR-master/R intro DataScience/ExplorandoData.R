#explorando data 

#carga o instalacion de paquetes

library(tidyverse) #graficos o preparacion de datos
library(funModeling) #graficos o preparacion de datos
library(Hmisc) #described


#Asignamos a una variable 
datos=heart_disease

#dataset de funModeling
glimpse(datos)

#analisis inicial de datos con df_status de funmodeling
#ejemplo una variable que tiene muchos ceros no puede servir para un analisis estadistico
#el mismo caso con las na de una variable 
df_status(datos)


#grafico de las variables numericas con plot_num de fun modeling
#ejemplo si se hace un modelo seria bueno tratar las variables serum_cholesterol
# y oldpeak xq a la derecha se observa data out 
plot_num(datos)



#analisis cuantitativo con summary, describe, profiling_num
#range_80 el 80% de los datos tiene 42 a 66 años
summary(datos) #rbase falta porcentajes
describe(datos) #hmisc
profiling_num(datos) #funmodeling  


#analisis de las variables categoricas freeq fanmodeling

freq(datos)
#se puede graficar una variable y alamacenarlo en una tbl

tbl=freq(datos$chest_pain)


#omitiendo los na 
freq(datos$chest_pain, na.rm = T)








