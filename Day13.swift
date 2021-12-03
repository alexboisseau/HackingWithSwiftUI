// DAY 13 - PROTOCOLS, EXTENSIONS, AND CHECKPOINT 8
import Foundation

// *-- How to create and use protocols --*
protocol Vehicle {
    var name: String { get }
    var passengersNumber: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int) -> Void
}

struct Car: Vehicle {
    
    let name: String
    var passengersNumber: Int
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) -> Void {
        print("I'm driving \(distance)km with my \(self.name)")
    }
    
    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name: String
    var passengersNumber: Int
    
    func estimateTime(for distance: Int) -> Int {
        distance / 15
    }
    
    func travel(distance: Int) -> Void {
        print("I'm driving \(distance)km with my \(self.name)")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 25 {
        print("It's too slow. I'll try with another vehicle. Maybe use a rocket with Elon 🚀")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car(name: "Tesla X", passengersNumber: 4)
commute(distance: 100, using: car)
let bicycle = Bicycle(name: "Rudy", passengersNumber: 1)
commute(distance: 500, using: bicycle)

func getTravelEstimates(distance: Int, for vehicles: [Vehicle]) {
    for vehicle in vehicles {
        let estimateTime = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimateTime) hours to travel \(distance)km")
    }
}

getTravelEstimates(distance: 100, for: [car, bicycle])

// *-- How to use opaque return types --*
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

// *-- How to create and use extensions --*
var quote = "   The truth is rarely pure and never simple   "
let trimmedQuote = quote.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() -> Void {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let useExtension = quote.trimmed()
var usingMutatingFunction = "   I'll be back    "
usingMutatingFunction.trim()
let myMultiLinesSentence = """
Hello world,
My name is Rudy,
I love bread with chocolate
"""

print(usingMutatingFunction)
print(useExtension)
print(trimmedQuote)
print("My sentence has \(myMultiLinesSentence.lines.count) lines !")

// *-- How to create and use protocol extensions --*

protocol Person {
    var name: String { get }
    func sayHello() -> Void
}

extension Person {
    func sayHello() {
        print("Hello ! My name is \(self.name)")
    }
}

struct Employee: Person {
    let name: String
}

let newEmployee = Employee(name: "Elon")
newEmployee.sayHello()

// *-- Checkpoint 8 --*

/*
 Make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office,
 that conform to it. Your protocol should require the following:
    1 - A property storing how many rooms it has.
    2 - A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
    3 - A property storing the name of the estate agent responsible for selling the building.
    4 - A method for printing the sales summary of the building, describing what it is along with its other properties.
 */

protocol Building {
    var roomsCount: Int { get set}
    var cost: Int { get set}
    var estateAgentResponsible: String { get set }
    var typeBuilding: String { get }
    
    func salesSummary() -> Void
}

extension Building {
    func salesSummary() {
        print("This \(self.typeBuilding) has \(self.roomsCount) and costing $\(self.cost)")
    }
}

struct House: Building {
    let typeBuilding = "House"
    var roomsCount: Int
    var cost: Int
    var estateAgentResponsible: String
}

struct Office: Building {
    let typeBuilding = "Office"
    var roomsCount: Int
    var cost: Int
    var estateAgentResponsible: String
}

var house = House(roomsCount: 4, cost: 340_000, estateAgentResponsible: "Mr Rudy")
var office = Office(roomsCount: 0, cost: 500_000, estateAgentResponsible: "Mr Elon")

house.salesSummary()
office.salesSummary()

