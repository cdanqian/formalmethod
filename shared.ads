package Shared is  

   type Integer_Array is array (Positive range <>) of Integer;

   -- Reference: https://blog.adacore.com/verifythis-challenge-in-spark
   function Sorted (A : Integer_Array; I, J : Integer) return Boolean is
      (for all K in I .. J-1 => A(K) <= A(K+1))
   with Ghost,
        Pre => J > Integer'First
          and then (if I <= J then I in A'Range and J in A'Range);

end Shared;