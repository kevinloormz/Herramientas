require(readr)

start<-Sys.time()
df<-read_csv("C:/Users/dell/OneDrive - Universidad de Guayaquil/Analista de datos - Linkedin Learning/R/base_datos_2008.csv")
print(Sys.time()-start)



require(data.table)

#datatable esta completaente optimizado y funciona muy rapido

start<-Sys.time()
dt<-fread("C:/Users/dell/OneDrive - Universidad de Guayaquil/Analista de datos - Linkedin Learning/R/base_datos_2008.csv")
print(Sys.time()-start)

#filtrand
df[filas, columnas]

#by columna de agrupacion
dt[filas, columnas,by]
