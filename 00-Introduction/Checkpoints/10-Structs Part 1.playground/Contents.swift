import Cocoa

// 1. ================== Creating our own structs ==================

// Swift structs let us create our own custom complex data types complete with their own variables and data types.

// Structs begin with capital letters, just like all other data types
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let astroworld = Album(title: "Astroworld", artist: "Travis Scott", year: 2018)

print(red.title)
print(astroworld.artist)

red.printSummary()
astroworld.printSummary()

// Things get more interesting when we want to have values inside our structs that can change

struct Employee {
    // The variables and constants inside of a struct are called "properties"
    let name: String
    var vacationRemaining = 14 // Let's make 14 the default value
    
    // Swift makes us declare any function that wants to write or change data must be marked as mutating.
    // Functions inside structs are called "methods"
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days // If we forget to make the function a mutating function, then we will encounter an error! Without adding the 'mutating' keyword, the takeVacation() function CANNOT change the vacationRemaining variable. This is because we made it a constant. Swift makes the Employee and all of the data inside of it constant as well. A structs instants and properties are constants.
            
            print("I'm going on vacation!")
            print("\(vacationRemaining) vacation days remaining.")
        } else {
            print("Sorry, you don't have enough vacation days.")
        }
    }
}

// If we decide to make this variable a constant using the 'let' keyword, we will encounter a problem. We cannot call takeVacation (a mutating function) on a constant.
// Constants and variables created from structs are called "Instances". The code after the = sign is called the "initializer"
var archer = Employee(name: "Sterling Archer")
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

let kane = Employee(name: "Lana Kane")
let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)

// 2. ============= Dynamically computing property values ==============

/* Structs have two kinds of property:
 1. A stored property, where you place a value into the struct directly.
 2. A computed property, where the property's value is recalculated every time it's accessed. These computed properties are basically a blend of stored properties and methods in that they are accessed like stored properties but work like functions. */

// Let's adjust the Employee struct to use a computed property:
struct EmployeeV2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    // Computed property:
    var vacationRemaining: Int { // Computed properties must always have explicit types.
        // We still need to be able to write to vacationRemaining. To do so we need some getters and setters. In our case, we already have our  getter in out computed property.
        
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue // newValue is automatically provided to us inside of the setter by Swift.
        }
    }
}

var bucky = EmployeeV2(name: "Bucky", vacationAllocated: 14)
bucky.vacationTaken += 4
print(bucky.vacationRemaining)
bucky.vacationTaken += 4
print(bucky.vacationRemaining)

// Now that we've added our getter and setters, we can modify vacationRemaining.
bucky.vacationRemaining = 20
print(bucky.vacationRemaining)
print(bucky.vacationAllocated)

// 3. ============= Creating property observers =====================

/* Swift lets us create property observers which are pieces of code that run whenever a property's value changes. These come in two forms:
    1. the didSet observer which runs code after the property has changed.
    2. willSet which runs when the property is about to change */

struct Game {
    var score = 0
}

var game = Game()
game.score += 10
print("Score is now \(game.score)")
game.score -= 3
print("Score is now \(game.score)")
game.score += 1

// The above code compiles and runs, but there's an error. We added 1 to the score at the very end, but we didn't write a print statement to print that score to the terminal. We can just add the print statement after, but it would be better to use property observers to just print the score whenever it changes by attaching the print call directly to a didSet observer on the score. Let's rewrite this code:

struct Game2 {
    var score = 0 {
        didSet {
            print("Score is now\(score)")
            // Swift provides a special constant inside didSet called 'oldValue' to read what the previous score was. Swift also provides 'newValue' in willSet.
        }
    }
    
}

var game2 = Game2()
game.score += 10
game.score -= 3
game.score += 1

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is \(contacts).")
            print("New value will be: \(newValue).")
        }
        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was: \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E") // Appending to the array triggers the didSet
app.contacts.append("Allen W")
app.contacts.append("Ish S")

// In practice, willSet is used less frequently than didSet, though we'll still see it.
// Try to remember to not puch TOO much work in property observers.

// 4. ============= Creating custom initializers =====================

// Initializers are special functions inside structs designed to create initial values for all of the properties inside of the struct.
// We can create our own custom initializers as long as we follow exactly one rule: You must ensure that every property inside your struct has initial value by the time the initializer finishes.

struct Player {
    let name: String
    let number: Int
}
                // Default initializer. These values appear in the order they were defined in the struct. Swift calls this the "memberWise" initializer
let player = Player(name: "Megan R", number: 15)

// We can write our own initializer which can do the exact same thing. The only catch is that we must be able to distinguisgh between the names of parameters coming in and the name of properties inside our struct.

struct Player2 {
    let name: String
    let number: Int
    
    // 1. Note that there is no func keyword, it is not a function.
    init(name:String, number: Int) { // 2. Even though we're creating a new player instance, init doesn't return anything. There is no explicit return type here.
        // 3. We're using 'self' to assign values, meaning we assign the name parameter to self's name property. Without self, we'd have name = name, which can be confusing.
        self.name = name
        self.number = number
    }
}

// This works the same as our previous code, but we can now customize it! Let's make it so that when a new player is created, we only want to know their name. Also, instead of assigning the property number, let's make it so that the program chooses a random number between 1 and 99 for the player.

struct Player3 {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    } // Remember the golden rule! By the time the initializer finishes, all properties must have a value! If we hadn't provided either property here, our code would not build
}

let player3 = Player3(name: "Megan R.")
print(player3.number)

// Although you can call other methods inside your initializer, you can only do so once you have sattisfied the golden rule.
// You can also assign multiple initializers assigned to your struct as long as they follow the golden rule.
// As soon as you have your own custom initializer, you will lose access to Swift's automatically generated memberwise initializer unless you take custom steps to retain it. This is done on purpose. 
