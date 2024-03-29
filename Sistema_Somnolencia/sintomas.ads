
package sintomas is 
--Declaracion de tipos que se van a usar en el paquete.
type Boolean is (False,True);
type Tipo_Distancia is (SEGURA,INSEGURA,IMPRUDENTE,COLISION);
--Paquete Sintormas,incluye el objeto protegido para la evaluacion de sintomas.
    protected Protected_Sintomas is
        pragma priority (5);
        --Declaracion de procedures para la inclinacion de la cabeza.
        procedure LeerInclinacionCabeza(InclinacionOut : out Boolean);
        Procedure EscribirInclinacionCabeza(InclinacionIn : in Boolean);

        --Declaracion de procedures para la distancia.
        procedure LeerDistancia(distanciaOut : out Tipo_Distancia);
        procedure EscribirDistancia(distanciaIn : in Tipo_Distancia);
        private
        inclinacionCabeza : Boolean := False;
        distancia : Tipo_Distancia;
    end Protected_Sintomas;
end sintomas;