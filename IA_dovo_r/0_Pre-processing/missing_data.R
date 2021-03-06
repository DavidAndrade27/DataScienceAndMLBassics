# Plantilla para el Pre Procesado de Datos - Datos faltantes
# Importar el dataset
dataset = read.csv('Data.csv')


# Tratamiento de los valores NA
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)

#La funcion ifelse itera en cada ciclo, primero se pone la condici�n, en la primer coma ir� lo que hace la funci�n en caso de ser cierta 
#Y en la segunda coma se da la instrucci�n que se llevar� a cabo en caso de ser falso
#La funcion ave produce un subconjunto de valores de x promediados a partir de las observaciones 
# a cada n�mero x se va a remplazar la media de los valores excepto los que tienen NA
#cuando no exista un na entonces se se genera la siguiente instrucci�n que en este caso deja el dataset intacto. 

dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                        dataset$Salary)
