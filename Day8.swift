// DAY 8 - DEFAULT VALUES, THROWING FUNCTIONS AND CHECKPOINT4

// *-- How to provide default values for parameters --*

func printTimesTables(for number: Int, end: Int = 10) {
    for i in 1...end {
        print("\(number) x \(i) = \(number * i)")
    }
}

printTimesTables(for: 4, end: 5) // We can also call this function like this: printTimesTables(for: 4). The value of end parameter will be his default value : 10.

// *-- How to handle errors in functions --*
enum PasswordError: Error {
    case short, obvious
}

func checkPassword(password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

do {
    let result = try checkPassword(password: "12345")
    print("Password rating : \(result)")
} catch PasswordError.short {
    print("The password is too short")
} catch PasswordError.obvious {
    print("The password is too obvious")
}

// CHECKPOINT4

/*
    Write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number.That sounds easy, but there are some catches:
        
        1 - You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
        2 - If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
        3 - You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
        4 - If you can’t find the square root, throw a “no root” error.
 */

enum SqrtError: Error {
    case outOfBounds, noRoot
}

func mySqrtFunction(number: Int) throws -> Int {
    
    if number > 10_000 || number < 1 {
        throw SqrtError.outOfBounds
    }
    
    var result: Int = 0
    
    for i in 1...100 {
        
                if i >= number {
                    throw SqrtError.noRoot
                }
        
        if (i * i) == number {
            result = i
            break
        }
    }
    
    return result
}

do {
    print(try mySqrtFunction(number: 26))
} catch SqrtError.outOfBounds {
    print("The number must to be greather than 1 and less than 10 000")
} catch SqrtError.noRoot {
    print("No root for this number")
}

