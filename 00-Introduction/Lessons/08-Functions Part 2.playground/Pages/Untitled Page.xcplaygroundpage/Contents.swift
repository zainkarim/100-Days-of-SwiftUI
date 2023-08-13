import Cocoa

// Adding parameters to functions allows us to add customization points.
// Let's take a look at the following code
func printTimesTables(for number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) = \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)

// What if we wanted to make it so that every time we call this function, the times table would end at 12 without us having to specify it?

func printTimesTableV2(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) = \(i * number)")
    }
}

printTimesTableV2(for: 5)

// We can still specify the end parameter if we want to!
printTimesTableV2(for: 5, end: 10)

// Handling errors in functions

// This takes 3 steps:
// 1. Define all of the errors that might happen in the code we're writing
// 2. Write a function that acts as normal, but throws one or more of those errors if a serious problem is found.
/* 3. Try and run the function and handle any errors that come back.
    a. Start a block of code that might throw errors by saying do {
    b. Then call one or more throwing functions by saying 'try'
    c. Have a catch block to handle any errors that come back.

    do {
        try someRiskyWork()
    } catch {
        print("Handle errors here)
    }
 
 */
    
// If a user asks us to check the strength of their password and it's too short or simple, we will flag an error.

// Step 1:
enum PasswordError: Error {
    case short, obvious
}

// Step 2:
// If a function is able to throw errors, it must be marked with 'throws' before the return type
func checkPassword(_ password: String) throws -> String {
    // Throwing an error immediately exits the function
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

// Step 3:
let string = "12345"

do {
    let result = try checkPassword(string) // 'try' must be written before all throwing functions as a signal that regular code execution might stop here.
    print("Password rating: \(result)")
} catch PasswordError.short {  // We can also create custom messages for particular types of errors.
    print("Invalid password: Please use a password longer than 5 characters.")
} catch PasswordError.obvious {
    print("Invalid password: I have the same combination on my luggage!")
} catch { // Catch all. Apple provides us with meaningful errors and allows us to use the 'error' constant to print it.
    print("There was an error: \(error.localizedDescription)")
}
