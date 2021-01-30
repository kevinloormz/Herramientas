#librerias necesarias
library(funModeling)


#graficando
cross_plot(data = datos, input =  "num_vessels_flour", target = "has_heart_disease")



#plotar es mas interesante 
#nos damos cuenta que mas probabilidades de infarto las personas de 57 años
plotar(data = datos,input = "age",target = "has_heart_disease",plot_type = "histdens" )


