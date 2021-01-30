library(readr)
df<-read_csv("C:/Users/dell/OneDrive - Universidad de Guayaquil/Analista de datos - Linkedin Learning/R/base_datos_2008.csv")
delay<-df$Arrdelay
delay<-delay[!is.na(delay)]

start<-Sys.time()

#nuestro codigo
mean(delay)

print(Sys.time()-start)


#codigo mas avanzado para medir eficiencia 

library(rbenchmark)
