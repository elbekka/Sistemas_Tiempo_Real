
package body sintomas is 


    --Body Cabeza
    protected body Cabeza is 
        Procedure LeerCabeza(cabezaOut : out Boolean) is
        begin
            cabezaOut:= CabezaVar;
        end LeerCabeza;
        Procedure EscribirCabeza (cabezaIn : in Boolean) is 
        begin
        CabezaVar:=cabezaIn;
        end EscribirCabeza;
        end Cabeza;

    protected body Distancia is 
        Procedure LeerDistancia(distanciaOut : out Natural) is 
        begin 
            distanciaOut:=DistanciaVar;
        end LeerDistancia;

        procedure EscribirDistancia (distanciaIn : in Natural) is
        begin
        DistanciaVar:=distanciaIn;
        end EscribirDistancia;
        end Distancia;
begin
    null;
end sintomas;

