#Support Vector Regression (SVR)
#Creado y documentado por: David Andrade @AndradeDamnt



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

# Ajustar Modelo de Regresi贸n con el Conjunto de Datos
# Crear nuestra variable de regresi贸n aqui
library("e1071")
regression <- svm(formula = Salary ~ .,
                  data = dataset,
                  type = "eps-regression", 
                  kernel = "radial"
                  )

# Predicci贸n de nuevos resultados con SVR
y_pred = predict(regression, newdata = data.frame(Level = 6.5))



# Visualizaci贸n del modelo de regresi贸n
# install.packages("ggplot2")
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level , y = dataset$Salary),
             color = "red") +
  geom_line(aes(x = x_grid, y = predict(regression, 
                                        newdata = data.frame(Level = x_grid))),
            color = "blue") +
  ggtitle("Predicci贸n (Modelo de Regresi髇 SVR)") +
  xlab("Nivel del empleado") +
  ylab("Sueldo (en $)")


#Los valores que salen de la norma (outlayers) regularmente son poco tomados en cuenta