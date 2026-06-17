# spark-latin-squares

Formal verification and modeling of partial Latin squares in SPARK Ada, inspired by Allsop & Morris (2026)

## Overview

This project implements a formally verified SPARK Ada package for working with partial Latin squares. A Latin square is an n×n array filled with n different symbols, each occurring exactly once in each row and exactly once in each column. A partial Latin square allows some cells to be empty (represented by 0).

## Project Structure

- `latin_squares.ads` - Package specification with types and contracts
- `latin_squares.adb` - Package body with implementations
- `main.adb` - Main procedure demonstrating package usage
- `latin_squares.gpr` - GNAT Project file for building and proving

## Types

- **`Order_Range`**: Integer range 1..100 for square dimensions
- **`Symbol_Type`**: Integer range 0..100 (0 = empty cell)
- **`Partial_Latin_Square(N)`**: Discriminated record type for n×n grids

## Key Functions & Procedures

### `Is_Valid_Placement`
Checks if placing a symbol at a specific position violates Latin square rules.

```ada
function Is_Valid_Placement
  (PLS    : Partial_Latin_Square;
   Row    : Order_Range;
   Col    : Order_Range;
   Symbol : Symbol_Type) return Boolean
```

**Precondition**: `Row <= PLS.N and then Col <= PLS.N and then Symbol in 1 .. PLS.N`

### `Place_Symbol`
Inserts a valid element into the grid.

```ada
procedure Place_Symbol
  (PLS    : in out Partial_Latin_Square;
   Row    : in     Order_Range;
   Col    : in     Order_Range;
   Symbol : in     Symbol_Type)
```

**Precondition**: Position within bounds, symbol in valid range, and placement is valid
**Postcondition**: `PLS.Cells(Row, Col) = Symbol`

## Building & Verification

### Prerequisites
- GNAT (GNU Ada Compiler)
- SPARK/gnatprove for formal verification
- Alire (optional, for dependency management)

### Build the Project

```bash
# Compile with SPARK checks
gnatmake -P latin_squares.gpr
```

### Run Formal Proofs

```bash
# Run all proofs at maximum level
gnatprove -P latin_squares.gpr --level=4 --timeout=0 --no-inlining --report=all --verbose

# Quick proof check
gnatprove -P latin_squares.gpr --level=1
```

### Proof Options

- `--level=0-4`: Proof level (0=minimal, 4=maximum)
- `--timeout=N`: Timeout in seconds (0=unlimited)
- `--no-inlining`: Disable function inlining for clearer proofs
- `--report=all`: Generate detailed proof reports

## Usage Example

See `main.adb` for a complete example:

```ada
pragma SPARK_Mode (On);

with Latin_Squares;

procedure Main is
   PLS : Latin_Squares.Partial_Latin_Square (3);
begin
   Latin_Squares.Place_Symbol (PLS, 1, 1, 1);
   Latin_Squares.Place_Symbol (PLS, 2, 2, 2);
   Latin_Squares.Place_Symbol (PLS, 3, 3, 3);
end Main;
```

## Proof Status

All proofs pass at level 4 with no warnings or errors.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## References

- Allsop & Morris (2026) - Inspiration for the formal approach to Latin squares
