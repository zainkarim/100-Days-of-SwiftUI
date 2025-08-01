import Cocoa

// 1. ================== Creating our own classes ======================

// Besides structs, there's a second way to create custom types of data called classes. Classes and structs have many similarities but differ from structs in five key ways.

/* Similarities:
 * You get to create and name them.
 * Add properties, methods, property observers, and access control.
 * Create custom initializers to configure new instances. */

/* Differences:
 1. You can make one class build upon functionality in another class (called inheritance).
 2. Swift will not make a memberwise initializer.
 3. If you copy an instance of a class, both copies will point to the same piece of data.
 4. We can add a deinitializer to run when the final copy is destroyed.
 5. Constant class instances can have their variable properties changed. */

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

// The only difference between the above class and a struct is the word 'class,' but we'll be going into more detail on the real differences between the two.

// 2. ============= Making one class inherit from another ==============

// Swift lets us create classes by letting us base them on existing classes. This is called inheritance. This new class gets all of the methods and properties from the old class (parent/superclass). The new class (child/subclass) can make changes to functionality to change the way it behaves.

// When you want to inherit one class from another, you write a colon after the child class's name followed by the parent class's name.

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() { // This method can also be inherited by the subclasses
        print("I work \(hours) hours a day.")
    }
}

// Let's write two classes that inherit from employee:
class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours today.")
    }
    
    override func printSummary() {   // Custom printSummary() for Developer child class
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times I will spend \(hours) hours arguing about whether code should be indented with spaces or tabs.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm in meetings for \(hours) hours today.")
    }
}

// Both child classes inherit properties from the parent Employee class, which is why they can use the hours propery inside their work method. This avoids repitition.

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

// As well as sharing properties, child classes can also share methods with their parent classes (⭐️ Remember: a function inside a class is called a "method").

let novall = Developer(hours: 8)
novall.printSummary()

// Things get a little more complicated when you want to change a method you've inherited. We could just keep printSummary() in the Employee superclass, but maybe one of the subclasses wants a custom summary being printed. This is why Swift enforces a simple rule: If a subclass wants to change a method it inherited from its superclass, you must use the 'override' keyword in the subclass's version of the method.

// See line 56 to see how this is implemented in the Developer subclass.

// Swift is really smart about how overrides work. If your parent class has a method that returns nothing, but your child class has a method which returns a String, that does not require an override method. They are two different methods.

// If you know for sure that your class should not support inheritance, you can mark it as 'final.' This means the class itself can inherit from other classes, but no class can inherit from it; no child class can inherit from a final parent class.


// 3. ============= Adding initializers for classes ==============

// Class initialiers are a lot more complicated than struct initializers, but with a little cherrypicking we can focus on the part that really matters: if a child class has any custom initializers, it must always call the parent's initializers when it's finished setting up its own properties (if it has any).
// Swift doesn't automatically generate a memberwise initializer for classes. This applies with or without inheritance happening. We either need to write our own initializer, or provide default values for all the properties of the class.

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

// Let's make a new Car class that inherits the vehicle class.
// Remember, the Car class is a child of the Vehicle class. The vehicle class must know whether or not the vehicle is electric. Swift wants us to provide Car with an initializer that includes both isElectric and isConvertible, but instead of trying to store isElectric ourselves we have to pass it on by asking the superclass to run its own initializer.

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isConvertible: Bool, isElectric: Bool) { // notice that Car's init includes properties from Vehicle
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
        // 'super' allows us to call up to methods inherited from a parent class such as, in this case, its initializer. You can use it with other methods as well; this is not restricted to initializers.
    }
}

let teslaX = Car(isConvertible: false, isElectric: true)

// ⭐️ Tip: If a child class does not have any of its own initializers, it will automatically inherit the initializers of its parent class. We can actually remove the init in the Car class and give isConvertible a default value of false.

class Car2: Vehicle {
    let isConvertible = false
}

// Now we can create a Car2 object which whill automatically inherit the isElectric initializer from the parent Vehicle type.

let teslaY = Car2(isElectric: true)


// 4. ===================== Copying classes =========================

// In Swift, all copies of a class instance always point to the same piece of data. This means changing one will automatically change all of the others too. This is because, in Swift, classes are called reference types, which means all copies of a class refer back to the same underlying pot of data.

class User {
    var username = "Anonymous" // This property will be shared across all instances of the User class.
}

// We can make an instance of the User class called user1
var user1 = User()

// We can then take a copy of user1 into user2, and then change its username value. Changing the username of user2 will also update user1
var user2 = user1
user2.username = "Taylor"

print(user1.username)
print(user2.username)

// This is a really important feature as it allows us to share common data in lots of parts of our program. SwiftUI relies heavily on this.

// In comparison, structs do not share their data across their copies.

struct Username {
    var username = "Anonymous" // This property will be shared across all instances of the User class.
}

var user3 = Username()
var user4 = user3
user4.username = "Taylor"

print(user3.username) // Anonymous
print(user4.username) // Taylor


// If you want to make a unique copy of a class instance, sometimes called a "deep copy," you'll be able to handle creating a new instance and copying across properties by hand.

class Person {
    var name = "Anonymous"
    
    func copy() -> Person {
        let person = Person()
        person.name = name
        return person
    }
}

var user5 = Person()
var user6 = user5.copy() // Now we can call copy whenever we want a unique copy. This will leave user3 alone when we change user4
user6.name = "Taylor"

print(user5.name) // Anonymous
print(user6.name) // Taylor

class Statue {
    var sculptor = "Unknown"
}
var venusDeMilo = Statue()
venusDeMilo.sculptor = "Alexandros of Antioch"
var david = Statue()
david.sculptor = "Michaelangelo"
print(venusDeMilo.sculptor)
print(david.sculptor)

// 4. ===================== Creating a deinitializer for a class =========================

// Swift’s classes can optionally be given a deinitializer, which is a bit like the opposite of an initializer in that it gets called when the object is destroyed rather than when it’s created.

/*  1. You don’t use func with deinitializers.
 2. Deinitializers can never take parameters or return data (no parentheses).
 3. Deinitalizers run when the last copy of a class instance is destroyed.
 4. We never call deinitializers directly.
 5. Structs do not have deinitializers (you can't copy them!) */

// When a deinitializer is called comes down to scope. In the case of classes, only one copy of the data is destroyed when we exit scope. However, when all copies have been destroyed, then the underlying data is also destroyed.

class User2 {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit { // No parentheses!! Cannot take paramaters
        print("User \(id): I'm dead!")
    }
}

// For example, if we create a user in this loop, it'll be destroyed when the iteration ends.

var users = [User2]()

for i in 1...3 {
    let user = User2(id: i)
    print("User \(user.id): I'm in control.")
    users.append(user)
}

print("Loop is finished!")
users.removeAll() // All objects in the users array are destroyed, so deinit is called.
print("Array is clear!")

// 5. ===================== Working with variables inside classes =========================

// Classes work like sign posts. Every copy of a Class instance is actually a sign pointing to the same piece of underlying data. This matters because changing one copy  changes the other copies, but it also affects the way we handle variables stored inside Classes.

class User3 {
    var name = "Paul" // The name property is a var, so it CAN be changed.
}

let user7 = User3()
user7.name = "Taylor"
print(user7.name)

// But, we're changing the constant??
// Turns out, we aren't. The class instant itself cannot be changed.

// What if we make the class property and the name both variables?

class User4 {
    var name = "Paul"
}

var user8 = User4()
user8.name = "Taylor"
user8 = User4() // Here, we change the actual instance of user8 (a whole new User4())
print(user8.name) // Paul

// If we have variable instance and constant properties, this means we can make a new instance of User() if we want, but when that's done, we can't change the internal values.

/* We end up with four possible situations:
 1. Constant class, constant property:
    Sign that always points to the same user, who always has the same name
 2. Constant class, variable property
    Sign that always points to the same user, but they CAN change their name
 3. Variable class, variable property
    Sign can move around and point to different people, but their names can never change
 4. Variable class, constant property
    Sign can move around and point to different people, and the people CAN change their names.*/

// Because classes refer to data in a shared bucket, they do not need to have the `mutating` keyword with methods that change their data.

