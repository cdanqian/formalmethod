-----------------------------------------------------------------------
-- Generic Quick_Sort procedure
-- Reference: http://rosettacode.org/wiki/Sorting_algorithms/Quicksort
----------------------------------------------------------------------- 
pragma SPARK_Mode;

package body Quick_Sort_Pkg is

procedure Quick_Sort (A : in out Integer_Array) is
      procedure Swap(Left, Right : Integer) is
         Temp : Integer := A (Left);
      begin
         A (Left) := A (Right);
         A (Right) := Temp;
      end Swap;
   
   begin
      if A'Length > 1 then
      declare
         Pivot_Value : Integer := A (A'First);
         Right       : Integer := A'Last;
         Left        : Integer := A'First;
      begin
         loop
            while Left < Right and not (Pivot_Value < A (Left)) loop
               Left := Integer'Succ (Left);
            end loop;
            while Pivot_Value < A (Right) loop
               Right := Integer'Pred (Right);
            end loop;
            exit when Right <= Left;
            Swap (Left, Right);
            Left := Integer'Succ (Left);
            Right := Integer'Pred (Right);
         end loop;
         if Right = A'Last then
            Right := Integer'Pred (Right);
            Swap (A'First, A'Last);
         end if;
         if Left = A'First then
            Left := Integer'Succ (Left);
         end if;
         Quick_Sort (A (A'First .. Right));
         Quick_Sort (A (Left .. A'Last));
      end;
      end if;

   end Quick_Sort;
   
 end Quick_Sort_Pkg;