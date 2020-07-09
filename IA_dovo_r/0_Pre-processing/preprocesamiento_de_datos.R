# Pre-Procesamiento de los datos (TRATAMIENTO DE DATOS)
# Creado y documentado por: David Andrade Morales / @Andradedamnt 
# Fecha: 13/12/2019 

# Exportando la base de datos para trabajar. 

dataset <- read.csv("Data.csv")

# Lo primero que tenemos que considerar es la limpieza de la BD (Sin NAs)Por ello debemos remplazar los 
# valores perdidos por las medias de los # valores que se encuentran en la misma columna

dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)  #Esta elimina los NAs de la variable Age 

# La funcion ifelse itera en cada ciclo, es una condicional, en la primer coma ira lo que hace la 
# funcion en caso de ser cierta y en la segunda coma se da la instruccion que se llevara a cabo en caso de ser falso
# La funcion ave produce un subconjunto de valores de x promediados a partir de las observaciones, a cada numero x 
# se le va a remplazar por la media de los valores sin tomar en cuenta los que tienen NA, 
# cuando no exista un NA entonces se se genera la siguiente instruccion, que en este caso deja el dataset intacto. 

dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                        dataset$Salary) #Esta elimina los NAs de la variable Salary 


######## DATOS CATEGORICOS ########
# Los datos categoricos nos ayudan a agrupar en categorias nuestros datos. Es util en algunos casos, cuando no tienes
# variables del tipo númerico y es más sencillo trabajar con números y despues asignar una etiqueta a cada núemro 


# Codificar las variables categóricas
dataset$Country <- factor(dataset$Country,
                          levels = c("France", "Spain", "Germany"),
                          labels = c(1, 2, 3))
# Convertimos a fcator con la funci?n "factor" asignando los valores con "levels" y "c" para concatenar sus valores 

is.factor(dataset$Country) #Con esto preguntamos si la varible del argumento es un factor

dataset$Purchased <- factor(dataset$Purchased,
                            levels = c("No", "Yes"),
                            labels = c(0,1))

plot(dataset$Country, dataset$Salary)


######## DIVIDIENDO LOS DATOS EN ENTRENAMIENTO Y PRUEBA PARA APRENDIZAJE DE MAQUINA ########

# install.packages("caTools")
library(caTools)
set.seed(123) #Genera una secuencia de numeros aleatorios
split = sample.split(dataset$Purchased, SplitRatio = 0.8) #Divide la base de datos cn la variable y el porcentaje
training_set = subset(dataset, split == TRUE) #Toma los valores en los que "split" toma valor TRUE 
testing_set = subset(dataset, split == FALSE) #Toma los valores en los que "split" toma valor FALSE

# Escalado de valores para utilizar la distancia euclidiana

training_set[,2:3] = scale(training_set[,2:3]) #No trabaja con factores por eso solo elegimos de la 2:3
testing_set[,2:3] = scale(testing_set[,2:3])
