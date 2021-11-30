// DAY 2 - BOOLEANS, STRING INTERPOLATION, AND CHECKPOINT 1
// *-- How to store truth with Booleans --*

var manCityIsTheBestTeam: Bool = true
var manCityWillWinTheSeason: Bool = !false // The operator "!" inverse the value, so !false = true

// *-- How to join strings together --*
let withPlusOperator: String = "Manchester City was created in " + "1880 " + "à Gorton."
var championOfEnglandYear: [Int] = [1937, 1968, 2012, 2014, 2018, 2019, 2021]
let withStringInterpolation: String = "Manchester has been champion of England \(championOfEnglandYear.count) times since its creation"

print(withPlusOperator)
print(withStringInterpolation)

// *-- Checkpoint 1 *--
/*
 You already know enough to start writing your first useful code, albeit fairly simple: we’re going to convert temperatures from Celsius to Fahrenheit.

 Your goal is to write a Swift playground that:

 1 - Creates a constant holding any temperature in Celsius.
 2 - Converts it to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
 3 - Prints the result for the user, showing both the Celsius and Fahrenheit values.
 */

let myTemperature: Double = 19.5
print("\(myTemperature) Celsius is equal to \(myTemperature * 9 / 5 + 32) Fahrenheit")
