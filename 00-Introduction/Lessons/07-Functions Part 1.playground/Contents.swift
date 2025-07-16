import Cocoa

// =============== 1. Reusing code with functions =====================

// When you've written some code you plan on using again and again, consider putting it in a function.

// Say we want to easily use these print lines multiple times without typing it all again.
print("Welcome to my app!")
print("By default this prints out a conversion")
print("chart from centimeters to inches, but you")
print("can also set a custom range if you want.")

// Function declaration
func showWelcome() {
    print("Welcome to my app!")
    print("By default this prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

// Function call
showWelcome()

// Some examples of functions we've already used include isMultipleOf() and random().

// Times Table Function
func printTimesTables(number: Int, end : Int) { // Parameters are placeholders for arguments when declaring a function
    for i in 1...end {
        print("\(i) x \(number) = \(i * number)")
    }
}

printTimesTables(number: 5, end: 20) // 5 and 20 are ARGUMENTS being passed into the function

// Any data you make inside of a function will be destroyed when the function is finished executing.

// =============== 2. Returning values from functions ==================

// Functions often pass data back. Swift has many of these functions built in, and there are tens of thousands more built into Cocoa

// sqrt
let root = sqrt(169)
print(root)

// If you want to return your own value from a function, you must do 2 things:
// 1. Insert an arrow (->) before your function's opening brace, telling it the type of data you want to send back.
// 2. Use the 'return' keyword inside the function body

// Dice rolling
func rollDice() -> Int { // We want to return an Int
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

// Write a function to check if two strings contain the same letters, regardless of their order. This function should:
// 1. Accept two string parameters
// 2. Return true if their letters are the same
// Tip: Call sorted() on a string t oget its letters in alphabetical order.
func compareStrings(string1: String, string2: String) -> Bool {
    if string1.sorted() == string2.sorted() {
        return true
    } else {
        return false
    }
}

print(compareStrings(string1: "amazon", string2: "amazing"))

// This is good, but let's make it better.
func compareStringsImproved(string1: String, string2: String) -> Bool {
    // Instead of using an if/else statement, we can just compare the two strings directly using an equality operator. This achieves the same thing but in just one line of code.
    // If there is only one line of code in a function, then the 'return' keyword isn't even needed!
    string1.sorted() == string2.sorted()
}

print(compareStringsImproved(string1: "apple", string2: "abble"))

// Pythagorean Theorem
func pythag(a: Double, b: Double) -> Double {
    let input = (a * a) + (b * b)
    let c = sqrt(input)
    return c
}

print(pythag(a: 3, b: 4))

// This can also be boiled down to one line of code:
func pythagorean(_ a: Double, _ b: Double) -> Double {
    sqrt((a * a) + (b * b))
}

print(pythagorean(3, 4))

// If your function does not return a value, you can still use return by itself to force the function to exit immediately.

func sayHello() {
    return
}

// =========== 3. Returning multiple values from functions ============

// If you wanted to return two or more values from a function, you could use tuples. Like arrays, dictionaries, and sets, tuples allow us to put multiple values into a single variable or constant. However, unlike those other options, tuples have a fixed size and can have a variety of data types with ease.

//                 This is the return type (tuple)
func getUser() -> (firstName: String, lastName: String) {
    // Inside the function, we send back a firstName string and  a lastName string
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
// Read the tuples values by using the keynames (firstName and lastName).
print("Name: \(user.firstName) \(user.lastName)")

/* Tuples differ from dictionaries in the following ways:
 1. Swift cannot know if a dictionaries key is present.
 2. When you read tuple values in comparison, Swift knows it'll be available.
 3. We then read values using user.firstName, NOT a string. These are values, so it eliminates the possibility of typos.
 4. A dictionary may contain hundreds of other values. */

// Perks of using tuples:
// 1. If you are returning a tuple from a function, Swift already knows names of the values in the tuple.

func getUser2() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift") // Remember that 'return' is implied because this is only one line of code.
}

let user2 = getUser2()
print("Name: \(user.firstName) \(user.lastName)")

// 2. Sometimes you'll be given tuples where the elements do not have names. When this happens, you can actually read them using numerical indeces like an array starting from 0.

func getUser3() -> (String, String) {
    ("Taylor", "Swift")
}

let user3 = getUser3()
print("Name: \(user.0) \(user.1)")

// 3. If a function returns a tuple, you can pull the tuple out into individual values.

func getUser4() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

// This is called 'destructuring'. We're pulling the function's returned tuple out into two individual constants.
let (firstName, lastName) = getUser4()
print("Name: \(firstName) \(lastName)")

/* If you don't need one or more of the constants, you can actually go a step further by using '_'

 let (firstName, _) = getUser4()
 print("Name: \(firstName)") */

func quadraticEquation(_ a: Double, _ b: Double, _ c: Double) -> (x1: Double, x2: Double) {
    
    let x1 = ((-b) + sqrt((b*b) - (4 * a * c))) / (2 * a)
    let x2 = ((-b) - sqrt((b*b) - (4 * a * c))) / (2 * a)
    
    return (x1, x2)
}

print(quadraticEquation(1, 1, -20))

// ================ 4. Customizing parameter labels =================

// Consider the hasPrefix() function
let lyric = "Let's get out of this town"
print(lyric.hasPrefix("Let's")) // true

func isUpperCase(string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let verdict = isUpperCase(string: string) // This doesn't read very easily.

// Instead we can do the following:
func isUpperCase(_ string: String) -> Bool { // Now the external parameter name is removed because we added '_ '
    string == string.uppercased()
}

let string1 = "HELLO, WORLD"
let verdict1 = isUpperCase(string) // This is much easier to read!

// This method is used quite a bit in Swift development.

func printTimesTable(_ number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) = \(i * number)")
    }
}

printTimesTable(5)

// Instead of removing the external parameter name, what if we made it so that we use one name internally and a different name externally?

func printTimesTable1(for number: Int) { // 'for' is the name we're choosing for the external parameter name
    for i in 1...12 {
        print("\(i) x \(number) = \(i * number)")
    }
}

printTimesTable1(for: 5)
