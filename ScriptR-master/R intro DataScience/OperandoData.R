#operando datos con r base 
#creando vectores

v_provincias=c("Guayas","Pichincha","Azuay")


#reemplazos condicion bandera
v_flag=v_provincias=="Guayas"

#elemento que coincide
v_provincias[v_flag]

#remplazando 
v_provincias[v_flag]="Zamora"

#filtrando dataframes - valores NA
datos=read_delim("original/data/HollywoodMovies.csv", delim = ",")

#info del dataset
glimpse(datos)


#filtrando los na
v_flag_na=is.na(datos$LeadStudio)

#bandera filtro sony
v_flag=datos$LeadStudio=="Sony"

#nos quedamos con todas las filas que pertenecen al studio sony y no son na 
datos.sony=datos[v_flag& !v_flag_na,]


datos.sony



