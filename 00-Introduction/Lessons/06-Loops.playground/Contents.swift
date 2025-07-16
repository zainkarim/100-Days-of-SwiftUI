import Cocoa

// Using a for loop to execute repetitive code
let platforms = ["macOS", "iOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os)!")
}

// Looping over a fixed range of numbers
for i in 1...12 {
    print("5 times \(i) is \(5 * i)")
}

// Nested for loops - times table
for i in 1...12 {
    print("This is the \(i) times table.")
    for j in 1...12 {
        print("     \(j) x \(i) is \(i * j)")
    }
    print()
}

for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

for i in 1..<5 {
    print("Counting from 1 up to 5: \(i)")
}

// Sometimes we may want to run some code a certain number of times using a range, but we don't actually care about the loop variable. In situations like this, we can just replace the loop variable with an underscore.
var lyric = "Haters gonna hate"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)

// Using while loops to execute repetitive code

// While loops are less common and less useful than for loops
var countdown = 10
while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1;
}
print("Blastoff!")

// Random numbers
let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

// Rolling a D20, ending only when a 20 (critical) is rolled.
var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print(roll)
}

print("Critical roll!")

// Exiting loops/skipping items in a loop.
// Continue
let filenames = ["zain-karim-resume.pdf", "me.jpg", "work.txt", "micaela.jpeg"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false && filename.hasSuffix(".jpeg") == false {
        continue // Skips .pdf and .txt
    }
    print("Found picture: \(filename)")
}

// Break
// Calculating 10 common multiples for two numbers

let num1 = 4 // constants to hold out numbers
let num2 = 14

var multiples = [Int]() // Creating an empty int array

for i in 1...100_000 { // loop from 1 to 100,000, assign each value to i
    if i.isMultiple(of: num1) && i.isMultiple(of: num2) { // if number is multiple of num1 and num2, add it to the array.
        multiples.append(i)
        
        if multiples.count == 10 { // once we have 10 items in the array, break the loop.
            break
        }
    }
}
print(multiples)

// In summary, use continue when you want to skip the rest of the current loop iteration. Use break if you want to skip the entire rest of the loop and all remaining iterations.
