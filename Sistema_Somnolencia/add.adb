
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
      task DistanciaSeguridad;
      task Display;
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
            Starting_Notice ("Distancia Seguridad");
            Reading_Distance (Distancia_Actual);
            Reading_Speed (Velocidad_Actual);

            mediciones.EscribirDistancia(Distancia_Actual);
            mediciones.EscribirVelocidad(Velocidad_Actual);

            Distancia_Segura := ( Distancia_Actual * Velocidad_Actual) / 100;       
            delay until Periodo_Siguiente;
            Periodo_Siguiente := Periodo_Siguiente + Duration_3ms;
            Finishing_Notice ("Distancia Seguridad"); 
         end loop;
         end DistanciaSeguridad;
      task body Display is 
        Distancia_Actual: Distance_Samples_Type := 0;
       Duration_1ms: Time_Span := To_time_Span(1.0);
      Periodo_Siguiente: Time := Clock + Duration_1ms;
      begin
            loop
               Starting_Notice("Inicio Display");
               mediciones.LeerDistancia(Distancia_Actual);
               put("||--Distancia actual >>  ");
               put_line( Distancia_Actual'Image );
               Finishing_Notice ("Fin Display"); 
            delay until Periodo_Siguiente;
            Periodo_Siguiente := Periodo_Siguiente + Duration_1ms;
            end loop;
         end Display;
begin
   Starting_Notice ("Programa Principal");
   Finishing_Notice ("Programa Principal");
end add;



