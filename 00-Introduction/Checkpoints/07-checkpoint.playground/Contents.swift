import Cocoa

/*
 Your challenge is this: make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.

 But there’s more:

 The Animal class should have a legs integer property that tracks how many legs the animal has.
 The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
 The Cat class should have a matching speak() method, again with each subclass printing something different.
 The Cat class should have an isTame Boolean property, provided using an initializer. */

class Animal {
    let legs = 4
}

class Dog: Animal {
    func speak() {
        print("Bark!")
    }
}

class Cat: Animal {
    var isTame: Bool
    func speak() {
        print("Meow!")
    }
    init(isTame: Bool) {
        self.isTame = isTame
        super.init()
    }
}

class Corgi: Dog {
    override func speak() {
        print("Yip yip! 🍑")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Yip! 🐩")
    }
}

class Persian: Cat {
    override func speak() {
        print("Maow :3")
    }
}

class Lion: Cat {
    override func speak() {
        print("Roar! 🦁")
    }
}

var simba = Lion(isTame: false)
simba.speak()
print(simba.legs)
