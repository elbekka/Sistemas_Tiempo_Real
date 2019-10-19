package sintomas is 
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

end sintomas;