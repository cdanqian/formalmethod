
pragma SPARK_Mode;
with Shared;

package Quick_Sort_Pkg is
   use Shared; 

   procedure Quick_Sort(A : in out Integer_Array) with 
      Global  => null,
      Depends => (A => A),
      Post => Sorted (A, 0, A'Length-1);

end Quick_Sort_Pkg;