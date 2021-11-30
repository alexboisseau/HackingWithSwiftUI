// DAY 7 - FUNCTIONS, PARAMETERS, AND RETURN VALUES
import Foundation

// *-- How to reuse code with functions --*
let randomInt: Int = Int.random(in: 0...10)


func printMultiplicationTable(of: Int, from: Int, to: Int) {
    
    for i in from...to {
        print("\(of) multiplié par \(i) est égal à \(i * of)")
    }
}

printMultiplicationTable(of: randomInt, from: 0, to: 10 )

// *-- How to return values from functions --*
func areLettersIdentical(s1: String, s2: String)->Bool {
    s1.sorted() == s2.sorted()
}

print(areLettersIdentical(s1: "abc", s2: "cab"))

func pythagoras(d1: Double, d2: Double) -> Double {
    sqrt((d1 * d1) + (d2 * d2))
}

print(pythagoras(d1: 10.3, d2: 45))

// *-- How to return multiple values from functions --*
func getUser() -> (firstName: String, lastName: String, age: Int) {
    (firstName: "Alex", lastName: "Boisseau", age: 21)
}

let user = getUser()
print("Hello ! My name is \(user.firstName) \(user.lastName) and I'm \(user.age) years old !")

let (firstName, lastName, age) = getUser()
print("Hello ! My name is \(firstName) \(lastName) and I'm \(age) years old !")

func rollDice(sides: Int, times: Int) -> [Int] {
    var rolls: [Int] = []
    
    for _ in 1...times {
        rolls.append(Int.random(in: 1...sides))
    }
    
    return rolls
}

let rolls = rollDice(sides: 6, times: 10)
print(rolls)

func getAuthenticationInformations() -> (username: String, password: String) {
    ("user", "aVeryStrongPassword")
}

let (username, pwd) = getAuthenticationInformations()
print("Hey bro ! My username is \(username) and my password is \(pwd)")

