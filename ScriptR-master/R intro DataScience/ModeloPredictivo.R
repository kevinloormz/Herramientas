#librerias necesarias
library(randomForest)
library(funModeling)
library(tidyverse)
library(readr)


df_status(heart_disease)


#cargando set de datos 
#data=read_delim("original/data/winequality-white.csv",delim = ";")

#mejor que dataframe
datos=as.tibble(heart_disease)



#preparacion de datos 
#randomforest no acepta nulos

#1) nulos 
df_status(datos)
datos_clean=na.omit(datos)

df_status(datos_clean)


#2) seleccion de variables y transformacion 
#excluir la variable con la que se genera la variable a predecir para que no salga la correlacion

datos_clean=select(datos_clean,-heart_disease_severity)
datos_clean=mutate(datos_clean,has_heart_disease=as.factor(has_heart_disease))



#seleccionando la muestra 
datos_index=get_sample(datos_clean,percentage_tr_rows = 0.7)

#set de entrenamiento
datos_train=datos_clean[datos_index,]

#set de prueba 
datos_test=datos_clean[-datos_index,]



#modelo predictivo
#., en funcion de todas las variables 
mi_modelo=randomForest(has_heart_disease~.,datos_train)


#variables mas importantes del modelo
varImpPlot(mi_modelo)



#viendo la variable que mas influye vs la que menos influye 
cross_plot(data = datos_clean,input = c("chest_pain","fasting_blood_sugar"),
           target = "has_heart_disease")


plotar(data = datos_clean,input = "age",
       target = "has_heart_disease",plot_type = "histdens" )




#generando la probabilidad de la clase yes
#si tuvo o no un ataque al corazon 
score_prediction=predict(mi_modelo,datos_test, type = 'prob')

score_prediction[,2]

#agregando la columna al test 
datos_test$score=score_prediction[,2]

#validacion 
gain_lift(data = datos_test,score = "score", target = "has_heart_disease")

#lift 2.57 veces mejor que sacar concluciones al azar 
#gain tomando el 10% de la poblacion con score(mas probabilidad) mas alto obtengo el 25.71% de los que tuvieron 
#ataque al corazon


#interpretacion de gain lift
#link
#https://livebook.datascienceheroes.com/model-performance.html#gain_and_lift

#Por ejemplo, si estamos enviando correos electrónicos basados en este modelo,
#y tenemos un presupuesto para llegar solo al 20% de nuestros usuarios, 
#¿cuántas respuestas deberíamos esperar recibir? Respuesta: 35,97%

