# Curso Desembarcando en R

#################################################
## Lab 9 - Introducción (super básica) a ggplot2
################################################
# Carga de librer�as
library(tidyverse)
library(ggplot2)



################################################
### Creando un histograma
################################################
ggplot(data = iris, aes(x=Sepal.Length)) + 
  geom_ +
  theme_light() +
  xlab("Eje x: Sepal Lenght")





ggplot(data = iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
  geom_point() +
  theme_light() 






################################################
### Usando una interfáz visual
################################################

# install.packages("ggplotgui")
library("ggplotgui")
ggplot_shiny(iris)





###########################################
## Lectura complementaria
###########################################
# Visualización de datos: https://es.r4ds.hadley.nz/visualizacion-de-datos.html


##########################################
## Ejercicios!
##########################################
## cargar datos "data/bank_2.csv"



## 1 - Jugar un poco con:
ggplot_shiny(data_bank)


## 2 - Graficar las 2 variables categóricas: job y education (en ejes x e y respectivamente)
# gráfico de barras de 2 variables categóricas. Es decir, por cada job, verán como se 
# distribuye education
# Googlear: bar plot ggplot two categorical variables 



## 3 - Mostrar el gráfico de 1) en porcentajes, es decir cada columna (job) tendra el valor 100%.
## Googlear: create 100% stacked bar plot ggplot2, pista: "position fill"





## 4 - Acomodar los labels del eje x para que queden legibles
## Googlear: ggplot2 axis.text.x



