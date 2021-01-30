
#cargamos la libreria
#preparacion de datos 
#analisis exploratorios 
#graficos
#datos
library(tidyverse)

#cargar dataset
data=read_delim("original/data/winequality-white.csv",delim = ";")

#cantidad de registros 
nrow(data)

#cantidad de columnas
ncol(data)

#nombre de columnas 
colnames(data)



#Resumen de dataset tipo,tamaño,columnas,etc (tidyverse)
glimpse(data)




#accediendo a los datos data[fila,columna]
#tipo matriz fila columna 
#todo el registro numero dos con las 12 columnas
data[2,]

#todo menos la ultima columna
data[2,-12]


#acceder a una columna y registro especifico por fila
data[2,"pH"]

#remplazando el valor de esa fila y columna 
data[2,"pH"]=99


#notacion fila columna 
#imprimiendo los tres primeros registros de la columna ph
data[c(1,2,3),"pH"]


#accediendo por medio de un vector
data$pH[2]

#Estructura de datos
#integer 
a=0
#numeric
b=2.2
#character
c="hola"

#factor
d=factor("a")


#creando un vector
v_vector=c(1,2,3)

v2_vector=c("a","a","b")
v3_vector=c(12,10,5)



#factor para asignar valores a los niveles 
#ejemplo le asigna 1 a la letra "a" y 2 a la letra "b"
#es importante para mostrar graficos 
#util para randomforest
v3=factor(v2_vector)


#dataframe
df=data.frame(val1=v3_vector,val2=v2_vector)

#mayor detalle de tamaño de dataframe
df=tibble(val1=v3_vector,val2=v2_vector)

df










  



