num<-5
num<-5.0 #r no distingue decimales 
string<-"esto es un string"

#vectores usan esta sintaxis
nums<-c(1,2,3,4,5)
nums[5]
nums[2:5]

#otra forma de declarar vectores
nums<-1:15

#vectores solo aceptan un tipo de elementos 
nums<-c(1,2,'hola') #covierte al tipo texto los numeros 


#matrix
matrix<-matrix(1:6,ncol=3)
matrix<-matrix(1:6,ncol=3,byrow=TRUE)

#info de la matrix filas,columnas
matrix[2,2]
matrix[2,2:3] #segunda fila , segunda y tercera columna 


#dataframe 
df<-as.data.frame(read.csv("C:/Users/dell/OneDrive - Universidad de Guayaquil/Analista de datos - Linkedin Learning/R/base_datos_2008.csv",nrows = 1000))

#acceder datos del df 
df$ArrDelay
df$Month

#todos los valores de esta columna 
df["ArrDelay"]


#los cincos primeros valores de esta columna 
df[1:5,"ArrDelay"]

#los cinco primeros de las dos columnas que pedimos en el vector 
df[1:5,c("ArrDelay","Month")]


#listas
lista<-list()
lista$objeto1<-1:3
lista$objeto2<-"Hola"
lista$objeto3<-df[1:5,]

#acceder al elemento u objeto 
lista[[3]]
lista$objeto3
lista$objeto3[2:3,]

lista$objeto3[,"ArrDelay"]






