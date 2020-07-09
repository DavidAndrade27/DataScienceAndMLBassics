# Plantilla para el Pre Procesado de Datos - Datos Categóricos
# Importar el dataset
dataset = read.csv('Data.csv')


# Codificar las variables categóricas
dataset$Country <- factor(dataset$Country,
                         levels = c("France", "Spain", "Germany"),
                         labels = c(1, 2, 3))
# Convertimos a fcator con la funci�n "factor" asignando los valores con "levels" y "c" para concatenar sus valores 

is.factor(dataset$Country) #Con esto preguntamos si la varible del argumento es un factor

dataset$Purchased <- factor(dataset$Purchased,
                           levels = c("No", "Yes"),
                           labels = c(0,1))

plot(dataset$Country, dataset$Salary)
