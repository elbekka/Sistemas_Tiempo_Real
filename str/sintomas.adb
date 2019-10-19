
package body sintomas is 

    procedure ProcedureSintomas is 

    protected Cabeza is
        pragma priority (Ceiling_Priority_of_P);
        procedure LeerCabeza(cabezaOut : out Boolean);
        Procedure EscribirCabeza(cabezaIn : in Boolean);
        private
        CabezaVar : Boolean := False;
        end Cabeza;
    protected Distancia is
        pragma priority (Ceiling_Priority_of_P);
        Procedure LeerDistancia(distanciaOut:out Natural);
        Procedure EscribirDistancia(distanciaIn:in Natural);
        private
        DistanciaVar : Natural range 1..3;
        end Distancia;

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
        DistanDistanciaVarcia:=distanciaIn;
        end EscribirDistancia;
        end Distancia;
        begin 
        null;
end ProcedureSintomas;
begin
    null;
end sintomas;

