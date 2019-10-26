
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

      -----------------------------------------------------------------------
      ------------- declaration of tasks 
      -----------------------------------------------------------------------
         --task GuardardistanciaSeguridad;
      -- task Guardarcabeza_inclinada;
      --  task Riesgos;
         task DistanciaSeguridad is 
            pragma priority(4);
            end DistanciaSeguridad;
         task Display is 
            pragma priority(5);
            end Display;
      -- Aqui se declaran las tareas que forman el STR
      -----------------------------------------------------------------------
      ------------- body of tasks 
      -----------------------------------------------------------------------

         task body DistanciaSeguridad is 
            Distancia_Actual: Distance_Samples_Type := 0;
            Velocidad_Actual: Speed_Samples_Type := 0;
         Distancia_Segura: Speed_Samples_Type := 0;
         Duration_3ms: Time_Span := To_time_Span(0.3);
         Periodo_Siguiente: Time := Clock + Duration_3ms;
         begin
          loop
            Starting_Notice ("Distancia Seguridad Init");
            --Leemos los sensores de distancia y velocidad
            Reading_Distance (Distancia_Actual);
            Reading_Speed (Velocidad_Actual);
            Protected_Mediciones.EscribirDistancia(Distancia_Actual);
            Protected_Mediciones.EscribirVelocidad(Velocidad_Actual);
            --Calculamos la distancia segura 
            Distancia_Segura := ( Distance_Samples_Type'Image(Distancia_Actual) *Speed_Samples_Type'Image(Velocidad_Actual)) / 100; 

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
            Finishing_Notice ("Distancia Seguridad"); 
         end loop;
         end DistanciaSeguridad;
      task body Display is 
        Distancia_Actual: Distance_Samples_Type := 0;
        Tipo_Distancia_Actual : Tipo_Distancia;
       Duration_1ms: Time_Span := To_time_Span(1.0);
      Periodo_Siguiente: Time := Clock + Duration_1ms;
      begin
            loop
               Starting_Notice("Inicio Display");
               Protected_Mediciones.LeerDistancia(Distancia_Actual);
               Protected_Sintomas.LeerDistancia(Tipo_Distancia_Actual);
               Display_Distance(Distancia_Actual);
               Put_Line(Tipo_Distancia'Image(Tipo_Distancia_Actual));
               Finishing_Notice ("Fin Display"); 
            delay until Periodo_Siguiente;
            Periodo_Siguiente := Periodo_Siguiente + Duration_1ms;
            end loop;
         end Display;
begin
   Starting_Notice ("Programa Principal");
   Finishing_Notice ("Programa Principal");
end add;



