
> *"Programming is an art: don't spend all your time sharpening your pencil when you should be drawing."*

- [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui)
- [CS193p 2023 Stanford Course](https://cs193p.stanford.edu/2023) 

## Reading Assignment I: 
- [ ] [The Basics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics)
    - multiple declaration: `var x = 0.0, y = 0.0, z = 0.0`
    - Type Annotations: `var welcomeMessage: String` // you rarely need to use it because of *Type Inference*
    - [x] variables
    - [x] constants
    - [ ] optionals
        - use where a value may be absent
    - [ ] type safety
    - [ ] tuples
- [ ] [Basic Operators](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators)
    _(Covers arithmetic, comparison, logical operators, and ranges)_
- [ ] [Strings and Characters](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters)
    _(String manipulation, interpolation, and Unicode support)_
- [ ] [Collection Types](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes)
    _(Arrays, Sets, and Dictionaries)_
- [ ] [Control Flow](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow)
    _(`if`/`guard`, `switch`, `for`-`in`, `while`, and `break`/`continue`)_
- [ ] [Functions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions)
    _(Defining/calling functions, parameters, return types, and argument labels)_
- [ ] [Closures](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures)
    _(Closure expressions, trailing syntax, and capturing values)_

## Reading Assignment II: Functional Programming
- [ ] protocols
- [ ] extensions
- [ ] generics
- [ ] closures
- [ ] optionals

# Fundamentals

## Why Swift

- High demand
- **Safety**: hard to write unsafe code
- **Clarity**: easy to write clear and understandable code

## Basic Syntax

- `var`/`let`
    - `var` creates a new variables
    - `let` declares constants
    - Prefer `let` for safety and performance
- String interpolation lets us place data into strings efficiently
    - `\(value)' syntax
- **Type Annotations**
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
    - `.toggle()` switch `Bool` state
        ```swift
        var amIRight = true
        amIRight.toggle() // true became false
        print(amIRight) // false
        ```

## Collections

- **Arrays**
    - Ordered, index-based collections
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
- **Dictionaries**
    - Key-value pairs for unordered data
    - Avoids index errors (safer than arrays for labeled data)
    - Default values for missing keys: `dict[key, default: value]`
    - Keys must be unique (reassignment overwrites)
    - Initialization:
        - Literal: `[key: value, ...]`
        - Empty: `[KeyType: ValueType]()`
- **Sets**
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

- **Conditional Statements**
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
- **Ternary Conditional Operator**
    - Compact single-line `if`/`else` alternative. Syntax: `condition ? trueValue : falseValue`
        ```swift
        let animal = "Elephant"
        let size = animal == "Elephant" ? "Large" : "Compact" // "Large"
        ```
    - Keep on single line condition checks
    - Use only when clearer than `if`/`else`
    - Good for SwiftUI view modifiers
- **`switch` statements**
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
    - Combine cases: `case "rain", "snow":`
- **For-In Loops**
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
- [x] **FizzBuzz task**
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
- Reuse code by carving off chunks and giving it a name
- Start with the word `func`, followed by the function's name
- Can accept parameters to control their behaviour
- Can optionally return a value, but you can return multiple pieces of data from a function using a `tuple`
- Can throw errors
- **Functions basics**
    - Declaration:
        ```swift
        func greet(name: String) {
            print("Hello, \(name)!")
        }
        greet(name: "Fred")
        ```
    - When to create functions:
        - Duplicate code (3+ repetitions)
        - Complex logic chunks
        - Clear abstraction boundaries
    - Parameter count:
        - Ideal: 0-3 parameters
        - Max: 6 parameters (use structs beyond this)
    - Default Parameters:
        - Set with `=` after type: `func greet(name: String = "Anonymous"`
        - Use to replace multiple overloaded functions
        - When to use: Common-case simplification (e.g. `print()` defaults)
        - When to avoid: No logical default exists
- **Function types**
    - Concept: Functions have specific types (like `Int`, `String`)
        - Can be assigned to variables/constants
        - Can be passed as parameters
        - Can be returned from other functions
    - Type syntax: `(ParameterTypes) -> ReturnType`
    - Examples: 
        ```swift
        // Variable holding comparison function
        var comparer: (Int, Int) -> Bool = { $0 > $1 }
        print(comparer(9, 3))  // true
        ```
- **Returning values**
    - Single return:
        ```swift
        func square(number: Int) -> Int {
            return number * number
        }
        ```
    - Implicit return (only for single expressions!):
        ```swift
        func square(number: Int) -> Int {
            number * number
        }
        ```
    - Return types must always be **explicit**—Swift cannot infer them
- **Multiple return values**
    - Using tuples:
        ```swift
        func getUser() -> (name: String, age: Int) {
            (name: "Jane", age: 19)
        }
        let user = getUser()
        print(user.name)    // Jane
        print(user.age)     // 19
        ```
    - Collection choices:
        | Use Case             | Type  | Example                 |
        | -------------------- | ----- | ----------------------- |
        | Ordered duplicates   | Array | `[1,1,2]`               |
        | Unique unordered     | Set   | `Set([1,2,3])`          |
        | Fixed related values | Tuple | `(name: "Li", age: 40)` |
- **Parameter labels**
    - External customization:
        ```swift
        func sayHello(to name: String) {  // External 'to', internal 'name'
            print("Hello, \(name)!")
        }
        sayHello(to: "Leo")
        ```
    - Omitting labels:
        ```swift
        func greet(_ name: String) {  // No external label
            print("Hi, \(name)!")
        }
        greet("Tim")
        ```
        - Use when: Function name already describes first parameter (e.g., `green(name:)`)
    - Default Parameter Integration Example:
        ```swift
        func enroll(name: String, department: String = "Engineering") {
            print("\(name) enrolled in (\department)")
        }
        enroll(name: "Lisa")
        ```
- **Closures**
    - Inline functions: `{ param in ... }`
    - Shorthand: `{ $0 * 2 }`
    - `$0` — A special placeholder name for "the first argument" in Swift closures
- **Throwing Functions**
    1. Define `enum` with all the errors you want to throw
        ```swift
        enum NetworkError: Error {
            case timeout, serverDown
        }
        ```
    2. Write a function that's marked throws for those errors
        ```swift
        func fetchData() throws -> Data {
            if serverUnavailable { throw NetworkError.serverDown }
            return Data(...)
        }
        ```
    3. Call them with `try` inside `do` block`, handle specific errors in `catch`
        ```swift
        do {
            let data = try fetchData()
            process(data)
        } catch NetworkError.timeout {
            retryRequiest()
        } catch {
            print("Unhandled: \(error)")
        }
        ```
    - When to throw: Network failures, file I/O errors, invalid input.
    - Throwing functions must be marked with `throws`
    - Swift won't let you run an error-throwing function by accident
    - Able to encounter errors they are unable or unwilling to handle
    - Avoid throwing functions most of the time as a beginner
    - `do` to start a section of code that calls throwing functions
    - `try`
        - By using `try` before every throwing function, we're explicitly acknowledging which parts of our code can cause errors
        - Useful with several throwing functions in a single `do` block 
        - Most other languages don't need the `try`
        - Prevents accidental ignoring of errors
        - Mandatory for compiler to track error propagation
    - `catch`: If any errors are thrown, execution immediately jumps to the catch block

## Enums & Optionals

- **Enums (enumeration)**
    - Type-safe named options
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
- **Optionals**
    - TODO
    - Type Signature: `Type?` is shorthand for `Optional<Type>`
    - nil
        - `nil` = no value.
        - optional variable w/o a value is automatically set to `nil`:
            ```swift
            var champion: String? // champion = nil
            ```
    - Unwrapping Techniques:
        - Optional Binding (`if let`)
            - Safe local unwrapping, ex. `if let value = optional { }`
            - Find out whether an optional contains a value, and if so, to make that value available as a temporary constant or variable.
        - `guard let`: Early-exit unwrapping
            - Allows to avoid `if let` "pyramid of doom"
            ```swift
            func check(age: Int?) {
                guard let age else {
                    print ("Age is nil")
                    return
                }
                if age > 40 {
                    print("You're old")
                }
            }
            ```
        - Nil Coalescing (`??`): Fallback value
            - Great to providing easy default value
            ```swift
            let age = user.age ?? 0
            let name = user.name ?? "Not given"
            ```
        - `?` Optional Chaining
            - Wnen entire object is optional
            ```swift
            var optionalUser: User?
            let name = optionalUser?.name ?? "Not Given"
            
            if let newNAme = optionalUser?.name {
                print(newName)
            }
            ```
        - Forced Unwrapping (`!`)
            - When value must exist (crash overwise)
            - Never ever use it if you're a beginner
            - `let age = user.age!`
         

# Memory Management & Types

- **Value types: `struct`** // TODO: add `enum`
    - 99.9% of cases
    - Functional programming
    - Inheritance (single)
    - Note: Property initialization is **undermined**; doesn't follow declared order
- **Reference type: `class`**
    - Reference type
    - OOP
    - Use for ViewModels
- **Protocols**
    - "stripped down" struct/class
    - Has functions and vars, but no implementation (no storage)
    - used for
        - specifying the behavior of a struct, class, or enum: `struct ContentView: View`
        - "constrains and gains"
        - turning "don't cares" to "somewhat cares": `struct Array<Element> where Element: Equatable`
- **Generics (AKA don't care" type)**
    - Swift uses them extensively
    - Type-agnostic code: `func swap<T>(_ a: inout T, _ b: inout T)`

# SwiftUI Essentials

- Begin every view with minimal placeholder:
    ```swift
    struct MyView: View {
        var body: some View {
            Text("Hello")
        }
    }
    ```

## View Composition

- **Key Concepts**
    - View Composition: Break complex views into components (`CardView`, `cardCountAdjusters`)
    - Dynamic Layouts: `LazyVGrid` with adaptive columns for responsive grids
    - Reactive UI: Auto-updates on state change
- **Computed Views**: Organize UI sectors:
    ```swift
    var cards: some View { ... }
    var cardCountAdjusters: some View { ... }
    ```
- **Efficient Iteration**: Use `ForEach` with indices
    ```swift
    ForEach(0..<cardCount, id: \.self) { index in
        CardView(content: emojis[index])
    }
    ```
    - Prefer `indices` over `enumerated()` for true indices
- **View Builders** TODO
    > In this code you will never type tuple view. That's something that the ViewBuilder mechanism does behind the scenes for you.
    - Parameterized View Builders: Create flexible UI components:
        ```swift
        func cardCountAdjuster(by offset: Int, symbol: String) -> some View
        ```
- **Container Views**
    - `HStack`: Horizontal layout
    - `VStack`: Vertical layout
    - `ZStack`: Layered views
- **Reusable Components** (View Extraction)
    ```swift
    struct CardView: View {
        let content: String
        @State private var isFaceUp = false
    }
    ```
- **Modifiers**
    - Chainable: `.padding().background(.blue)`
    - Conditional Styling:
        ```swift
        .opacity(isFaceUp ? 1 : 0) // State-dependent styling
        .disabled(cardCount + offset < 1) // Conditional enablement
        ```

## State Management

- `@State`
    - View-specific mutable data (`cardCount`, `isFaceUp`)
    - Triggers UI updates on change
 - `@ObservedObject`
    - External reference types
    - Never assign directly: `@ObservableObject var vm: ViewModel`

## Best Practices
- **Code Hygiene**: Max 20 lines/view (aim for 12) → Extract subviews

# MVVM Architecture
- **MVVM design paradigm** (Model-View-ViewModel)
    - Model
        - Swift rebuilds the UI when a Model change affect it (Data + Logic)
        - UI Independent ("The Truth")
        - Pure Swift (no UI concepts)
    - View (SwiftUI)
        - Declarative UI components
        - Stateless presentation layer
        - Reflects ViewModel state
        - Reactive (auto-updates on state changes)
    - View Model
        - Mediates between View and Model
        - Gatekeeper for Model access
        - Processes user intents (e.g., button taps)
        - Formats Model data for View consumption
        - **Implementation Approaches**:
            1. `@State` in a View (minimal separation - best for simple view-specific state)
            2. The Model accessible only via gatekeeper "View Model" class (full separation — ✅ Always Use)  
            3. Hybrid (View Model class): partial separation (⚠️ becomes messy at scale)
- [x] Apply MVVM to Memorize (partially)

# Programming Assignment 1
- [x] 1: Type in all the code from lectures to get the Memorize game working.
- [x] 2 (optional): rm `-` and `+` buttons. Skipped.
- [x] 3: Add a title “Memorize!” to the top of the screen.
- [x] 4: Add 3+ buttons to change emojis theme. // the hardest among others.
- [x] 5: The face up or face down state of the cards does not need to change when the user changes the theme.
- [x] 6: The number of pairs of cards in each of your 3 themes should be different, but in no case fewer than 4 pairs.
- [x] 7: the cards should be shuffled each time a theme button is chosen.
- [x] 8: The theme-choosing buttons must include an image representing the theme and text describing the theme stacked on top of each other vertically.  
- [x] 9: The image portion of each of these theme-choosing buttons must be created using an SF Symbol which evokes the idea of the theme it chooses.
- [x] 10: The text description of the theme-choosing buttons must use a noticeably smaller font than the font we chose for the emoji on the cards.
- [x] 11: Change the code so that cards appear face down by default rather than face up.
- [x] 12: Your UI should work in portrait or landscape on any iPhone and look good in light mode and dark mode.
- [x] EXTRA 1: Associate a Color with each theme.
