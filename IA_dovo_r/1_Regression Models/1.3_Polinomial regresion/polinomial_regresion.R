#Modelo de regresión polinómica
#Creado y documentado por: David Andrade @AndradeDamnt

dataset <- read.csv("Position_Salaries.csv")
dataset <- dataset[2:3]

#Cuando hay pocos elementos no es conveniente dividir el dataset y por la naturaleza de los datos
#tampoco hace falta escalar los datos. 

#Ajustar la regresion lineal con el dataset
lin_reg <- lm(Salary ~ Level, data = dataset)
summary(lin_reg)
par(mfrow=c(2,2))
plot(lin_reg) #Los supuestos no se ajustan optimamente para el modelo de regresion lineal

#Ajustar la regresion lineal con el datase
dataset$Level2 <- dataset$Level^2 #Obtenemos los cuadrados
dataset$Level3 <- dataset$Level^3
dataset$Level4 <- dataset$Level^4
poly_reg <- lm(Salary ~ ., data = dataset)
summary(poly_reg) 


library(ggplot2)
#Visualización del modelo lineal 
ggplot() +
  geom_point(aes(x = dataset$Level , y = dataset$Salary),
             color = "red") +
  geom_line(aes( x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            color = "blue") + 
  ggtitle("Predicción lineal del sueldo en función del nivel del empleado") +
  xlab("Nivel del empleado") +
  ylab("Sueldo (en $)")

#Visualización del modelo polinómico 
ggplot() +
  geom_point(aes(x = dataset$Level , y = dataset$Salary),
             color = "red") +
  geom_line(aes( x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            color = "blue") + 
  ggtitle("Predicción polinomial del sueldo en función del nivel del empleado") +
  xlab("Nivel del empleado") +
  ylab("Sueldo (en $)")

#Predicción de nuevos resultados con regresión lineal 
y_pred <- predict(lin_reg, newdata = data.frame(Level = 6.5))

#Predicción de nuevos resultados con regresión polinómica
y_pred_poly <- predict(poly_reg, newdata = data.frame(Level = 6.5,
                                                      Level2 = 6.5^2,
                                                      Level3 = 6.5^3,
                                                      Level4 = 6.5^4))
