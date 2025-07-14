
// TODO: rewrite to topic-based style instead of chonological

> *"Programming is an art: don't spend all your time sharpening your pencil when you should be drawing."*

- [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui)
- [CS193p 2023 Stanford Course](https://cs193p.stanford.edu/2023) 

# Fundamentals

## Why Swift

- High demand
- **Safety**: hard to write unsafe code;
- **Clarity**: easy to write clear and understandable code.

## Basic Syntax

- `var`/`let`
    - `var` creates a new variables
    - `let` declares constants
    - Prefer `let` for safety and performance

- String interpolation lets us place data into strings efficiently
    - `\(value)' syntax

- Type Annotations
    - Override Swift's type inference with explicit types: `let name: Type = value`
    - Use when:
        1. Type can't be inferred
        2. Need specific type (e.g., `Double` over `Int`)
        3. Delayed value assignment (`var name: String`)
    - It's ok to use type inference instead, because:
        - It makes code shorter and easier to read.
        - It allows to change the type of something just by changing its initial value.

## Primitive Types

- `String`: Text data = `"Hello!"`, `"""Hi"""` (multiline)

- `Int`: Whole numbers = `7`, `-123`, `1_000_000` (`_` ignored for readability)

- `Double`: Decimal numbers = `3.6`, `-4.513`

- `Boolean` (`true` / `false`) 
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

## Collections

- Arrays
    - **Ordered, index-based collections**
    - Type-safe: All elements must be same type
        - `Array<Int>()` — specialized array, `<>` means "must hold"
        - `[String]` — faster way, instead of `Array<Int>()`
    - Operations:
        - `append()` to add items
        - `count` for size
        - `remove(at:)`/`removeAll()`
        - `contains()` for membership checks
        - `sorted()` for ordering (alphabet/numerical)
    - Initialization:
        - Literal: `[value1, value2]`
        - Empty: `Array<Type>()` or `[Type]()`

- Dictionaries
    - **Key-value pairs** for unordered data
    - Avoids index errors (safer than arrays for labeled data)
    - Default values for missing keys: `dict[key, default: value]`
    - Keys must be unique (reassignment overwrites)
    - Initialization:
        - Literal: `[key: value, ...]`
        - Empty: `[KeyType: ValueType]()`

- Sets
    - **Unordered unique values**
    - Optimized for fast membership checks: `contains()`
    - Initialization:
        - Literal: `Set([...])`
        - Empty: `Set<Type>()`
        - `insert()` to add items
        ```swift
        var actors = Set<String>()
        actors.insert("Nicolas Cage")
        ```

## Control Flow

- Conditionals 
    - `if`/`else if`/`else`
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
    - Efficient Conditional Branching
        - Chain mutually exclusive conditions using `else`/`else if`
    - Optimize with logical operators (`&&`, `||`)
    - **Implicit Bool**: Omit `== true` (use `hasConsent` instead of `hasConsent == true`)
    - Operator precedence: Always use parentheses when mixing `&&` and `||`:
        ```swift
        if (isOwner && isEditingEnabled) || isAdmin {
            print("You can delete this post")
        }
        ```

- Ternary Conditional Operator
    - Compact single-line `if`/`else` alternative. Syntax: `condition ? trueValue : falseValue`
        ```swift
        let animal = "Elephant"
        let size = animal == "Elephant" ? "Large" : "Compact" // "Large"
        ```
    - Keep on single line condition checks
    - Use only when clearer than `if`/`else`
    - Good for SwiftUI view modifiers

- `switch` statements
    - Use when comparing **one value against multiple possibilities** (cleaner than long `if`/`else` chains):
        ```swift
        let grade = "B"

        switch grade {
            case "A": print("Great!")
            case "B": print("Good")  // This runs
            case "C": print("Okay")
            default: print("Try again")  // Mandatory catch-all; required unless all cases covered
        }
        ```
    - Exhaustive checks — must handle all cases (safe)
    - Pattern matching — works with ranges, enums, tuples
    - Clean syntax
    - No fallthrough — only one case executes
    - Combine cases — `case "rain", "snow":`

- loops
    - `for` loops: Execute code for fixed sequences
        ```swift
        for i in 1...3 {
            print("Number \(i)")  // Prints 1, 2, 3
        }
        ```
    - `_` in Loops: Ignore unused loop variables
        ```swift
        for _ in 1...3 {
            print("Jump")
        }
        ```
        - Use when only repetition matters, not index → Improves readability/performance
    - `while` loops
        - Repeat while condition is 'true'
            ```swift
            var countdown = 3
            while countdown > 0 {
                print("\(countdown)...")
                countdown -= 1
            }
            print("Go!")
            ```
        - Best for:
            - User input validation
            - Game loops
            - Sensor data polling
        - ⚠️ Must modify condition variable inside loop to prevent infinite loops (e.g. use `countdown -= 1` instead of `countdown = 1`)
    - Loop Control
        - `break`: Exit loop immediately (use to find target value)
            ```swift
            for i in 1...10 {
                if i == 4 {
                    break // Stops at 3
                }  
                print(i)  // 1, 2, 3
            }
            ```
        - `continue`: Skip current iteration (use to skip invalid cases)
            ```swift
            for i in 1...5 {
                if i == 3 {
                    continue
                }  // Skips 3
                print(i)  // 1, 2, 4, 5
            }
            ```
    - Labeled Statements (control nested loops precisely)
        ```swift
        outerLoop: for i in 1...3 {
            for j in 1...3 {
                if j == 2 {
                    continue outerLoop
                }
                print("\(i)-\(j)") // Output: 1-1, 2-1, 3-1
            }
        }
        ```

- [x] FizzBuzz task
    - Initial Approach:
        ```swift
        for i in 1...100 {
            if i % 3 == 0 && i % 5 == 0 { 
                print("FizzBuzz")
            } else if i % 3 == 0 {
                print("Fizz")
            } else if i % 5 == 0 {
                print("Buzz")
            } else {
                print(i)
            }
        }
        ```
    - Improved approach (after hints):
        ```swift
        for i in 1...100 {
            if i.isMultiple(of: 15) {
                print("FizzBuzz")
            } else if i.isMultiple(of: 3) {
                print("Fizz")
            } else if i.isMultiple(of: 5) {
                print("Buzz")
            } else {
                print(i)
            }
        }
        ```
    - `isMultiple(of:)` > modulo :
        - Clearer reading: `i.isMultiple(of: 15)` vs `i % 15 == 0`
        - Official Swift recommendation
    - Great milestone! Most developers struggle with this

## Functions

- Functions basics
    - **Declaration**:
        ```swift
        func greet(name: String) {
            print("Hello, \(name)!")
        }
        greet(name: "Fred")
        ```
    - **When to create functions**:
        - Duplicate code (3+ repetitions)
        - Complex logic chunks
        - Clear abstraction boundaries
    - **Parameter count**:
        - Ideal: 0-3 parameters
        - Max: 6 parameters (use structs beyond this)

- Returning values
    - **Single return**:
        ```swift
        func square(number: Int) -> Int {
            return number * number
        }
        ```
    - **Implicit return** (only for single expressions!):
        ```swift
        func square(number: Int) -> Int {
            number * number
        }
        ```

- Multiple return values
    - **Using tuples**:
        ```swift
        func getUser() -> (name: String, age: Int) {
            (name: "Jane", age: 19)
        }
        let user = getUser()
        print(user.name)    // Jane
        print(user.age)     // 19
        ```
    - **Collection choices**:        
        | Use Case             | Type  | Example                 |
        | -------------------- | ----- | ----------------------- |
        | Ordered duplicates   | Array | `[1,1,2]`               |
        | Unique unordered     | Set   | `Set([1,2,3])`          |
        | Fixed related values | Tuple | `(name: "Li", age: 40)` |

- Parameter labels
    - **External customization**:
        ```swift
        func sayHello(to name: String) {  // External 'to', internal 'name'
            print("Hello, \(name)!")
        }
        sayHello(to: "Leo")
        ```
    - **Omitting labels**:
        ```swift
        func greet(_ name: String) {  // No external label
            print("Hi, \(name)!")
        }
        greet("Tim")
        ```
        - Use when: Parameter name is clear at call site

## Enums & Optionals

- Enums (enumeration)
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

- Optionals
    ```swift
    let pseudoNumber = "123" // 123 is a String
    let convertedNumber = Int(pseudoNumber) // 123 is an optional Int, not just an Int

    let anotherValue = Int? // contains Int value or no value
    ```
    - nil
        - `nil` = no value.
        - optional variable w/o a value is automatically set to `nil`

        ```stift
        var champion: String? // champion = nil
        ```
    - **Unwrapping Techniques**:
        - Optional Binding: `if let value = optional { }`
            - Find out whether an optional contains a value, and if so, to make that value available as a temporary constant or variable.
        - `guard let` for early exits
        - Nil coalescing: `?? defaultvalue`

# Memory Management & Types

- Value types: `struct`) // TODO: add `enum`
    - 99.9% of cases
    - Functional programming
    - Inheritance (single)

- Reference type: `class`
    - Reference type
    - OOP
    - Use for ViewModels

- Protocols
    - "stripped down" struct/class
    - Has functions and vars, but no implementation (no storage)
    - used for
        - specifying the behavior of a struct, class, or enum: `struct ContentView: View`
        - "constrains and gains"
        - turning "don't cares" to "somewhat cares": `struct Array<Element> where Element: Equatable`

- Generics (AKA don't care" type)
    - Swift uses them extensively
    - Type-agnostic code: `func swap<T>(_ a: inout T, _ b: inout T)`
    

# SwiftUI Essentials

## View Composition

- Containers
    - `HStack`: Horizontal layout
    - `VStack`: Vertical layout
    - `ZStack`: Layered views

- Reusable Components
    ```swift
    struct CardView: View {
        let content: String
        @State private var isFaceUp = false
    }
    ```

- **Modifiers**
    - Chainable: `.padding().background(.blue)`
    - Conditional: `.opacity(isActive ? 1 : 0`

## State Management

- `@State`
    - View-specific mutable data (`cardCount`, `isFaceUp`)
    - Triggers UI updates on change

 - `@ObservedObject`
    - External reference types
    - Never assign directly: `@ObservableObject var vm: ViewModel`



