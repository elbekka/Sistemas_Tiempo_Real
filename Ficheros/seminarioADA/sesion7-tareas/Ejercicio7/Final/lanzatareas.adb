
with Kernel.Serial_Output; use Kernel.Serial_Output;

procedure lanzatareas is

--   pragma Priority (System.Priority'First);
type Tipo_Vector is array (1..50) of integer;
task ordenar;
task sumavector;
task mayor;

protected Vector_Compartido is 
	procedure Imprimir_Vector;
	procedure Ordenar_Vector;
	procedure CalcularMayor_Vector;
	procedure Suma_Vector;
	private
		Vector : Tipo_Vector := (2,2,4,1,6,6,7,9,5,6,8,3,3,0,4,8,9,6,4,6,
					2,2,4,1,6,6,7,9,5,6,8,3,3,0,4,8,9,6,4,6,2,2,4,1,6,6,7,9,5,90);
end Vector_Compartido;
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

task body ordenar is
begin
Vector_Compartido.Ordenar_Vector;
Vector_Compartido.Imprimir_Vector;
end ordenar;
task body sumavector is
begin
Vector_Compartido.Suma_Vector;
Vector_Compartido.Imprimir_Vector;
end sumavector;
task body mayor is
begin
Vector_Compartido.CalcularMayor_Vector;
Vector_Compartido.Imprimir_Vector; 
end mayor;
begin
null;
end lanzatareas;