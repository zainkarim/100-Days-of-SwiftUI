//  Create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?

// let: model, seats
// private var: gear
// gear should be private so that it cannot be changed directly, must use shiftUp or shiftDown.
// gear changing methods should look at current gear and validate if gears can be shifted by defined amount (e.g, if currently in third gear, and vehicle has 5 gears, then you shouldnt be able to shift up by three more gears, and vice versa).

struct Car {
    
    let make, model: String
    let numSeats, numGears: Int
    
    private(set) var currentGear = 1 {
        willSet {
            print("\(make) \(model)'s current gear: \(currentGear)")
        }
    }
    
    mutating func shiftUp(gears: Int) {
        if gears + currentGear <= numGears {
            currentGear += gears
            print("Shifting up \(gears) gear(s)...")
            print("Your \(make) \(model) is now in gear \(currentGear).")
        } else {
            print("You can't shift your \(model) that high!")
        }
    }
    mutating func shiftDown(gears: Int) {
        if currentGear - gears >= 1 {
            currentGear -= gears
            print("Shifting down \(gears) gear(s).")
            print("Your \(make) \(model) is now in gear \(currentGear).")
        } else {
            print("You can't shift your \(model) that low!")
        }
    }
    
    init(make: String, model: String, seats: Int, gears: Int) {
        self.make = make
        self.model = model
        numSeats = seats
        numGears = gears
    }
}

var myCar = Car(make: "Honda", model: "Accord", seats: 5, gears: 5)
myCar.currentGear
myCar.shiftUp(gears: 4)
myCar.shiftDown(gears: 5)

var tesla = Car(make: "Tesla", model: "Roadster", seats: 2, gears: 2)
tesla.currentGear
tesla.shiftUp(gears: 1)

