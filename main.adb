pragma SPARK_Mode (On);

with Latin_Squares;

procedure Main is
   -- Simple main procedure to demonstrate the Latin_Squares package
   PLS : Latin_Squares.Partial_Latin_Square (3);
begin
   -- Place some symbols to create a partial Latin square
   Latin_Squares.Place_Symbol (PLS, 1, 1, 1);
   Latin_Squares.Place_Symbol (PLS, 2, 2, 2);
   Latin_Squares.Place_Symbol (PLS, 3, 3, 3);
   
   -- The proof will verify that these placements are valid
   pragma Assert (PLS.Cells (1, 1) = 1);
   pragma Assert (PLS.Cells (2, 2) = 2);
   pragma Assert (PLS.Cells (3, 3) = 3);
end Main;
