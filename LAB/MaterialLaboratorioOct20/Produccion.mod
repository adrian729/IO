# Definición de parámetros
	param n>0;      	           	# número de posibles productos
	param m>0;     	           	# número de recursos
	set J:= 1  .. n ;  	           	# conjunto de índices de recursos (limitados)
	set I:= 1 .. m ;  	        	# conjunto de índices para productos
	param p {j in J};    		# vector de beneficios pj
	param Coef {i in I, j in J};    	# matriz de coeficientes aij de las restricciones
	param b {i in I};		# vector de términos independientes 

# Definición de las variables de decisión
	var x {j in J};		
 
# Definición de la función objetivo
	maximize FO: sum{j in J} p[j]*x[j];

# Definición de restricciones
	subject to limitacion_recurso {i in I}:
		sum{j in J} Coef[i, j]*x[j]<= b[i];

#Definicion cotas sobre las variables
        subject to cotas {j in J}: 0<=x[j];
