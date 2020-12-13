pragma SPARK_Mode;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;  
with Quick_Sort_Pkg;
with Describe_Input_Pkg;
with Shared;

procedure My_Task is 
 use Quick_Sort_Pkg;
 use Describe_Input_Pkg;
 use Shared; 

   Count : Integer; 
   Input_Counter: Integer := 0;

begin 
   Put ("Enter count of integer(s): ");  
   Get(Count);
   declare
      Input_Arr : Integer_Array(1..100); -- accept up to 100 input values
   begin
      if Count < 1 or Count > 100 then
            Put ("Count must between 1 to 100. ");
      else
            -- Read user input
            Put_Line("Enter" & Count'Image &" integer(s)");
            for Value of Input_Arr loop
               Input_Counter := Input_Counter + 1;
               if Input_Counter <= Count then
                  Get(Value);
               else
                  Value := 0; -- fill rest of Input_Arr with 0  
               end if;                    
            end loop; 

            -- Quick sort input array
            Quick_Sort(Input_Arr);

            -- Describe input array and output
            Describe_Input(Input_Arr, Count); 

      end if;
   end; 

end My_Task;