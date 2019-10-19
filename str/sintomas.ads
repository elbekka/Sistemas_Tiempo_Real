package sintomas is 
 protected Cabeza is
        procedure LeerCabeza(cabezaOut : out Boolean);
        Procedure EscribirCabeza(cabezaIn : in Boolean);
        private
        Cabeza : Boolean := False;
        end Cabeza;
    protected Distancia is
        Procedure LeerDistancia(distanciaOut:out Natural);
        Procedure EscribirDistancia(distanciaIn:in Natural);
        private
        Distancia : Natural range 1..3;
        end Distancia;

end sintomas;