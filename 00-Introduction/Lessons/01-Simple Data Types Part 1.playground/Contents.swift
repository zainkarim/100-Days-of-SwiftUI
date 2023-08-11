import Cocoa

var greeting = "Hello, playground"
// var == create a new variable

let character = "Roman"
/*  let == create a constant
    constants cannot be changed */

var playerName = "Roy"
print(playerName)

playerName = "Danny"
print(playerName)

let managerName = "Michael Scott"
print(managerName)

let dogBreed = "Boston Terrier"
print(dogBreed)

let meaningOfLife = "How many roads must a man walk down?"
print(meaningOfLife)
/*  prefer using constants over variables whenever you can. this will stop you from accidentally changing data stored in a variable */

// Creating strings:
let actor = "Ryan Gosling"
let quote = "Then he tapped a sign saying \"Believe\" and walked away."
let haiku = """
            five
            seven
            five
            """

print(actor)
print(quote)
print(haiku)

// ---------- Three String Tools ---------- //

// 1. count returns the number of characters in a string
let nameLength = actor.count
print(nameLength)

// 2. uppercased returns all lowercase characters as uppercase
print(actor.uppercased())
    // uppercased is a function, so the open and closed parentheses are necessary
// 3. hasPrefix and hasSuffix
// hasPrefix lets us know if a string begins with some letters or characters of our choosing.
print(meaningOfLife.hasPrefix("A man")) // false
// Conversely, hasSuffix lets is know if a string ends with some letters or characters of our choosing
print(meaningOfLife.hasSuffix("down?")) // true

// ----------- How to Store Whole Numbers ------------- //
let grade = 100
let highScore = 1_000_000
// integers can be created with arithmetic operators
let failingGrade = grade - 31

// ------------ Integer Functions ---------- //
// 1. isMultipleOf allows us to see if one integer is a multiple of another integer
print(grade.isMultiple(of: 20)) // true

// ----------- How to Store Decimal Numbers ------------- //
let double1 = 3.1
let int1 = 3
let sum = Double(int1) + double1

