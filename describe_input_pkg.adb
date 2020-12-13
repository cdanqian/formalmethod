
pragma SPARK_Mode;

package body Describe_Input_Pkg is

procedure Describe_Input (Arr : Integer_Array; Count : Integer) is

      Count_Even : Integer := 0;
      Count_Odd : Integer := 0;
      Average : Integer := 0;
      Max : Integer;
      Min : Integer;
      Second_Max : Integer;
      Second_Min : Integer;
    
   begin
      for N of Arr loop
         
         if N rem 2 /= 0 then  
            Count_Odd := Count_Odd + 1;
         end if;

         Average := Average + N;
 
      pragma Loop_Invariant
           (for all Index in Arr'First .. Arr'Last => Arr (Index) <= N);
      end loop; 
      Count_Even := Count - Count_Odd;
      Average := Average / Count;
      Max := Arr(100);
      Min := Arr(100 - Count + 1);

      if Count = 1 then
         Second_Max := Max;
         Second_Min := Min;
      else
         Second_Max := Arr(100 - 1);
         Second_Min := Arr(100 - Count + 2);
      end if;

      Put_Line("count of even number:  " &  Count_Even'Image);
      Put_Line("count of odd number:   " &  Count_Odd'Image);
      Put_Line("average:               " &  Average'Image);
      Put_Line("max:                   " &  Max'Image);
      Put_Line("min:                   " &  Min'Image);
      Put_Line("second highest:        " &  Second_Max'Image);
      Put_Line("second lowest:         " &  Second_Min'Image);
      
   end Describe_Input;

end Describe_Input_Pkg;