df<-as.data.frame(read.csv("C:/Users/dell/OneDrive - Universidad de Guayaquil/Analista de datos - Linkedin Learning/R/base_datos_2008.csv",nrows = 100000))
df<-df[!is.na(df$ArrDelay),]

#Planificar vectores

#Opcion 1
start<-Sys.time()
suma<-c()

for (i in 1:nrow(df)) {
  suma<-c(suma,df[i,"ArrDelay"])
}

print(Sys.time()-start)


#Opcion 2
start<-Sys.time()
suma<-rep(0,nrow(df))
suma[1]<-df[1,"ArrDelay"]

for (i in 2:nrow(df)) {
  suma[i]<-suma[i-1]+df[i,"ArrDelay"]
}

print(Sys.time()-start)


#opcion 3 es mas eficiente usar funciones que ya vienen predefinidas
start<-Sys.time()
suma<-cumsum(df$ArrDelay)
print(Sys.time()-start)
