
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

	procedure Ordenar_Vector is
	for indiceI in reverse Vector'Range loop
       	for IndiceJ in Vector'First .. I loop
          if Vector(I) < Vector(J) then
             Temp := Vector(J);
             Vector(J) := Vector(I);
             Vector(I) := Temp;
          end if;
        end loop;
    	end loop;
	end Ordenar_Vector;

	procedure CalcularMayor_Vector is 
	maxNum : integer :=0;
	for indice in 1..50 loop
    	if Vector(indice) > maxNum then
	maxNum = Vector(indice);
	end if;
  	end loop; 
	end CalcularMayor_Vector;
end Vector_Compartido;