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

# ✅ Hacking with SwiftUI: Day 2
- [x] `Boolean` (`true` / `false`) 
    - `!` operator means "not"
        ```swift
        var isItPossible = true
        isItPossible = !isItPossible // true became false
        print(isItPossible) // false
        ```
    - `.toggle()` switch `Boolean` state
        ```swift
        var amIRight = true
        amIRight.toggle() // true became false
        print(amIRight) // false
        ```
- [x] String interpolation let's us place data into strings efficiently
    - `let luggageCode = "\(1)\(2)\(3)\(4)\(5)"` = `12345`
- [x] Checkpoint 1: Temperature conversion (Celsius to Fahrenheit)
