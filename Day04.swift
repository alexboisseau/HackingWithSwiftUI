// DAY 4 - TYPE ANNOTATIONS AND CHECKPOINT 2

// *-- How to use type annotations --*
let playerName = "Harry Kane" // Without type annotations
let playerName2: String = "Cristiano Ronaldo" // With type annotations

struct Club {
    let name: String
    var players: [String]
    var salary: [String: Double]
    var jerseyPlayer: [Int: String]
    var cash: Int
    let availableForTheChampionsLeague: Bool
}

// *-- Checkpoint 2 --*
/*
    Create an array of strings, then write some code that prints the number of items in the array and also the
    number of unique items in the array.
*/

let players: [String] = ["Ronaldo", "Messi", "Son", "Ronaldo", "Puyol", "Xavi", "Ramos", "Messi", "Puyol"]
print("The array of players contains \(players.count) items but it contains only \(Set(players).count) unique items")
