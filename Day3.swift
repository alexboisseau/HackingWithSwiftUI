// DAY 3 - ARRAYS, DICTIONARIES, SETS, AND ENUMS

// *-- How to store ordered data in arrays --*
var psgPlayers = [String]() // or : var psgPlayers = Array<String>()
psgPlayers.append("Neymar") // Only string type is available for this table
psgPlayers.append("Mbappé")
psgPlayers.append("Messi")

print(psgPlayers[0]) // Access to the first element of array
print(psgPlayers[1]) // Access to the second element of array
// ...
// Differents methods and properties are available for the Array type
psgPlayers.forEach { player in
    print(player)
}

print("\(psgPlayers.count) players are present in the team")

// *-- How to store and find data in dictionaries --*
/* In an array, all items are ordered and accessible by number from 0 to n-1 items.
   However, in a dictionary, we can access to an item by a key.
*/

var jerseyPlayers: [Int: String] = [20: "L. Kurzawa", 5: "Marquinhos"]
jerseyPlayers[4] = "S.Ramos"

jerseyPlayers.forEach { (jerseyNumber: Int, player: String) in
    print("\(player) have the jersey with the number \(jerseyNumber)")
}

// When we to print a value from a key dictionarie, we can use a default value in case of the keu doesn't exists
print(jerseyPlayers[1000, default: "This number is not used"])


// *-- How to use sets for fast data lookup --*
/* A Set can't have duplicate and his items are not ordered */

var availableJerseyNumbers: Set<Int> = Set([39, 12, 34])
availableJerseyNumbers.insert(51)

availableJerseyNumbers.forEach { jerseyNumber in
    print("\(jerseyNumber) is available for a new player")
}

// *-- How to create and use enums --*
enum Position {
    case goalKeeper, defender, midfielder, attacker
}

let playersPosition: [String: Position] = ["Hakimi": .defender, "Ramos": .defender, "Verratti": .midfielder, "Messi": .attacker]
