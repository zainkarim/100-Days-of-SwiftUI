// FizzBuzz
// Loop from 1 to 100
// If multiple of 3, print "Fizz"
// If multiple of 5, print "Buzz"
// If multiple of both, print "FizzBuzz"
// Otherwise, just print the number.

for i in 1...100 {
    if i % 3 == 0 && i % 5 == 0 {
        print("FizzBuzz")
    } else if i % 5 == 0 {
        print("Buzz")
    } else if i % 3 == 0 {
        print("Fizz")
    } else {
        print(i)
    }
}
