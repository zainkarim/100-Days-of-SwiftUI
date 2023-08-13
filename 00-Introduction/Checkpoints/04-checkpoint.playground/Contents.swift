import Cocoa

/* Write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number.
You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
 If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
 You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
 If you can’t find the square root, throw a “no root” error. */

enum squareRootError: Error {
    case outOfBounds, noRoot
}

func squareRoot(of number: Int) throws -> Int {
    var root = 0
    if number <= 0 || number > 10_000 {
        throw squareRootError.outOfBounds
    }
    for i in 1...100 {
        if i * i == number {
            root = i
        }
    }
    if root == 0 {
        throw squareRootError.noRoot
    }
    return root
}

let number = 9

do {
    let root = try squareRoot(of: number)
    print("The square root of \(number) is \(root).")
} catch squareRootError.outOfBounds {
    print("Error: the number you entered is out of bounds. Please enter a number between 1 and 10,000.")
} catch squareRootError.noRoot {
    print("Error: The number you entered does not have an integer square root.")
} catch {
    print("Something went wrong: \(error.localizedDescription)")
}
