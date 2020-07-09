#Plantilla para la generación de modelos con regresión lineal mútliple
#Creado y documentado por: David Andrade @AndradeDamnt

#Cargamos el dataset
dataset <- read.csv("50_Startups.csv")

#Hacemos la limpieza de los datos 

#Generamos la variable categíroca
dataset$State <- factor(dataset$State,
                          levels = c("New York", "California", "Florida"),
                          labels = c(1, 2, 3))

#Dividimos el set en entrenamiento y testing

library(caTools)
set.seed(123) #Genera una secuencia de numeros aleatorios
split = sample.split(dataset$Profit , SplitRatio = 0.8) #Divide la base de datos cn la variable y el porcentaje
training_set = subset(dataset, split == TRUE) #Toma los valores en los que "split" toma valor TRUE 
testing_set = subset(dataset, split == FALSE) #Toma los valores en los que "split" toma valor FALSE

#Ponemos en la primer columa la variable de estado
training_set <- training_set[,c(4,1,2,3,5)]
testing_set <- testing_set[,c(4,1,2,3,5)]

#Ajustar el modelo de regresion lineal multiple en el conjunto de entrenamiento 
regression <- lm(formula = Profit ~ ., data = training_set) # formula= debemos asignar la variable a predecir vs todas 
summary(regression)
par(mfrow=c(2,2))
plot(regression) #Utilizamos para saber si se cumplen los supuestos de la regresion

# Predecir los resultados con el conjunto de testing 
y_predict = predict(regression, newdata = testing_set)

#Construir un modelo optimo con Eliminación hacia atrás. Lo hacemos iterando
SL = 0.05
regression <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State
                 , data = training_set)

regression <- lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend, 
                 data = training_set)

regression <- lm(formula = Profit ~ R.D.Spend + Marketing.Spend, 
                 data = training_set)

regression <- lm(formula = Profit ~ R.D.Spend, 
                 data = training_set)

summary(regression)


#De acuerdo a los datos el modelo que mejor predice el profit de una empresa es su destinacion de dinero en 
#investigacion y desarrollo. 

