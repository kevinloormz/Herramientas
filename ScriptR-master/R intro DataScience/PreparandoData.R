#preparacion de datos 


datos=heart_disease

#cargamos la libreria 
library(tidyverse)

datos=as.tibble(datos)

#filtrar con filter de 
mis_datos=filter(datos,gender=="male"& chest_pain==1)


#ordenando los datos con arrange de dylier

d1=arrange(datos,age) #ascendente por edad

d2=arrange(datos,chest_pain,age)#por cada seccion chest ordena por edad asc

d1=arrange(datos,-age) #orden desc


#cambiando el sentido de los campos
d5=select(datos,age, gender,chest_pain) #solo tres variables

d6=select(datos,-age)  #eliminamos la variable que no queremos

d7=select(datos,age,gender,everything()) #ordenando las columnas y luego el resto


#renombrar variables 

d8=select(datos,edad=age,everything())



#seleccionamos variables por el tipo de dato
#is.character
#is.factor
d9=select_if(datos,is.numeric)




#funcion mutate
#permite crear variables nuevas

d9=mutate(datos, v_edad=age>40)


#if else dbplyr

if_else(datos$age>40,"es mayor", "es menor")

#creando nueva variable 
datos$var_nueva=if_else(datos$age>40,"es mayor", "es menor")

#seleccionando var nueva
select(datos,var_nueva,everything())

#colnames(datos)
datos=mutate(datos,estado_heart=if_else(max_heart_rate>150,"alto","bajo"))

select(datos,estado_heart,everything())







