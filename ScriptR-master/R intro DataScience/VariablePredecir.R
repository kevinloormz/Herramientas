#librerias necesarias
library(dplyr)
library(corrr)


#cargamos data 
datos=heart_disease

#nos quedamos solo con data numerica
datos1=select_if(datos,is.numeric)


#asignamos 1 o 0 a variable categorica
datos1$has_heart_disease=if_else(datos$has_heart_disease=="yes",1,0)

#verificamos que sea numerica la nueva variable 
df_status(datos1)


#aplicamos correleate y guardamos en una variable
v_corre=correlate(datos1)


#aplicamos strech para obtener una mejor vision de la correlacionn
v_corre_hd=stretch(v_corre)

#view hd 
view(v_corre_hd)



