package packagefuncionesVector is 
	type Tipo_Vector is array (1..50) of integer;
protected Vector_Compartido is 
	procedure Imprimir_Vector;
	procedure Ordenar_Vector;
	procedure CalcularMayor_Vector;
	procedure Suma_Vector;
	private
		Vector : Tipo_Vector := (2,2,4,1,6,6,7,9,5,6,8,3,3,0,4,8,9,6,4,6,
					2,2,4,1,6,6,7,9,5,6,8,3,3,0,4,8,9,6,4,6,2,2,4,1,6,6,7,9,5,90);
end Vector_Compartido;
end packagefuncionesVector;