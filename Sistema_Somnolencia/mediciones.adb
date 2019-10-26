package body mediciones is  
  --body de las mediciones
  protected body Protected_Mediciones is 
    procedure LeerDistancia(DistanciaOut : out Distance_Samples_Type) is 
      begin
        DistanciaOut := distancia;
      end LeerDistancia;
    Procedure body EscribirDistancia(DistanciaIn : in Distance_Samples_Type) is
      begin
        distancia:=DistanciaIn;
      end EscribirDistancia;
    procedure body LeerVelocidad(VelocidadOut : out Speed_Samples_Type) is
      begin
      VelocidadOut:= velocidad;
      end LeerVelocidad;
    procedure body  EscribirVelocidad(VelocidadIn : in Speed_Samples_Type) is
      begin
      velocidad:=VelocidadIn;
     end EscribirVelocidad;
    end Protected_Mediciones;
  begin
    null;
  end mediciones;