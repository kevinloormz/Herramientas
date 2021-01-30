#cargando librerias 

library(tidyverse)
library(funModeling)
library(corrr)

#correlaciones entre varibales

datos=heart_disease


#todas las variables deben ser numericas
datos1=select_if(datos,is.numeric)

#ahora si aplicando correlate para ver la correlacion de una variable con otra
v_corre=correlate(datos1)


#aplicando strech para ver relaciones por filtros y ordenarlos de mayor a menor 
v_corre_hd=stretch(v_corre)

#aplicar filtros 
view(v_corre_hd)

#la variable a predecir es categorica 
#convirtiendo en variablke numerica 

datos$has_heart_disease=as.factor(datos$has_heart_disease)

#