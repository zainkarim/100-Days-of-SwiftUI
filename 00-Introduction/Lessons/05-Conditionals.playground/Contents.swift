import Cocoa

// =========== 1. if statements ==============

// Example with score.
let score = 95
var goodGrade: Bool
if score > 80 {
    print("Great job!")
    goodGrade = true
}

// Speed score and age
let speed = 88
let percentage = 80
var age = 18

if speed >= 88 {
    print("Where we're going, we don't need roads.")
}

if percentage > 70 {
    print("You passed the test!")
}

if age >= 21 {
    print("Have a drink.")
}

// If/else statements and comparative operators also work with strings. The following code compares two strings and sees which one comes first in the alphabet

let ourName = "Kobe"
let friendName = "LeBron"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)!")
} else {
    print("It's \(friendName) vs \(ourName)!")
}

// Challenge: If adding an item to an array results in the array containing more thab three items, then remove the oldest one so that the array only contains the three newest items.

var array = [1, 2, 3]
print(array)
array.append(4)

if array.count > 3 {
    array.remove(at: 0)
}

print(array)

// Challenge: If the user is asked to enter a name and they type nothing at all, then assign them the name "Anonymous". Use the == and != equality operators. Then try the isEmpty function

var username = "zainkarim"

if username.isEmpty{
    username = "Anonymous"
}

print("Welcome, \(username)!")

// Checking multiple conditions
age = 16

if age >= 18 {
    print("You can vote in the next election.")
} else {
    print("You're too young to vote.")
}

// Checking more than 2 conditions

enum transportOption {
    case airplane, helicopter, bike, car, scooter
}

var transport = transportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bike {
    print("Ding ding!")
} else if transport == .car {
    print("Let's ride!")
} else {
    print("Get out of the way!")
}

// Using switch statements to test multiple conditions

enum Weather {
    case sun, rain, wind, snow, unknown
}
let forecast = Weather.sun

switch forecast {
case .sun:
    print("Sunny")
case .rain:
    print("Rainy")
case .wind:
    print("Windy")
case .snow:
    print("Snowy")
case .unknown:
    print("Error")
}

let place = "New York City"

switch place {
case "Gotham":
    print("Batman")
case "Wakanda":
    print("Black Panther")
case "Metropolis":
    print("Superman")
case "New York City":
    print("Spider-Man")
default:
    print("Who are you?")
}

// 12 Days of Christmas
let day = 5
print("My true love gave to me...")

switch day {
case 5:
    print("Five golden rings!")
    fallthrough
case 4:
    print("Four calling birds,")
    fallthrough
case 3:
    print("Three french hens,")
    fallthrough
case 2:
    print("Two turtle doves,")
    fallthrough
default:
    print("And a partridge in a pear treeeee.")
}

// Using the ternary conditional operator for quick tests. * Important in SwiftUI!

age = 18
let canVote = age >= 18 ? "Yes" : "No" // Think of this as an if/else statement

// Pnemonic device: WTF! What are we checking, what to do if True, what to do if False

// Clock
let hour = 23
print(hour < 12 ? "It's before noon." : "It's after noon.")

// Roll call
let names = ["Jane", "Kayley", "Mal"]
let crewCount = names.isEmpty ? "No one." : "\(names.count) people on board."
print(crewCount)

// Dark mode
enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "Dark" : "Light"
print(background)

// With SwiftUI, we will be faced with issues when we MUST use the ternary conditional operator.
