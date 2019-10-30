
   with Kernel.Serial_Output; use Kernel.Serial_Output;
   with Ada.Real_Time; use Ada.Real_Time;
   with System; use System;
   with sintomas; use sintomas;

   with Tools; use Tools;
   with Devices; use Devices;
   with sintomas ; use sintomas;
   with mediciones ; use mediciones;
   -- Packages needed to generate pulse interrupts       
   -- with Ada.Interrupts.Names;
   -- with Pulse_Interrupt; use Pulse_Interrupt;

   package body add is

      ----------------------------------------------------------------------
      ------------- procedure exported 
      ----------------------------------------------------------------------
      procedure Background is
      begin
         loop
         null;
         end loop;
      end Background;--Proceso ocioso   (se ejecuta cuando no hay ningun proceso en ejecucion ----------------------------------------------------------------------

      procedure Comprobacion_Cabeza_Inclinada(PosicionCabezaActual ,PosicionCabezaAnterior : in HeadPosition_Samples_Type;
        Volante : in Steering_Samples_Type) is 
       begin
         if ( abs( PosicionCabezaActual(x) ) > 30 and abs( PosicionCabezaAnterior(x) ) > 30 ) then 
              Protected_Sintomas.EscribirInclinacionCabeza(True);
            elsif ( ( PosicionCabezaActual(y) > 30 and PosicionCabezaAnterior(y) > 30 and Volante < 5) or 
               ( ( PosicionCabezaActual(y) < -30 and PosicionCabezaAnterior(y) < -30 and Volante > 5) ) ) then 
              Protected_Sintomas.EscribirInclinacionCabeza(True);
            else
              Protected_Sintomas.EscribirInclinacionCabeza(False);
            end if;
         end Comprobacion_Cabeza_Inclinada;
      -----------------------------------------------------------------------
      ------------- declaration of tasks 
      -----------------------------------------------------------------------
         --task GuardardistanciaSeguridad;
      -- task Guardarcabeza_inclinada;
         task CabezaInclinada is 
            pragma priority(3);
            end CabezaInclinada;
         task Riesgos is 
            pragma priority(5);
            end Riesgos;
         task DistanciaSeguridad is 
            pragma priority(2);
            end DistanciaSeguridad;
         task Display is 
            pragma priority(1);
            end Display;
      -- Aqui se declaran las tareas que forman el STR
      -----------------------------------------------------------------------
      ------------- body of tasks 
      -----------------------------------------------------------------------
         task body CabezaInclinada is 
               PosicionCabezaActual: HeadPosition_Samples_Type := (+2,-2);
               PosicionCabezaAnterior: HeadPosition_Samples_Type := (0,0);
               Volante: Steering_Samples_Type := 0;
               Duracion_4ms: Time_Span := To_time_Span(0.4);
               Periodo_Siguiente: Time := Big_Bang + Duracion_4ms;
      begin
          loop
            Starting_Notice ("Cabeza Inclinada Init"); 
            Reading_HeadPosition (PosicionCabezaActual);
            Reading_Steering (Volante);
            Comprobacion_Cabeza_Inclinada(PosicionCabezaActual,PosicionCabezaAnterior,Volante);
            PosicionCabezaAnterior := PosicionCabezaActual;
            Finishing_Notice ("Cabeza Inclinada Fin");             
            delay until Periodo_Siguiente;
            Periodo_Siguiente := Periodo_Siguiente + Duracion_4ms;
         end loop;
            end CabezaInclinada;
      task body Riesgos is 
                CabezaInclinada: Sintomas.Boolean;
      Velocidad_Actual: Speed_Samples_Type := 0;
      Tipo_Distancia_Var: Tipo_Distancia;
      Duration_015ms: Time_Span := To_time_Span(0.15);
      Periodo_Siguiente: Time := Big_Bang + Duration_015ms;
      begin
          loop
               Starting_Notice ("Riesgos Init");
               
               Protected_Sintomas.LeerInclinacionCabeza( CabezaInclinada );
               Protected_Mediciones.LeerVelocidad(Velocidad_Actual);
               Protected_Mediciones.LeerDistancia( Tipo_Distancia_Var );
            

               if( ( CabezaInclinada = sintomas.Boolean'Val(0) ) and ( Velocidad_Actual > 70 )) then
                  Beep(2);
               elsif ( CabezaInclinada = sintomas.Boolean'Val(0) ) then
                  Beep(1);
               end if;

               case Tipo_Distancia_Var is
               when INSEGURA   => Light(On);
               when IMPRUDENTE => Light(On); Beep(3);
               when others => Light(Off);
               end case;
               
               if (( Tipo_Distancia_Var = Tipo_Distancia'Val(3) ) and  CabezaInclinada ) then
                  Beep(5);
                  Activate_Automatic_Driving;
               end if;
               

               Finishing_Notice ("Riesgos Fin"); 
                 delay until Periodo_Siguiente;
               Periodo_Siguiente := Periodo_Siguiente + Duration_015ms;
         end loop;
            end Riesgos;
         task body DistanciaSeguridad is 
            Distancia_Actual: Distance_Samples_Type := 0;
            Velocidad_Actual: Speed_Samples_Type := 0;
            Distancia_Segura: Speed_Samples_Type := 0;
            Duration_3ms: Time_Span := To_time_Span(0.3);
            Periodo_Siguiente: Time := Big_Bang + Duration_3ms;
            begin
               loop
                  Starting_Notice ("Distancia Seguridad Init");
                  --Leemos los sensores de distancia y velocidad
                  Reading_Distance (Distancia_Actual);
                  Reading_Speed (Velocidad_Actual);
                  Protected_Mediciones.EscribirDistancia(Distancia_Actual);
                  Protected_Mediciones.EscribirVelocidad(Velocidad_Actual);
                  --Calculamos la distancia segura 
                  Distancia_Segura := (Velocidad_Actual * Velocidad_Actual)/ 100; 

            --Comprobaciones

              if ( Speed_Samples_Type(Distancia_Actual) < ( Distancia_Segura / 3 ) ) then 
                  Protected_Sintomas.EscribirDistancia( Tipo_Distancia'Val (3) );
            elsif ( Speed_Samples_Type(Distancia_Actual) < ( Distancia_Segura / 2 ) ) then
               Protected_Sintomas.EscribirDistancia( Tipo_Distancia'Val (2) );
            elsif ( Speed_Samples_Type(Distancia_Actual) < Distancia_Segura ) then
               Protected_Sintomas.EscribirDistancia( Tipo_Distancia'Val (1) );
            else 
               Protected_Sintomas.EscribirDistancia( Tipo_Distancia'Val (0) );
            end if;      
            delay until Periodo_Siguiente;
            Periodo_Siguiente := Periodo_Siguiente + Duration_3ms;
            Finishing_Notice ("Distancia Seguridad Fin"); 
          end loop;
            end DistanciaSeguridad;
         task body Display is 
            Distancia_Actual: Distance_Samples_Type := 0;
          Tipo_Distancia_Actual : Tipo_Distancia;
          Duration_1ms: Time_Span := To_time_Span(1.0);
          Periodo_Siguiente: Time := Big_Bang + Duration_1ms;
          ValorInclinacion : Sintomas.Boolean ;
          begin
            loop
               Starting_Notice("Display Init");
               Protected_Mediciones.LeerDistancia(Distancia_Actual);
               Protected_Sintomas.LeerDistancia(Tipo_Distancia_Actual);
               Protected_Sintomas.LeerInclinacionCabeza(ValorInclinacion);
               Display_Distance(Distancia_Actual);
               Put_Line(" ");
               Put("..........# Tipo Distancia:");
               Put_Line(Tipo_Distancia'Image(Tipo_Distancia_Actual));
               Put("..........# Cabeza Inclinada:");
               Put_Line(Sintomas.Boolean'Image(ValorInclinacion));
               Finishing_Notice ("Display Fin"); 
            delay until Periodo_Siguiente;
            Periodo_Siguiente := Periodo_Siguiente + Duration_1ms;
            end loop;
         end Display;
begin
   Starting_Notice ("Programa Principal");
   Finishing_Notice ("Programa Principal");
end add;



