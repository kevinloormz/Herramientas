#librerias
library(dplyr)
library(corrplot)
library(corrr)
library(funModeling)

#carga de datos 
datos_train=read.table("dataset/train.csv",sep = ",", header = T)
datos_test=read.table("dataset/test.csv",sep = ",", header = T)


#preparacion de data

datos_corr=as.tibble(datos_train) #mejor manejo que df
datos_corr=mutate(datos_corr,Survived=as.numeric(Survived)) #mutando a numerico
datos_corr=mutate(datos_corr,Sex=if_else(Sex=="male",1,0)) #mutando a numerico condicion if else
datos_corr=mutate(datos_corr,Child=if_else(Age>18,1,2)) #nueva columna child
datos_corr=select_if(datos_corr,is.numeric) #solo data numerica
datos_corr=select(datos_corr,Survived,Pclass,Sex,Fare,Parch,SibSp,Child)

#colnames(datos_corr)

#correlacion
corr=cor(datos_corr)
corrplot(corr,method="circle")


#ahora el modelo rf con survivded en funcion de las variables de la correlacion 
#colnames(datos_train)

datos_train$Survived=factor(datos_train$Survived)
df_status(datos_train)

#no acepta na revisar con df status el dataset
mi_modelo=randomForest(Survived~Pclass+Sex+Fare+Parch+SibSp,data = datos_train)


#datos de test para prediccion 
df_status(datos_test)
#observamos un na en Fare lo reemplazamos por la media de todo el dataset
datos_test=mutate(datos_test,Fare=replace_na(Fare,mean(datos_test$Fare,na.rm = TRUE)))

#Agregamos la columna de prediccion 
datos_test$Survived= predict(mi_modelo,newdata = datos_test)

#total de supervivencia segun las variables del modelo 
datos_test$Survived



#validacion con score
score_prediction=predict(mi_modelo,datos_test,type = "prob")

score_prediction[,2]

datos_test$Score=score_prediction[,2]

gain_lift(data = datos_test, score = "Score", target = "Survived")


#Variables mas importantes e influyentes del modelo 
varImpPlot(mi_modelo)
#Sex
#Fare
#Pclass




#graficando test variables importantes
cross_plot(data = datos_test,input = "Sex",
       target = "Survived" )

#Sex vs Fare 

ggplot(datos_test, aes(x = Fare, y = Sex)) + 
  geom_jitter(aes(colour = Survived)) + 
  scale_fill_discrete(name = "Survived") + 
  scale_x_continuous(name="Fare", limits=c(0, 270), breaks=c(0, 40, 80, 120, 160, 200, 240, 280))

#Sex vs Fare vs Pclass
ggplot(datos_test, aes(x = Fare, y = Sex)) + 
  geom_jitter(aes(colour = Survived)) + 
  facet_wrap(~Pclass)+
  scale_fill_discrete(name = "Survived") + 
  scale_x_continuous(name="Fare", limits=c(0, 80), breaks=c(0, 20, 40, 60, 80))


#graficando train
cross_plot(data = datos_train,input = "Sex",
           target = "Survived" )



ggplot(datos_train, aes(x = Fare, y = Sex)) + 
  geom_jitter(aes(colour = Survived)) + 
  scale_fill_discrete(name = "Survived") + 
  scale_x_continuous(name="Fare", limits=c(0, 270), breaks=c(0, 40, 80, 120, 160, 200, 240, 280))



ggplot(datos_train, aes(x = Fare, y = Sex)) + 
  geom_jitter(aes(colour = Survived)) + 
  facet_wrap(~Pclass)+
  scale_fill_discrete(name = "Survived") + 
  scale_x_continuous(name="Fare", limits=c(0, 80), breaks=c(0, 20, 40, 60, 80))



