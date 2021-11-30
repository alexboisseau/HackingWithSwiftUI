// DAY 12 - CLASSES, INHERITANCE, AND CHECKPOINT 7

// *-- How to create your own classes --*

class Game {
    var score: Int = 0 {
        didSet {
            print("Score is now \(self.score)")
        }
    }
}

let newGame = Game()
newGame.score += 5

// *-- How to make one class inherit from another --*

class Employee {
    let hours: Int
    let name: String
    
    init(hours: Int, name: String) {
        self.hours = hours
        self.name = name
    }
    
    func greet() {
        print("Hello ! I'm an employee and my name is \(self.name) 👋")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(self.hours) hours 💻")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings gor \(self.hours) hours 🤓")
    }
}

let martin = Developer(hours: 8, name: "Martin")
let john = Manager(hours: 10, name: "John")

//martin.greet()
//john.greet()
//martin.work()
//john.work()

// *-- How to add initializers for classes --*

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

// *-- How to copy classes --*

class User {
    var username: String = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = self.username
        
        return user
    }
}

let newUser = User()
let copyOfNewUser = newUser.copy() // Deep copy
copyOfNewUser.username = "Martin"

print(newUser.username)
print(copyOfNewUser.username)

// *-- How to create a deinitializer for a class --*
class Habitant {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("Habitant \(self.id): I'm alive !")
    }
    
    deinit {
        print("Habitant \(self.id): I'm dead !")
    }
}

for i in 1...2 {
    let habitant = Habitant(id: i)
    print("Habitant \(habitant.id): I'm in control !")
}

var habitants = [Habitant]()

for i in 3...4 {
    let habitant = Habitant(id: i)
    print("Habitant \(habitant.id): I'm in control !")
    habitants.append(habitant)
}

print("Loop is finished !")
habitants.removeAll()
print("Array is clear !")

// *-- Checkpoint 7 --*
/*
    Make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persion and Lion subclasses of Cat.
 
    But there's more :
        1 - The Animal class should have a legs integer property that tracks how many legs the animal has.
        2 - The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
        3 - The Cat should have a matching speak() method, again with each subclass printing something different.
        4 - The Cat should have an isTame Boolean property, provided using an initializer
 */

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() -> Void {
        
    }
}

class Corgi: Dog {
    override func speak() {
        print("Wof Wof ! I'm a Corgi !")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Wof Wof ! I'm a Poodle !")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init(isTame: Bool, legs: Int) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() -> Void {
        
    }
}

class Persion: Cat {
    override func speak() -> Void {
        print("Miaouuuus ! I'm a Persion")
    }
}

class Lion: Cat {
    override func speak() -> Void {
        print("Miaouuuus ! I'm a Lion")
    }
}

let newPersion = Persion(isTame: true, legs: 4)
let newPoodle = Poodle(legs: 4)

newPersion.speak()
newPoodle.speak()

