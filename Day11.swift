// DAY 11 - ACCESS CONTROL, STATIC PROPERTIES AND METHODS, AND CHECKPOINT 6

// *-- How to limit access to internal data using access control --*
struct BankAccount {
    private(set) var funds = 0 // This property is only accessible inside the struct
    
    init(fundsValue: Int){
        self.funds = fundsValue
    }
    
    mutating func deposit(amount: Int) {
        self.funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if self.funds > amount {
            self.funds -= amount
            return true
        } else {
            return false
        }
    }
}

var myBankAccount = BankAccount(fundsValue: 50_000)
print("I have \(myBankAccount.funds) euros inside my bank account !")
// myBankAccount.funds = 100_000 ❌ This is not possible because of 'private(set)' inside the struct

// *-- Static properties and methods --*

struct AppData {
    static private(set) var version = "1.2.7"
    static let saveFilename = "settings.json"
    
    static func updateVersion(newVersion: String) {
        Self.version = newVersion
    }
}

AppData.updateVersion(newVersion: "1.2.8") // We don't need to create new instance to use method or read property because of 'static' keyword
print(AppData.version)

// *-- Checkpoint 6 --*
/*
 Create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?
 */

struct Car {
    let model: String
    let maximumGear: Int
    var numberOfSeats: Int
    
    private(set) var currentGear: Int {
        didSet {
            print("The current gear of the car is equal to : \(self.currentGear) hm/h")
        }
    }
    
    mutating func upGear() {
        if self.currentGear + 5 > self.maximumGear {
            self.currentGear += self.maximumGear
        } else {
            self.currentGear += 5
        }
    }
    
    mutating func downGear() {
        if self.currentGear - 5 < 0 {
            self.currentGear = 0
        } else {
            self.currentGear -= 5
        }
    }
}

var myCar = Car(model: "Clio IV", maximumGear: 180, numberOfSeats: 5, currentGear: 0)

for _ in 1...10 {
    let randomNumber = Int.random(in: 1...10)
    randomNumber.isMultiple(of: 2) ? myCar.upGear() : myCar.downGear()
}
