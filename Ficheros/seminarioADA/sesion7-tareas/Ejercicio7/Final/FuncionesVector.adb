

with Kernel.Serial_Output; use Kernel.Serial_Output;

procedure funcionesvector is

--Declaracion de las tareas
task imprimirVector;
task ordenarVector;
task buscarMayorNumVector;

--Cuerpo Tarea ImprimirVector

task body imprimirVector is 
begin
	Put_Line("imprimirVector");
end imprimirVector;

--Cuerpo tarea OrdenarVector
task body ordenarVector is
	Put_Line("ordenarVector");
end ordenarVector;

--Cuerpo tarea buscarMayorNumVector
task body buscarMayorNumVector is
	Put_Line("buscarMayorNumVector");
end buscarMayorNumVector;

end funcionesvector;

