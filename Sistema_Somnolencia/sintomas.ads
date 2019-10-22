type Boolean is (False,True);
type Tipo_Distancia is (SEGURA,INSEGURA,IMPRUDENTE,COLISION);

package sintomas is 
    protected Cabeza is
        pragma priority (10);
        procedure LeerCabeza(cabezaOut : out Boolean);
        Procedure EscribirCabeza(cabezaIn : in Boolean);
        private
        CabezaVar : Boolean := False;
        end Cabeza;
    --protected Distancia is
      pragma priority (9);
        Procedure LeerDistancia(distanciaOut:out Natural);
        Procedure EscribirDistancia(distanciaIn:in Natural);
        private
        DistanciaVar : Natural range 1..3;
        end Distancia;

end sintomas;