df<-as.data.frame(read.csv("C:/Users/dell/OneDrive - Universidad de Guayaquil/Analista de datos - Linkedin Learning/R/base_datos_2008.csv",nrows = 100000))


#bucle
delay<-df$ArrDelay
delay<-delay[!is.na(delay)]
delay<-delay[delay>0]

variacion<-rep(0,length(delay)-1)


#caso siguiente caso anterior 
for (i in 1:length(delay)-1) {
  variacion<-(delay[i-1] -delay[i])/delay[i]*100
  
}
round(as.numeric(variacion))


#apply 

lista<-list()

df<-df[!is.na(df$ArrDelay),]
origenes<-unique(df$Origin)


for (i in 1:length(origenes)) {
  lista[[i]]<-df[df$Origin==origenes[i],"ArrDelay"]
  
}

pvalues<-sapply(lista, function(X)
  t.test(X,mu = 0,alternative = "greater")$p.value)

round(p.value,3)



