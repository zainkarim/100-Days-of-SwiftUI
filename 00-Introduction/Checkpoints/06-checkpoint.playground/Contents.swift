import Cocoa

/* Create a struct to store information about a car. Include:
    - Its model
    - Number of seats
    - Current gear
 * Add a method (or methods) to change gears up or down
 * Have a think about variables and access control.
 * Don't allow invalid gears - 1...10 seems like a fair maximum range.
 HINTS:
 * A car’s model and seat count aren’t going to change once produced, so they can be constant. But its current gear clearly does change, so make that a variable.
 * Changing gears up or down should ensure such a change is possible – there is no gear 0, for example, and it’s safe to assume a maximum of 10 gears should cover most if not all cars.
 * If you use private access control, you will probably also need to create your own initializer. (Is private the best choice here? Try it for yourself and see what you think!)
 * Remember to use the mutating keyword on methods that change properties! */

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear = 1 // Let's make first gear the default value.
    
    // One function to change gears up or down.
    mutating func gearShift(newGear: Int) -> Bool {
        var oldGear: Int = 0
        if newGear >= 1 && newGear < 10 {
            oldGear = currentGear
            currentGear = newGear
            print("Shifting from \(oldGear) to gear \(currentGear).")
            return true
        } else {
            print("Invalid shift: that gear does not exist!")
            return false
        }
    }
    /* two seperate functions for upshifting and downshifting/
    mutating func upShift(shifts: Int) -> Bool {
        if currentGear >= 1 && currentGear + shifts < 10 {
            currentGear += shifts
            print("Upshifting to gear number \(currentGear).")
            return true
        } else {
            print("Can't shift that high!")
            return false
        }
    }
    
    mutating func downShift(shifts: Int) -> Bool {
        if currentGear <= 10 && currentGear - shifts >= 1 {
            currentGear -= shifts
            print("Downshifting to gear number \(currentGear).")
            return true
        } else {
            print("Can't shift that low!")
            return false
        }
    } */
}

var accord = Car(model: "Honda Accord", numberOfSeats: 5)
print("Model: \(accord.model)")
print("Number of seats: \(accord.numberOfSeats)")
print("Current gear: \(accord.currentGear)")

/* accord.upShift(shifts: 6)
 accord.downShift(shifts: 5)
 accord.downShift(shifts: 1)
 accord.downShift(shifts: 1) */

accord.gearShift(newGear: 6)
accord.gearShift(newGear: 12)
