

protected Vector_Compartido is 
	procedure Imprimir_Vector();
	procedure Ordenar_Vector();
	procedure CalcularMayor_Vector();
	procedure Suma_Vector();
	private
		Vector : array (1..50) of integer;
end Vector_Compartido;



protected body Vector_Compartido is 

	procedure Imprimir_Vector is
	for indice in 1..50 loop
    	Put(integer'Image(Vector(indice))); Put(" ");
  	end loop; 
  	New_Line;
	end Imprimir_Vector;

	procedure Suma_Vector is 
	suma: integer := 0 ;
	for indice in 1..50 loop
    	suma = suma + Vector(indice);
  	end loop; 
	end Suma_Vector;
end Vector_Compartido;