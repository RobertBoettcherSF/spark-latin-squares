pragma SPARK_Mode (On);

package body Latin_Squares is

   function Is_Valid_Placement
     (PLS    : Partial_Latin_Square;
      Row    : Order_Range;
      Col    : Order_Range;
      Symbol : Symbol_Type) return Boolean
   is
   begin
      -- Check the row for duplicates
      for C in 1 .. PLS.N loop
         if PLS.Cells (Row, C) = Symbol then
            return False;
         end if;
         pragma Loop_Invariant (True); -- Placeholder for deeper loop proofs
      end loop;

      -- Check the column for duplicates
      for R in 1 .. PLS.N loop
         if PLS.Cells (R, Col) = Symbol then
            return False;
         end if;
         pragma Loop_Invariant (True); 
      end loop;

      -- If no duplicates are found, the placement is valid
      return True;
   end Is_Valid_Placement;

   procedure Place_Symbol
     (PLS    : in out Partial_Latin_Square;
      Row    : in     Order_Range;
      Col    : in     Order_Range;
      Symbol : in     Symbol_Type)
   is
   begin
      PLS.Cells (Row, Col) := Symbol;
   end Place_Symbol;

end Latin_Squares;
