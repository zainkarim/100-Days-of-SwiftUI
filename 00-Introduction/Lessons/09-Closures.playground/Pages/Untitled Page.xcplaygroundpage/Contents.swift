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

// ============ 2. Trailing closures and shorthand syntax =============

/* Let's take a look at the previous problem:
 let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
 let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
     if name1 == "Suzanne" {
         return true
     } else if name2 == "Suzanne" {
         return false
     }
     return name1 < name2
 })

 print(captainFirstTeam)
 
 Remember, to pass a function into the sorted() function, we must take in 2 of the same data type (Strings in this case) and return a bool. So why do we have to specify in our function that we're taking in two Strings and returning a bool if the sorted() function will only accept it this way anyways? Turns out, we don't!
 
 Instead we can write the following: */

let captainFirstTeamV2 = team.sorted(by: { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
})

print(captainFirstTeamV2)

// This has already reduced the clutter in our code, but we can go one step further: when one function (in this case sorted()) accepts another function as a parameter, Swift gives us a special syntax type called trailing closure syntax. This means the chunk of code including 'by: ...' and the closing parentheses can be left out.

// Rather than passing in the sorting function as a parameter, we just go ahead and start the closure directly.

let captainFirstTeamV3 = team.sorted { name1, name2 in // The 'in' keyword divides the body of the closure from the parameters in the return type.
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}

print(captainFirstTeamV3)

// Swift can automatically provide parameter names using shorthand syntax. We no longer have to define name1 and name2 or include the 'in' keyword. This syntax is less cluttered, however it may be a bit more confusing in this particular case as $0 and $1 aren't the most descriptive names.

let captainFirstTeamV4 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    return $0 < $1
}

print(captainFirstTeamV4)

// This method may work better in a situation like a reverse sort, where we make the sorted() function reverse the array like so:

let reverseTeam = team.sorted {
    return $0 > $1 // "Put left before right instead of left after right"
}

print(reverseTeam)

// Now that we're down to a single line of code in the body of the closure, we can actually remove the 'return' keyword and make everything just one line of code!

let reverseTeamV2 = team.sorted { $0 > $1 }
print(reverseTeamV2)

// There are no fixed rules on whether or not to use shorthand syntax. It's recommended to use it in most cases except for the following three situations:
// 1. If the closure's body is long. Just declare the variable names.
// 2. If the automatic variable names ($0, $1, etc.) are used more than once. It can get confusing.
// 3. If you end up with 3 or more parameters, it becomes too complex to keep track of. It's much easier to just name them yourself.

// Let's use the filter() function to find all of the team players whose names begin with "T"
let tOnly = team.filter { $0.hasPrefix("T")}
print(tOnly)

// The map() function lets us transform every item in the array in a manner of our choosing. Note that when working with map(), you don't have to return the same type that you received. For example, you can return a list of integers from a list of strings.

let uppercasedTeam = team.map { $0.uppercased() }
print(uppercasedTeam)

// ============ 3. Accepting functions as parameters =============

// Wrting a function that generates an array of integers by calling another function repeatedly.

// This function takes in two parameters: size (int) and a generator() function. The generator function accepts no parameters and returns an integer
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]() // create an empty integer array.
    for _ in 0..<size {
        let newNumber =  generator() // call generator() function, put integer in array
        numbers.append(newNumber)
    }
    return numbers
}

// New closure implementing makeArray function.
let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)

// New generate number function
func generateNumber() -> Int {
    Int.random(in: 1...20)
}

// Revised newRolls closure implements makeArray() and generateNumber()
let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

// Making a function that accepts three function parameters.
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

// Calling the function
doImportantWork { // first trailing closure
    print("This is the first work")
} second: { // second trailing closure
    print("This is the second work")
} third: { // third trailing closure
    print("This is the third work")
}
