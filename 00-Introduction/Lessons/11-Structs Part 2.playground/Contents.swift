import Cocoa

// 1. ===== Limiting access to internal data using access control =====

struct BankAccount {
    var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount:100)

let success = account.withdraw(amount:200)

if success {
    print("Withdrew money successfully")
} else {
    print("Insufficient funds")
}

// In our struct, the funds property is exposed to us externally. There's nothing stopping us from touching it directly:
account.funds -= 1000 // Here we're withdrawing much more money than we have initially deposited. It completely bypasses the logic we had that verifies that the user has the funds before withdrawing anything.

// To solve this, we can tell Swift that the funds property should only be available to be read and written to only inside the struct by methods that belong to it (deposit and withdraw).

struct BankAccountV2 {
    private(set) var funds = 0 // Now funds cannot be read from outside of the struct. This is called access control.
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

/* Swift gives us several options when it comes to access control:
 1. private: Don't let anything outside the struct use this.
 2. filePrivate: Don't let anything outside of the current file use this.
 3. public: Anyone anywhere can use this
 4. private(set): Anyone can read the property, but it can only be written/modified by internal methods. */
// Access control is about limiting what you and other devs can do.
// Important tip ⭐️ : if you have a private acceZss control property in your struct, there's a good chance you have to create your own initializer.

// 2. =============== Static properties and methods ====================

/* Sometimes, you want to add a property or method to a struct itself, not to a single instance of it. This lets you access it directly. This is used in SwiftUI for 2 reasons.
 1. Example data
 2. Constant data that needs to be accessed in various places in your program. */

struct School {
    static var studentCount = 0
    // Notice the static keyword here: this means both studentCount and the add method belong to the School struct itself, not to an individual instance of a School.
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

// The property and method can be accessed directly on the struct. This is because they're both static. They don't exist uniquely in every school instance, but exist only once across all school instances. They're all shared! This is why we can say studentCount += 1 without marking the add method as mutating.
// ⭐️ Remember: we only have to have 'mutating' as a keyword when the struct might be a constant or a variable. In this instance, it's always a struct itself.
School.add(student: "James Bond")
print(School.studentCount)

/* If you want to mix and match static and non-static properties and methods, there are two rules:
 1. If you want to access non-static stuff from static stuff, YOU CANNOT!
 2. If you're in a non-static method/property, you can read the static versions. ----> School.studentCount
                        or
                     Self.studentCount
                    ⭐️ Remember:
                        - lowercase s self means the current value of a struct.
                        - Capital S struct means the current type of struct.
 Why is this needed? */
// 1. We can use static properties to organize common data in a project:
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}
// Using this approach, every time we need to ccheck some information about the app's version number (about screen, debug output, logging info, etc) we can just read AppData.version anywhere in the program.

// 2. We can use static data to store example data for structs. SwiftUI works best when you can see previews of your data as you work. These previews often rely on example data.
struct Employee {
    let username: String
    let password: String
    
    // You can't use a regular let because that would result in Emplyee containing an employee containing an employee containg ...
    static let example = Employee(username: "CraigF", password: "hairforceone")
}

Employee.example
