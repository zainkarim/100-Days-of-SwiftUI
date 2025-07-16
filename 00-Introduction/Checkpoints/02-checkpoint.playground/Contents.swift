import Cocoa

// Create an array or strings, print number of items, and number of UNIQUE items.

let greetings = (["hello", "goodbye", "hi", "hello", "salutations", "pleased to meet you"])
let num_items = greetings.count
let num_unique_items = Set(greetings).count

print("There are \(num_items) items in the greetings array.")
print("There are \(num_unique_items) unique items in the greetings array.")

