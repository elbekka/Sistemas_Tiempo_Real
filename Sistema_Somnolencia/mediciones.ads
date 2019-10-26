--Declaracion de tipos que se van a usar en el paquete.

--Paquete mediciones,incluye el objeto protegido para almacenar las mediciones.
package mediciones is 
with devices;use devices;
    protected Protected_Mediciones is
        pragma priority (9);
        --Declaracion de procedures para la distancia.
        procedure LeerDistancia(DistanciaOut : out Distance_Samples_Type);
        Procedure EscribirDistancia(DistanciaIn : in Distance_Samples_Type);

        --Declaracion de procedures para la vecolidad.
        procedure LeerVelocidad(VelocidadOut : out Speed_Samples_Type);
        procedure EscribirVelocidad(VelocidadIn : in Speed_Samples_Type);
        private
        velocidad : Speed_Samples_Type;
        distancia : Distance_Samples_Type;
    end Protected_Mediciones;
end mediciones;