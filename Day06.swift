// DAY 5 - LOOPS, SUMMARY, AND CHECKPOINT 3

// *-- How to use a for loop to repeat work --*

// Loop over an array
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for platform in platforms {
    print("Swift works great on \(platform)")
}

// Loop over a range of numbers
for i in 1...10 {
    print("4 * \(i) = \(4 * i)")
}

for i in 1..<11 {
    print("7 * \(i) = \(7 * i)")
}

// *-- How to use a while loop to repeat work --*

var countDown: Int = 10

while countDown > 0 {
    print("CountDown is equal to : \(countDown)")
    countDown -= 1
}

print ("Stop it !")

var roll: Int = 0

while roll != 6 {
    roll = Int.random(in: 1...6)
    print("I have rolled \(roll)")
}

// *-- How to skip loop items with break and continue --*

let files = ["course1.txt", "avatar.jpg", "garden.jpg", "motivation.pdf"]

for file in files {

    if !file.hasSuffix(".jpg") {
        continue
    }

    print("Found an image ! \(file)")
}

let number1: Int = 4
let number2: Int = 11
var multiples: [Int] = []


for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)

// CHECKPOINT 3:  Loop from 1 to 100. If number is multiple of 3 print 'Fizz', if is multiple of 5 print 'Buzz' if is multiple of 3 and multiple of 5 print 'FizzBuzz'

for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) { print("FizzBuzz") }
    else if i.isMultiple(of: 5) { print("Buzz") }
    else if i.isMultiple(of: 3) { print("Fizz") }
}
