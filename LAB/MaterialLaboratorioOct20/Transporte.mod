# Definición de parámetros
	param m>0;      	# número de centros de producción
	param n>0;	# número de puntos de demanda
	set I:= 1 .. m ;  	# conjunto de índices centros de producción
	set J:= 1  .. n ;  	# conjunto de índices puntos de demanda
	param b {i in I};	# capacidad de produccion en centro i
	param d {j in J};    	# demanda en punto j
     param c {i in I, j in J};    	# coste unitario de transporte de centro i a punto j

# Definición de las variables de decisión
     var x {i in I, j in J};		
 
# Definición de la función objetivo
     minimize Coste: sum{i in I, j in J} c[i, j]*x[i, j];

# Definición de restricciones
	subject to capacidad_produccion {i in I}:
		sum{j in J} x[i, j]<= b[i];
	subject to demanda {j in J}:
		sum{i in I} x[i, j]>= d[j];

#Definicion cotas sobre las variables
        	subject to cotas {i in I, j in J}: 0<=x[i, j];
