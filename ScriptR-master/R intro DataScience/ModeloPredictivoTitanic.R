#cargar librerias 
library(randomForest)
library(caret)
library(dplyr)
library(corrr)
install.packages("e1071")
library(e1071)

#cargar datos

datos_train=read.table("dataset/train.csv",sep = ",", header = T)
datos_test=read.table("dataset/test.csv",sep = ",", header = T)


#Correlaciones de variables 
datos=datos_train
datos=select_if(datos,is.numeric)
datos_corr=correlate(datos)
datos_hd=stretch(datos_corr)
view(datos_hd) #Fare o Parch tarifa correlacion


#validando variable con table cruzada
colnames(datos_train)
table(datos_train[,c("Survived","Parch")])


#seguimos en la busqueda de variables 
install.packages("fields")
library(fields)
bplot.xy(datos_train$Survived,datos$Parch)

#resumen para ver na no tiene 
summary(datos_train$Sex)

#Ya tenemos dos variables tarifa(fare) y parch(padres o hijos)
#no tienen NA y son diferentes para los que sobrevivieron y no 


#transformar en factor survived
df_status(datos_train)
datos_train$Survived=factor(datos_train$Survived)


set.seed(51)

#training
colnames(datos_train)
#variable catecorica en funcion de las variables que deseamos incluir para la prediccion
mi_modelo= train(Survived~Parch+Fare+Sex, data = datos_train, method='rf',
                 trControl = trainControl(method = 'cv', 
                                          number = 5)
                 
)


#detalles del modelo
mi_modelo


df_status(datos_test)
#fare tiene un NA
#complementamos con la media de las tarifas 

datos_test=mutate(datos_test,Fare=replace_na(Fare,mean(datos_test$Fare,na.rm = TRUE)))

#Agregamos la columna de prediccion 
datos_test$Survived= predict(mi_modelo,newdata = datos_test)

#total de supervivencia segun las variables del modelo 
datos_test$Survived


#score
score_prediction=predict(mi_modelo,datos_test, type = 'prob')


score_prediction[,2]

#agregando score al dataset
datos_test$score=score_prediction[,2]



#validacion 
gain_lift(data = datos_test,score = "score", target = "Survived")




#Variables mas importantes e influyentes del modelo 
varImp(mi_modelo)



cross_plot(data = datos_test,input = "Parch",
           target = "Survived",plot_type = "both")

plotar(data = datos_test,input = "Parch",
       target = "Survived",plot_type = "histdens" )



