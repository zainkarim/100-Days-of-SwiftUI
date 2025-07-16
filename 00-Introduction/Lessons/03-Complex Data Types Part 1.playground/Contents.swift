import Cocoa

// ==================== 1. Storing ordered data in arrays =============================

var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [1, 2, 3, 4]

// Appending data to an array.
beatles.append("Tom")

// Creating an empty array which holds integers
var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

// Creating an empty array which holds strings
var albums = Array<String>()
albums.append("IN RAINBOWS")
albums.append("OK COMPUTER")
print(albums.count)

// Removing items from an array
var characters = ["Randy", "Steve", "Eric"]
print(characters.count)
// Removing an element at a specifix index
characters.remove(at: 0)
print(characters.count)
// Removing all elements from an array
characters.removeAll()
print(characters.count)

// Checking whether or not an array contains a certain element
let pixarFilms = ["Finding Nemo", "A Bug's Life", "Monsters, Inc.", "Wall-E", "Up", "Toy Story"]
print(pixarFilms.contains("The Lion King"))

// Sort an array
let cities = ["London", "Tokyo", "New York City", "Budapest"]
print(cities.sorted())

// Reverse an array
let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

// =================== 2. Storing and finding data in dictionaries =====================

let employee = [
    "name": "Mark",
    "job": "Developer",
    "location": "San Fransisco"
]

print(employee["name", default: "Unknown"])
print(employee["job", default: "Unknown"])
print(employee["location", default: "Unknown"])

let hasGraduated = [
    "Eric": false,
    "Otis": false,
    "Maeve": true
]

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo",
    2024: "Paris"
]

print(olympics[2012, default: "Unknown"])

// Creating an empty dictionary with explicit types
var heights = [String: Int]() // Define key and value types [Key: Value]
heights["Yao Ming"] = 229
heights["Shaq"] = 216
heights["LeBron"] == 206

var enemies = [String: String]()
enemies["Batman"] = "Joker"
enemies["Batman"] = "Penguin"
print(enemies["Batman", default: "Uknown"])

// =================== 3. using sets for fast data lookup =====================

let actors = Set([
    "Denzel Washington",
    "Tom Cruise",
    "Nicolas Cage",
    "Samuel L. Jackson"
]) // Notice that this is an array inside of a set.
// The set will automatically remove any duplicate values and it will not remember the exact order that was used in the array.
print(actors)

// Inserting items into a set. ** Items cannot be appended to a set because there's no order in a set
var cars = Set<String>()
cars.insert("Porsche 911")
cars.insert("Lexus LX470")
cars.insert("Honda Accord")
print(cars)

// Sets store their data in a highly optimized manner which makes it much easier to access stored data because it doesn't require Swift to iterate through the data one by one.
// Arrays are more common, however a set may be ideal in some instances.
// You can also use count and sort on a set. Note that when sorting a set, you will get a sorted array in the set.

// =================== 4. Creating and using enumerations (enums) =====================

// Let's write some code that allows a user to select a day of the week:
// By using enums, we can define the range of values that can be used in the program.

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

// enums can also be written as followed:
enum Weekend {
    case saturday, sunday
}

var day = Weekday.monday
day = Weekday.tuesday
// day = Weekday.saturday <== Error! saturday is not predefined in the Weekday enum!
day = .friday // <== The name of the enum can be skipped after the first assignment to the variable. Swift knows that day was made to be a Weekday enum.
