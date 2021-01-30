#manejando na 
df_status(datos)

#true donde es nulo la variable 
is.na(datos$num_vessels_flour)


#asignamos en una variable 
v_na=is.na(datos$num_vessels_flour)

#donde sea nulo se le asigna el valor 999
datos$num_vessels_flour[v_na]=999



#de una variable factor
v_na=is.na(datos$thal)
datos$thal[v_na]="missing" #arroja error 


#convertimos as.character 

datos$thal=as.character(datos$thal)
datos$thal[v_na]="missing"



df_status(datos)


#dplyr

datos=heart_disease


datos=mutate(datos,num_vessels_flour2=replace_na(num_vessels_flour,999)
             ,thal2=replace_na(as.character(thal),"missing"))








