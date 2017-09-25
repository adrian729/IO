# Definici�n de par�metros
     param n>0;      	           	                                  # n�mero de disolventes b�sicos
     set J:= 1  .. n ;  	           	                          # conjunto de �ndices de disolventes
     param m1>0;                         # n�mero de componentes limitados inferiormente
     param m2>0;                         # n�mero de componentes limitados superiormente
    set Comp1:= 1 .. m1;  	                 # conjunto de componentes limitados
    set Comp2:= 1 .. m2;  	                 # conjunto de componentes limitados
    set Comp:= 1.. m1+m2; 
    param c {j in J};    		# vector de coeficientes de coste cj
    param Coef {i in Comp, j in J};    	# contenido de componente i del disonvente j
    param b {i in Comp};		# vector de limitaciones de componentes limitados 

# Definici�n de las variables de decisi�n
	var x {j in J};	# Cantidad de disolvente j por litro de mezcla.	
 
# Definici�n de la funci�n objetivo
	minimize Coste: sum{j in J} c[j]*x[j];

# Definici�n de restricciones
	subject to limitacion_inferior {i in Comp1}:
		sum{j in J} Coef[i, j]*x[j]>= b[i];
	subject to limitacion_superior {i in Comp2}:
		sum{j in J} Coef[m1+i, j]*x[j]<= b[m1+i];
	subject to normalizacion:
		sum{j in J} x[j] = 1;

#Definicion cotas sobre las variables
        	subject to cotas {j in J}: 0<=x[j];
