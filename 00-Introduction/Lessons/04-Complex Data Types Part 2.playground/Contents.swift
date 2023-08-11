import Cocoa

// Using type annotations

// We've been letting Swift infer the type of the variable we're creating. Let's be more explicit:

let surname: String = "karim"
var score: Double = 100.0
let playerName: String = "Ike"
let pi: Double = 3.141529

// Array
var albums: [String] = ["Continuum", "In Repair"]

// Dictionary
var user: [String: String] = ["id": "@zainkarim_"]

// Set
var books: Set<String> = Set([
    "Metamorphosis",
    "The Stranger",
    "The Godfather"
])

// Making an empty array
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

// enums
enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light
style = .dark

// When should you use type annotations?
// Creating constants that don't have any value yet.
let username: String // this variable will contain a string at some point.
username = "zainkarim_"
print(username)

// GOLDEN RULE: Swift must always know which data types your constants and variables contain.
