# Definici�n de par�metros
	param n>0;      	           	# n�mero de posibles productos
	param m>0;     	           	# n�mero de recursos
	set J:= 1  .. n ;  	           	# conjunto de �ndices de recursos (limitados)
	set I:= 1 .. m ;  	        	# conjunto de �ndices para productos
	param p {j in J};    		# vector de beneficios pj
	param Coef {i in I, j in J};    	# matriz de coeficientes aij de las restricciones
	param b {i in I};		# vector de t�rminos independientes 

# Definici�n de las variables de decisi�n
	var x {j in J};		
 
# Definici�n de la funci�n objetivo
	maximize FO: sum{j in J} p[j]*x[j];

# Definici�n de restricciones
	subject to limitacion_recurso {i in I}:
		sum{j in J} Coef[i, j]*x[j]<= b[i];

#Definicion cotas sobre las variables
        subject to cotas {j in J}: 0<=x[j];
