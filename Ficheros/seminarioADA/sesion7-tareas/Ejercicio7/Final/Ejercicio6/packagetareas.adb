with Kernel.Serial_Output; use Kernel.Serial_Output;
with packagefuncionesvector;use packagefuncionesvector;
package body packagetareas is
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
end packagetareas;