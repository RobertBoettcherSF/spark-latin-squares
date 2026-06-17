pragma SPARK_Mode (On);

package Latin_Squares is

   -- Define the boundaries for the order of our Latin squares
   Max_Order : constant := 100;
   subtype Order_Range is Integer range 1 .. Max_Order;
   
   -- 0 represents an empty cell in a *partial* Latin square
   subtype Symbol_Type is Integer range 0 .. Max_Order; 

   type Grid is array (Order_Range range <>, Order_Range range <>) of Symbol_Type;

   -- The core data structure 
   type Partial_Latin_Square (N : Order_Range) is record
      Cells : Grid (1 .. N, 1 .. N) := (others => (others => 0));
   end record;

   -- Helper function: Checks if a placement violates Latin square rules
   function Is_Valid_Placement
     (PLS    : Partial_Latin_Square;
      Row    : Order_Range;
      Col    : Order_Range;
      Symbol : Symbol_Type) return Boolean
   with
     Pre => Row <= PLS.N and then Col <= PLS.N and then Symbol in 1 .. PLS.N;

   -- Procedure to insert a valid element into the grid
   procedure Place_Symbol
     (PLS    : in out Partial_Latin_Square;
      Row    : in     Order_Range;
      Col    : in     Order_Range;
      Symbol : in     Symbol_Type)
   with
     Pre  => Row <= PLS.N 
             and then Col <= PLS.N 
             and then Symbol in 1 .. PLS.N
             and then Is_Valid_Placement (PLS, Row, Col, Symbol),
     Post => PLS.Cells (Row, Col) = Symbol;

end Latin_Squares;
