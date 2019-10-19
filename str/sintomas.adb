
package body sintomas is 

    procedure ProcedureSintomas is 

    protected Cabeza is
        procedure LeerCabeza(cabezaOut : out Boolean);
        Procedure EscribirCabeza(cabezaIn : in Boolean);
        private
        _Cabeza : Boolean := False;
        end Cabeza;
    protected Distancia is
        Procedure LeerDistancia(distanciaOut:out Natural);
        Procedure EscribirDistancia(distanciaIn:in Natural);
        private
        _Distancia : Natural range 1..3;
        end Distancia;

    --Body Cabeza
    protected body Cabeza is 
        Procedure LeerCabeza(cabezaOut : out Boolean) is
        begin
            cabezaOut:= _Cabeza;
        end LeerCabeza;
        Procedure EscribirCabeza (cabezaIn : in Boolean) is 
        begin
        _Cabeza:=cabezaIn;
        end EscribirCabeza;
        end Cabeza;

    procedure body Distancia is 
        Procedure LeerDistancia(distanciaOut : out Natural) is 
        begin 
            distanciaOut:=_Distancia;
        end LeerDistancia;

        procedure EscribirDistancia (distanciaIn : in Natural) is
        begin
        _Distancia:=distanciaIn;
        end EscribirDistancia;
        end Distancia;
end ProcedureSintomas;
begin
    null;
end sintomas;

