// DAY 10 - STRUCTS, COMPUTED PROPERTIES AND PROPERTY OBSERVERS

// *-- How to create your own structs --*
struct Employee {
    let name: String
    var vacationRemaining: Int = 24
    
    mutating func takeVacation(days: Int) {
        if self.vacationRemaining > days {
            self.vacationRemaining -= days
            print("I'm going on vacation !")
            print("Days remaining: \(self.vacationRemaining)")
        } else {
            print("Oops ! There aren't enough days remaining")
        }
    }
}

var franck = Employee(name: "Franck Gastambide")
var apash = Employee(name: "Apash", vacationRemaining: 100)

// *-- How to compute property values dynamically --*
struct Employee2 {
    let name: String
    var vacationAllocated = 24
    var vacationTaken = 0
    
    var vacationRemaining: Int { // computed property
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var dany = Employee2(name: "Dany", vacationAllocated: 24, vacationTaken: 0)
dany.vacationTaken = 10
dany.vacationRemaining = 20
print(dany.vacationRemaining)
print(dany.vacationTaken)
print(dany.vacationAllocated)

// *-- How to take action when a property changes --*
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
            print("Old score value was \(oldValue)")
        }
    }
}

var game = Game()
game.score += 1

// *-- How to create custom initializers --*
struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        self.number = Int.random(in: 1...99)
    }
}

var hazard = Player(name: "Eden Hazard")
print(hazard.number)
