require(data.table)
dt<-fread("C:/Users/dell/OneDrive - Universidad de Guayaquil/Analista de datos - Linkedin Learning/R/base_datos_2008.csv")



dt[,.N,by=.(Month) ]


  dt[Origin=="ATL",.N,by=.(Month) ]
  
  dt[ArrDelay>60,.N,by=.(Origin,Dest) ]
  
  dt[Origin=='ATL',.N,by=.(Month,"1H Retraso"=ArrDelay>60) ]
  
  
  dt[Origin=='ATL'& !is.na(ArrDelay) ,.N,by=.(Month,"1H Retraso"=ArrDelay>60) ]