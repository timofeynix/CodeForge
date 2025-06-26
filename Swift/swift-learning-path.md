# ✅ Hacking with SwiftUI: Day 1
- Why Swift?
    - 💰 "A lot of money" (high demand);
    - **Safety**: hard to write unsafe code;
    - **Clarity**: easy to write clear and understandable code.
> *"Programming is an art: don't spend all your time sharpening your pencil when you should be drawing."*

- [x] `var`/`let`
    - `var` = create a new variable
    - `let` = constants
    - Use `let` as much as possible — Swift best practice:
        - Safety. Prevents accidental reassignment.
        - Performance. The compiler can optimize let for better performance.

- [x] `String`
    - Multiline: `""" text """`

- [x] `Int` (*integer = whole*) = `1`, `-123`
    - `_` ignored by Swift (improves readability): `1_000_000` -> `1000000`

- [x] `Double` (*double-precision floating-point number*) = `1.0`, `-4.513` (decimals). 
    - **Type safety**: Cannot mix `Int`/`Double` without conversion: `let c = a + Int(b)` or `let c = Double(a) + b`
    - Default to `Double` (avoid `Float` unless optimizing memory)
