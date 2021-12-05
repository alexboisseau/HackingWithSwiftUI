// DAY 14 -

import Foundation

// *-- How to handle missing data with optionals --*

var opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let marioOpposite: String? = opposites["Mario"]

if let marioOpposite = marioOpposite {
    print("The Mario opposite is : \(marioOpposite)")
}

func square(number: Int) -> Int {
    number * number
}

let myNumber: Int? = nil

if let myNumber = myNumber {
    print("\(square(number: myNumber))")
} else {
    print("Number is nil")
}

// *-- How to unwrap optionals with guard --*

func printSquare(number: Int?) {
    guard let number = number else {
        print("The paramater 'number' need to has a value")
        return
    }
    
    print("\(number) x \(number) = \(number * number)")
}

printSquare(number: 5)

// *-- How to unwrap optionals with nil coalescing --*

let playerJerseys = [
    "Sterling": "9",
    "Grealish": " 13",
    "De Bruyne": "10"
]

let edersonJersey = playerJerseys["Ederson"] ?? "N/A"
print(type(of: edersonJersey))

struct Book {
    let title: String
    let author: String?
    
    func printSomeInformation() -> Void {
        print("The title of this book is \"\(self.title)\" and it was written by \(self.author ?? "an anonymous person")")
    }
}

let myBook = Book(title: "Harry Potter and the chamber of secrets", author: "JK Rowling")
myBook.printSomeInformation()

let anotherBook = Book(title: "A mystery book", author: nil)
anotherBook.printSomeInformation()

// *-- How to handle multiple optionals using optional chaining --*

let friends: [String] = []

let choosen = friends.randomElement()?.uppercased() ?? "I have no friends 🥲"
print(choosen)

// *-- How to handle function failure with optionals --*
enum UserError: Error {
    case badId, networkFailed
}

func getUser(id: Int) throws -> String {
    if id == 23 {
        return "Rudy Martin"
    }
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User Name : \(user)")
} else {
    print("Error during user request")
}

let user = (try? getUser(id: 10)) ?? "Error during user request" // Using nil coalescing
print(user)

// *-- Checkpoint 9 --*
/*
    Write a function that accepts an optional array of integers, and return one randomly.
    If the array is missing or empty, return a random number in the range 1 through 100.
 
    It that sounds easy, it's because I haven't explained the catch yet : I want you to write the function
    in a single line of code.
 */

func getRandomElement(elements: [Int]) -> Int {
    return elements.randomElement() ?? Int.random(in: 10...100)
}

print(getRandomElement(elements: []))
