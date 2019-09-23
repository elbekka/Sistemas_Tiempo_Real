
with Kernel.Serial_Output; use Kernel.Serial_Output;

package body paqtareas is


type Vector is array(1..50) of Integer;
v1 : Vector := (10,9,8,7,6,5,4,3,2,1, others => 0);
tamanio :Integer := 50;

procedure mostrarVector is 
begin
	for i in 1..tamanio loop
		Put(Integer'Image(v1(i)));
	end loop;
end mostrarVector;
procedure p1 is
begin
   Put_Line ("... se ejecuta paquete.p1 ");
end p1;

procedure p2 is
begin
   Put_Line  ("... se ejecuta paquete.p2 ");
end p2;

task body TA is
procedure swap(x,y : in out Integer) is 
 temp : Integer:=x ;
	begin 
		x:=y;
		y:=temp;
end swap;
 procedure metodoBurbuja is

  begin
   for i in 1..tamanio-1 loop
	for j in reverse i+1..tamanio loop
		if(v1(j)<v1(j-1)) then
			swap(v1(j),v1(j-1));
		end if;
	end loop;
   end loop;
end metodoBurbuja;
begin 
	metodoBurbuja;
	mostrarVector;
end TA;
task body TC is
numMayor : Integer := 0 ;
begin
 	for i in 1..tamanio loop
		if(numMayor < v1(i)) then
			numMayor :=v1(i);
		end if;
	end loop;
	mostrarVector;
	Put(Integer'Image(numMayor));
end TC;
task body TB is
suma : Integer :=0;
begin
	for i in 1..tamanio loop
		suma := suma + v1(i);
	end loop;
	mostrarVector;
	Put(Integer'Image(suma));
end TB;
task body A is
begin
  Put_Line ("AAAA");
  delay (0.0);
  Put_Line ("AAAA");
end A;
task body B is
begin
  Put_Line ("BBBB");
  delay (0.0);
  Put_line ("BBBB");

end B;
begin
   Put_Line  ("-- parte principal del paquete de tareas");
end paqtareas;

