// DAY 5 - IF, SWITCH, AND TERNARY OPERATOR

// *-- How to check a condition is true or false --*

let ArsenalPosition:Int = 2

if ArsenalPosition >= 3 {
    print("The team is qualified for the Champions League !")
}

let PsgPlayers: [String] = ["Donnarumma", "Hakimi", "Kimpembe", "Ramos", "Marquinhos","Bernat", "Verratti", "Mbappé", "Neymar", "Messi"]

if PsgPlayers.count != 11 {
    print("You need 11 players to start the game")
}

// *-- How to check multiple conditions --*

let teamPositions: [String: Int] = [
    "Newcastle": 20,
    "Arsenal": 5,
    "Liverpool": 3
]

teamPositions.forEach { (teamName: String, position: Int) in
    if position <= 4 {
        print("\(teamName) will play the Champions League the next season")
    } else if position == 5 {
        print("\(teamName) will play the Europa League the next season")
    } else if position >= 18 {
        print("\(teamName) will go down one division")
    }
}

// *-- How to use switch statements to check multiple conditions --*

enum Forecast {
    case sun, rain, wind, snow, unknown
}

let days: [String: Forecast] = [
    "Day 1": .rain,
    "Day 2": .sun,
    "Day 3": .wind,
    "Day 4": .snow,
    "Day 5": .unknown,
]

days.forEach { (day: String, forecast: Forecast) in
    switch forecast {
    case .sun:
        print("Advise for the \(day) : Think to drink before the game")
    case .rain:
        print("Advise for the \(day) : Supporters, think to take your umbrella !")
    case .wind:
        print("Advise for the \(day) : Play on the ground")
    case .snow:
        print("Advise for the \(day) : The game is canceled")
    case .unknown:
        print("Advise for the \(day) : Be careful !")
    }
}

// *-- How to use the ternary conditional operator for quick tests --*

let ChelseaPosition: Int = 1

print(ChelseaPosition == 1 ? "Chelsea is the first of the table" : "Another team that chelsea is at the top of the table")
