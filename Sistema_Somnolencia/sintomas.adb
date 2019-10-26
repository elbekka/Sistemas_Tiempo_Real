
package body sintomas is 
    --Body Cabeza
    protected body Protected_Inclinacion is 
        Procedure LeerInclinacionCabeza(InclinacionOut : out Boolean) is
            begin
                InclinacionOut:= inclinacionCabeza;
            end LeerInclinacionCabeza;
        Procedure EscribirInclinacionCabeza (InclinacionIn : in Boolean) is 
            begin
                inclinacionCabeza:=InclinacionIn;
            end EscribirInclinacionCabeza;
        Procedure LeerDistancia(distanciaOut : out Tipo_Distancia) is 
            begin
                distanciaOut:=distancia;
         end LeerDistancia;
        Procedure EscribirDistancia(distanciaIn : in Tipo_Distancia) is
            begin
                distancia:=distanciaIn;
         end EscribirDistancia;
    end Protected_Inclinacion;
begin
    null;
end sintomas;

