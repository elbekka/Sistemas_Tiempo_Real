package body mediciones is  
  --body de las mediciones
  protected Protected_Mediciones is 
    procedure LeerDistancia(DistanciaOut : out Distance_Samples_Type) is 
      begin
        DistanciaOut := distancia;
      end LeerDistancia;
    Procedure EscribirDistancia(DistanciaIn : in Distance_Samples_Type) is
      begin
        distancia:=DistanciaIn;
      end EscribirDistancia;
    procedure LeerVelocidad(VelocidadOut : out Speed_Samples_Type) is
      VelocidadOut:= velocidad;
      end LeerVelocidad;
    procedure EscribirVelocidad(VelocidadIn : in Speed_Samples_Type) is
      velocidad:=VelocidadIn;
     end EscribirVelocidad;
    end Protected_Mediciones;
  begin
    null;
  end mediciones;