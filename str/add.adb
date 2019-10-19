
with Kernel.Serial_Output; use Kernel.Serial_Output;
with Ada.Real_Time; use Ada.Real_Time;
with System; use System;
with sintomas; use sintomas;

with Tools; use Tools;
with Devices; use Devices;

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
    end Background;
    ----------------------------------------------------------------------

    -----------------------------------------------------------------------
    ------------- declaration of tasks 
    -----------------------------------------------------------------------
      task GuardardistanciaSeguridad;
      task Guardarcabeza_inclinada;
    --  task Riesgos;
      --task Display;
    -- Aqui se declaran las tareas que forman el STR
    -----------------------------------------------------------------------
    ------------- body of tasks 
    -----------------------------------------------------------------------

task body GuardardistanciaSeguridad is 
    velocidad: Speed_Samples_Type := 0;
    distanciaR: Distance_Samples_Type := 0;
    distanciaSeg: Distance_Samples_Type := 0;
    Siguiente_instancia: Time;
    Intervalo : Time_Span:=to_Time_Span(0.3);
    begin
	loop
         Starting_Notice ("Tarea Distancia Seguridad");
	Siguiente_instancia:=clock+Intervalo;
	Reading_Speed(velocidad);
	Reading_Distance (distanciaR);
	distanciaSeg:= Distance_Samples_Type ((velocidad/10)*(velocidad/10));
	if((distanciaR/3) < distanciaSeg) then
	   --Light(ON);
	   --Peligro de colision
             Put_Line("peligro de colision");

	elsif((distanciaR/2)<distanciaSeg)then
	   --Light(OFF);
	   --Distancia imprudente
             Put_Line("distancia imprudente");
	else
	   --No hay peligro
       Put_Line("no hay peligro");
	end if;
      Finishing_Notice  ("Finaliza Distancia Seguridad ");
    	delay until Siguiente_instancia;
    	Siguiente_instancia:=Siguiente_instancia+Intervalo;
    	end loop;
    end GuardardistanciaSeguridad;
    -- Aqui se escriben los cuerpos de las tareas 

task body Guardarcabeza_inclinada is
    Siguiente_instancia: Time; 
    giro_del_volante: Steering_Samples_Type := 0;
    Intervalo : Time_Span:=to_Time_Span(0.4);
    act: HeadPosition_Samples_Type;
    ant: HeadPosition_Samples_Type;
    begin
	loop
      Starting_Notice ("Tarea Cabeza inclinada");
         Siguiente_instancia:=clock+Intervalo;
	Reading_HeadPosition(act);
        
	if((act(x)>(30) and  ant(x)>(30)) or (act(x)<(-30) and ant(x)<(-30))) then 
         Put_Line("la cabeza esta inclinada hacia delante o hacia atrás");
        elsif (((ant(y)>(30)) and (act(y)>(30))) and(giro_del_volante>(5))) then
          Put_Line("no hay somnolencia, estamos girando");
        elsif (((ant(y)<(-30)) and (act(y)<(-30))) and (giro_del_volante<(-5))) then
           Put_Line("no hay somnolencia, estamos girando");
        elsif ((act(y)>(30) or act(y)<(-30)) and (giro_del_volante<(5) or giro_del_volante>(-5))) then
          Put_Line("sintoma de somnolencia");
        else 
         Put_Line("no esta la cabeza inclinada");
	end if;

	ant(x):=act(x);
        ant(y):=act(y);
           Finishing_Notice  ("Finaliza Tarea Cabeza inclinada");
       	delay until Siguiente_instancia;
	Siguiente_instancia:=Siguiente_instancia+Intervalo;
        
        end loop;
        end Guardarcabeza_inclinada;
    ----------------------------------------------------------------------
    ------------- procedure para probar los dispositivos 
    ----------------------------------------------------------------------
    procedure Prueba_Dispositivos; 

    Procedure Prueba_Dispositivos is
        Current_V: Speed_Samples_Type := 0;
        Current_H: HeadPosition_Samples_Type := (+2,-2);
        Current_D: Distance_Samples_Type := 0;
        Current_O: Eyes_Samples_Type := (70,70);
        Current_E: EEG_Samples_Type := (1,1,1,1,1,1,1,1,1,1);
    begin
         Starting_Notice ("Prueba_Dispositivo");

         for I in 1..120 loop
         -- Prueba distancia
            --Reading_Distance (Current_D);
            --Display_Distance (Current_D);
            --if (Current_D < 40) then Light (On); 
            --                    else Light (Off); end if;

         -- Prueba velocidad
            --Reading_Speed (Current_V);
            --Display_Speed (Current_V);
            --if (Current_V > 110) then Beep (2); end if;

         -- Prueba Posicion de la cabeza
            --Reading_HeadPosition (Current_H);
            --Display_HeadPosition_Sample (Current_H);
            --if (Current_H(x) > 30) then Beep (4); end if;

         -- Prueba ojos
            --Reading_EyesImage (Current_O);
            --Display_Eyes_Sample (Current_O);

         -- Prueba electroencefalograma
            --Reading_Sensors (Current_E);
            --Display_Electrodes_Sample (Current_E);
   
         delay until (Clock + To_time_Span(0.1));
         end loop;

         Finishing_Notice ("Prueba_Dispositivo");
    end Prueba_Dispositivos;


begin
   Starting_Notice ("Programa Principal");
   Prueba_Dispositivos;
   Finishing_Notice ("Programa Principal");
end add;



