//
//  TemperatureFunc.swift
//  TemperatureConversion
//
//  Created by Alex Boisseau on 13/12/2021.
//

import Foundation

enum TemperatureType {
    case Celcius, Fahrenheit, Kelvin
}

func getCelciusValue (inputValue: Double, inputType: TemperatureType) -> Double {
    var result: Double
    
    switch inputType {
    case .Fahrenheit:
        result = (inputValue - 32) * (5/9)
    case .Kelvin:
        result = (inputValue - 273.15)
    default:
        result = 0.00
    }
    
    return result
}

func getFahrenheitValue (inputValue: Double, inputType: TemperatureType) -> Double {
    var result: Double
    
    switch inputType {
    case .Celcius:
        result = (inputValue * (9/5)) + 32
    case .Kelvin:
        result = (inputValue - 273.15) * (9/5) + 32
    default:
        result = 0.00
    }
    
    return result
}

func getKelvinValue (inputValue: Double, inputType: TemperatureType) -> Double {
    var result: Double
    
    switch inputType {
    case .Celcius:
        result = inputValue + 273.15
    case .Fahrenheit:
        result = (inputValue - 32) * (5/9)
    default:
        result = 0.00
    }
    
    return result
}
