// DAY 9 - CLOSURES, PASSING FUNCTIONS INTO FUNCTIONS, AND CHECKPOINT 5

// *-- How to create and use closures --*

func basicFunction(a: Int, b: Int) -> Int {
    a * b
}

print("5 x 4 = \(basicFunction(a: 5, b: 4))")

let basicClosure = {(a: Int, b: Int) -> Int in
    a * b
}

print("3 x 9 = \(basicClosure(3, 9))")

// Use closure with sorted() method to get longer names in first place
let players = ["Silva", "Mané", "Sterling", "Neymar", "Messi"]
let sortedPlayers = players.sorted(by: { player1, player2 in
    player1.count > player2.count
})

print(sortedPlayers)

// We can also create a function and pass them in the sorted() method
func customSorted(item1: String, item2: String) -> Bool {
    return item1.count > item2.count
}
let sortedPlayers2 = players.sorted(by: customSorted)

print(sortedPlayers2)

// *-- How to use trailing closures and shorthand syntax --*
func entryOfPlayerOnField(playerName: String, jerseyNumber: Int) -> Void {
    print("Entry of player number \(jerseyNumber) on the fieelllllld, \(playerName.uppercased())")
}

var gamePlayers = [
    "Kevin de Bruyne": 10,
    "Jack Grealish": 7,
    "Benjamin Mendy": 8
]

gamePlayers.forEach(entryOfPlayerOnField)

// *-- How to accept functions as parameters --*
func makeDiceRolls(size: Int, using generator: () -> Int) -> [Int] {
    var resultArray = Array<Int>()
    
    for _ in 1...size {
        let newNumber = generator()
        resultArray.append(newNumber)
    }
    
    return resultArray
}

let diceRolls = makeDiceRolls(size: 10) {
    Int.random(in: 1...6)
}

print(diceRolls)

/* Checkpoint 5
    Your input is this: let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
    Your job is to :
        1 - Filter out any numbers that are even
        2 - Sort the array in ascending order
        3 - Map them to strings in the format “7 is a lucky number”
        4 - Print the resulting array, one item per line
 
    So, your output should be as follows:
        7 is a lucky number
        15 is a lucky number
        21 is a lucky number
        31 is a lucky number
        33 is a lucky number
        49 is a lucky number
 */

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
let output: [String] = luckyNumbers.filter { item in
    !item.isMultiple(of: 2)
}.sorted().map { item in
    "\(item) is a lucky number"
}

output.forEach { luckyNumber in
    print(luckyNumber)
}

