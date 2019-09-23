

package paquete is



-----------------------------------------------------
-- Datos exportados
-----------------------------------------------------


subtype Dia_del_mes is Integer range 1..31;
type Agua_recogida is array (Dia_del_mes) of integer;


Enero : Agua_recogida;


-----------------------------------------------------
-- Procedimientos exportados
-----------------------------------------------------
procedure Incrementar (d: in integer);
procedure Modificar (elemento: in Dia_del_Mes; d: in integer; ant: out integer);
function Leer (j: in Dia_del_Mes) return integer;


end paquete;

