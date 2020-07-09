# Plantilla para el Pre Procesado de Datos - Datos faltantes
# Importar el dataset
dataset = read.csv('Data.csv')


# Tratamiento de los valores NA
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)

#La funcion ifelse itera en cada ciclo, primero se pone la condición, en la primer coma irá lo que hace la función en caso de ser cierta 
#Y en la segunda coma se da la instrucción que se llevará a cabo en caso de ser falso
#La funcion ave produce un subconjunto de valores de x promediados a partir de las observaciones 
# a cada número x se va a remplazar la media de los valores excepto los que tienen NA
#cuando no exista un na entonces se se genera la siguiente instrucción que en este caso deja el dataset intacto. 

dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                        dataset$Salary)
