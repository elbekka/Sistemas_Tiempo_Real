package sintomas is 
    protected Cabeza is
        pragma priority (1);
        procedure LeerCabeza(cabezaOut : out Boolean);
        Procedure EscribirCabeza(cabezaIn : in Boolean);
        private
        CabezaVar : Boolean := False;
        end Cabeza;
    protected Distancia is
        pragma priority (1);
        Procedure LeerDistancia(distanciaOut:out Natural);
        Procedure EscribirDistancia(distanciaIn:in Natural);
        private
        DistanciaVar : Natural range 1..3;
        end Distancia;

end sintomas;