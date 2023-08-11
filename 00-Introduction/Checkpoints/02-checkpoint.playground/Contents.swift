import Cocoa

// Checkpoint 2
// Create an array of strings, then write some code that prints the number of items in the array and also the number of unique items in the array.

let strings = ["a", "b", "c", "d", "e", "e"]
print("There are", strings.count, "items in the array.")

let setStrings = Set(strings) // placing the strings array into a set.
print("There are", setStrings.count, "unique items in the array.")
