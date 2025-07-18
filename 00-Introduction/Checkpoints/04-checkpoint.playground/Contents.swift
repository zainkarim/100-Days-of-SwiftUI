import Cocoa

/* Write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number.
You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
 If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
 You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
 If you can’t find the square root, throw a “no root” error. */

enum SquareRootError: Error {
    case outOfBounds
    case noRoot
}

func squareRoot(_ num: Int) throws -> Int {
    if num < 1 || num > 10_000{
        throw SquareRootError.outOfBounds
    }
    for i in 1...100 { // Highest number we can check is 10_000 (sqrt = 100)
        if i * i == num {
            return i
        }
    }
    throw SquareRootError.noRoot
}

let num = 999

do {
    let result = try squareRoot(num)
    print("The square root of \(num) is \(result).")
} catch SquareRootError.outOfBounds {
    print("\(num) is out of bounds. Choose a different number.")
} catch SquareRootError.noRoot {
    print("\(num) does not have an integer square root. Choose a different number.")
}
