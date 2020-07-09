# Forest Tree Regresion
# Creado y documentado por: David Andrade Morales | @Andradedamnt


# Importar el dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[, 2:3]

# Dividir los datos en conjunto de entrenamiento y conjunto de test
# install.packages("caTools")
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Purchased, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# testing_set = subset(dataset, split == FALSE)


# Escalado de valores
# training_set[,2:3] = scale(training_set[,2:3])
# testing_set[,2:3] = scale(testing_set[,2:3])

# Ajustar Modelo de random forest con el Conjunto de Datos
library("randomForest")
set.seed(1234)
regression <- randomForest(x = dataset[1], #[1] me regresa un data.frame
                           y = dataset$Salary,
                           ntree = 500) #Cuidado con el número de árboles

# Preduccion de nuevos resultados con random forest 
y_pred = predict(regression, newdata = data.frame(Level = 6.5))



# Visualizacion del modelo de random forest

library(ggplot2) 
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.001)
ggplot() +
  geom_point(aes(x = dataset$Level , y = dataset$Salary),
             color = "red") +
  geom_line(aes(x = x_grid, y = predict(regression, 
                                        newdata = data.frame(Level = x_grid))),
            color = "blue") +
  ggtitle("Prediccion (Random Forest Regression)") +
  xlab("Nivel del empleado") +
  ylab("Sueldo (en $)")
