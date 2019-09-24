
with Kernel.Serial_Output; use Kernel.Serial_Output;

package body packagefuncionesVector is
protected body Vector_Compartido is 
	procedure Imprimir_Vector is
	begin
	for indice in 1..50 loop
    	Put(integer'Image(Vector(indice))); Put(" ");
  	end loop; 
  	New_Line;
	end Imprimir_Vector;

	procedure Suma_Vector is
	suma: integer := 0 ;
	begin
	Put("Empieza la tarea Suma_Vector");
	New_line;
	for indice in 1..50 loop
    	suma := suma + Vector(indice);
  	end loop;
	Put("La suma del vector es : ");
	Put(integer'Image(suma)); 
	end Suma_Vector;
	procedure Ordenar_Vector is
	Temp : integer:=0 ;
	begin
	Put("Empieza la tarea ordenar Vector.");
	New_line;
	for indiceI in reverse Vector'Range loop
       	for IndiceJ in Vector'First .. indiceI loop
          if Vector(indiceI) < Vector(IndiceJ) then
             Temp := Vector(IndiceJ);
             Vector(IndiceJ) := Vector(indiceI);
             Vector(indiceI) := Temp;
          end if;
        end loop;
    	end loop;
	end Ordenar_Vector;
	procedure CalcularMayor_Vector is
	maxNum : integer :=0;
	begin
	Put("Empieza la tarea CalcularMayor_Vector");
	New_line;
	for indice in 1..50 loop
    	if Vector(indice) > maxNum then
	maxNum := Vector(indice);
	end if;
  	end loop; 
	Put("El numero maximo del vector es : ");
	Put(integer'Image(maxNum));
	New_line;
	end CalcularMayor_Vector;
end Vector_Compartido;
begin
null;
end packagefuncionesVector;