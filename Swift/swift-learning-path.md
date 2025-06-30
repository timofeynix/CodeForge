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

# ✅ Hacking with SwiftUI: Day 3
- [x] Arrays
    - **Ordered collections** with indexing starting from 0 (0, 1, 2, ...)
    - Type-safe: All elements must be same type
    - `Array<Int>()` — specialized array, `<>` means "must hold"
    - `[String]` — faster way, instead of `Array<Int>()`
    - Key operations:
        - `append()` to add items
        - `count` for size
        - `remove(at:)`/`removeAll()`
        - `contains()` for membership checks
        - `sorted()` for ordering (alphabet/numerical)
    - Initialization:
        - Literal: `[value1, value2]`
        - Empty: `Array<Type>()` or `[Type]()`
- [x] Dictionaries
    // TODO: repeat
    - **Key-value pairs** for unordered data
    - Avoids index errors (safer than arrays for labeled data)
    - Default values for missing keys: `dict[key, default:]`
    - Keys must be unique (reassignment overwrites)
    - Initialization:
        - Literal: `[key: value, ...]`
        - Empty: `[KeyType: ValueType]()`
- [x] Sets
    - **Unordered unique values**
    - Optimized for fast membership checks (`contains()`)
    - No duplicates
    - Initialization:
        - Literal: `Set([...])`
        - Empty: `Set<Type>()`
        - `insert()` to add items
        ```swift
        var actors = Set<String>()
        actors.insert("Nicolas Cage")
        ```
- [x] Enums (enumeration)
    - **Type-safe named options**
    - Prevents invalid states
    - Dot-syntax shorthand after initialization
    ```swift
    enum Weekday {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    }
    var day = Weekday.monday
    day = .tuesday
    ```
    - Memory-optimized storage

# ✅ Hacking with SwiftUI: Day 4
>Good data structures and bad code works a lot better than the other way around. (Eric Raymond)
- [x] Type Annotations
    - Override Swift's type inference with explicit types
    - Syntax: `let name: Type = value`
    - Use when:
        1. Type cannot be inferred
        2. Need specific type (e.g., `Double` over `Int`)
        3. Delayed value assignment (`var name: String`)
    - It's ok to use type inference instead, because:
        - It makes code shorter and easier to read.
        - It allows to change the type of something just by changing its initial value.

# ⏳ Hacking with SwiftUI: Day 5
- [x] Conditions (`if` statements)
    ```swift
    if condition {
        // Code to execute if true
    }
    ```
    - Empty check
    ```swift
    var username = "" 
    //  if username.count == 0 { ... } (inefficient)
    if username.isEmpty {
        username = "Anonymous"
    }
    ```
    - [x] Efficient Conditional Branching
        - Chain mutually exclusive conditions using `else`/`else if`
    - Optimize with logical operators (`&&`, `||`)
    - **Implicit Bool**: Omit `== true` (use `hasConsent` instead of `hasConsent == true`)
    - Operator precedence: Always use parentheses when mixing `&&` and `||`:
        ```swift
        if (isOwner && isEditingEnabled) || isAdmin {
            print("You can delete this post")
        }
        ```
- ...
