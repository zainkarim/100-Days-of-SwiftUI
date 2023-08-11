import Cocoa

// ============== 1. Creating and using closures ====================

// Closures allow us to assign functions to variables, pass functions into functions, and even return functions from functions.

func greetUser() {
    print("Hi there!")
}

greetUser()

// In the following code, we're taking a copy of the greetUser function, putting it into the greetCopy variable, and then calling greetCopy().

var greetCopy = greetUser // When copying a function, we DO NOT write parentheses after a function. Putting the parentheses tells Swift to run the function first.
greetCopy()

// What if you wanted to skip creating a second function, and just assign some functionality directly to a constant or variable?

let sayHello = {
    print("Hi there!")
}

sayHello()

// Swift calls what we just did a closure expression. This is a chunk of code we can pass around and call like a function. This is effectively the same as a function that takes no parameters and returns nothing.

// If you want a closure to accept parameters, it needs to be written in a special way. Remember, the closure starts at the open brace ({) and ends at the closed brace (}). We can't put code outside of the braces.

let sayHelloV2 = { (name: String) -> String in // The 'in' keyword marks the end of the parameters/return type and the start of the body of the closure.
    "Hi \(name)!"
}

// Why would I use this?
// Closures are used everywhere in SwiftUI! They are certainly an integral part of iOS development.

// To get an idea of why closures are useful, let's backtrack a little and look at function types. Like primitive data types, functions also have types. Let's take a look at the greetUser() function we wrote earlier.

func greetUserV2() {
    print("Hi there!")
}

// This function accepts no parameters, returns no values, and throws no errors. Therefore it has the Void type.
var greetCopyV2: () -> Void = greetUserV2 // Empty parentheses signify that the function accepts no parameters.

// Every function's type depends on the data it receives, the parameters it has coming in, and that values it sends back. It is important to note that the names of the data the function receives do not matter when determining the type of the function. Only the data types matter.

// This function accepts one integer parameter (called 'for' externally and 'id' internally and returns a String. This is its type.
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

// This is how it would look as a type annotation when creating a copy of the function into a constant:
let data: (Int) -> String = getUserData
let user = data(1989)
print(user)
// Notice that the 'for' external keyword is not needed. When the copy is called, the name is lost. Instead of writing data(for: 1989) we just say data(1989).

// This applies to ALL closures behind the scenes:
let sayHelloV3 = { (name: String) -> String in
    "Hi \(name)!"
}

sayHelloV3("Taylor")

// Let's recall the sorted() function:
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

// the sorted() function can actually give us control over how the array is sorted by passing in a custom sorting function. This function takes in two parameters and returns 'true' if the sirst parameter comes before the second parameter.

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}

//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)

// We've covered two seemingly different things.
// 1. We can create closures as anonymous functions and stash them away in constants and variables.
// 2. We can pass functions into other functions.
// The power of closures is that we can put these two things together.

// We can call sorted() again, but we can start an inline closure right inside of it.

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
})

print(captainFirstTeam)

/* This is a lot of complicated syntax here. Let's break it down:
 1. We are still calling the sorted() function on team, but instead of passing in a standalone predefined function, we are passing in a closure (the contents between the two curly braces).
 2. Inside the closure (name1: String, name2: String) -> Bool in is where we list the data going in and coming out
 3. Everything after 'in' is just a normal function! */
