# Definici�n de par�metros
	param m>0;      	# n�mero de centros de producci�n
	param n>0;	# n�mero de puntos de demanda
	set I:= 1 .. m ;  	# conjunto de �ndices centros de producci�n
	set J:= 1  .. n ;  	# conjunto de �ndices puntos de demanda
	param b {i in I};	# capacidad de produccion en centro i
	param d {j in J};    	# demanda en punto j
     param c {i in I, j in J};    	# coste unitario de transporte de centro i a punto j

# Definici�n de las variables de decisi�n
     var x {i in I, j in J};		
 
# Definici�n de la funci�n objetivo
     minimize Coste: sum{i in I, j in J} c[i, j]*x[i, j];

# Definici�n de restricciones
	subject to capacidad_produccion {i in I}:
		sum{j in J} x[i, j]<= b[i];
	subject to demanda {j in J}:
		sum{i in I} x[i, j]>= d[j];

#Definicion cotas sobre las variables
        	subject to cotas {i in I, j in J}: 0<=x[i, j];
