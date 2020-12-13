
pragma SPARK_Mode;

with Ada.Text_IO; use Ada.Text_IO;
with Shared;

package Describe_Input_Pkg is

use Shared;

   procedure Describe_Input (Arr : Integer_Array; Count : Integer) with 
      Global  => null,
      Depends => (null => Count),
      Pre  => Sorted (Arr, 0, Arr'Length-1);

end Describe_Input_Pkg;