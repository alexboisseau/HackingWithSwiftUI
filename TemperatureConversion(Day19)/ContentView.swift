//
//  ContentView.swift
//  TemperatureConversion
//
//  Created by Alex Boisseau on 12/12/2021.
//

import SwiftUI
import UIKit

struct ContentView: View {
    let typesTemperature = ["Celcius", "Fahrenheit", "Kelvin"]
    
    @State private var inputType = "Celcius"
    @State private var outputType = "Fahrenheit"
    @State private var temperatureValue = 10.00
    
    @FocusState private var temperatureValueIsFocused: Bool
    
    var resultValue: Double {
        var result: Double = 0.00
        
        if inputType == outputType {
            return temperatureValue
        }
        
        switch outputType {
        case "Celcius":
            if inputType == "Kelvin" {
                result = getCelciusValue(inputValue: temperatureValue, inputType: .Kelvin)
            } else if inputType == "Fahrenheit" {
                result = getCelciusValue(inputValue: temperatureValue, inputType: .Fahrenheit)
            }
        case "Fahrenheit":
            if inputType == "Kelvin" {
                result = getFahrenheitValue(inputValue: temperatureValue, inputType: .Kelvin)
            } else if inputType == "Celcius" {
                result = getFahrenheitValue(inputValue: temperatureValue, inputType: .Celcius)
            }
        case "Kelvin":
            if inputType == "Celcius" {
                result = getKelvinValue(inputValue: temperatureValue, inputType: .Celcius)
            } else if inputType == "Fahrenheit" {
                result = getKelvinValue(inputValue: temperatureValue, inputType: .Fahrenheit)
            }
        default:
            result = temperatureValue
        }
        
        return result
    }
        
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.semibold)]
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    Picker("Input Type", selection: $inputType) {
                        ForEach(typesTemperature, id: \.self) {
                            Text($0)
                        }
                    }
                        .pickerStyle(SegmentedPickerStyle())
                } header: {
                    Text("Input Type")
                }
                
                Section {
                    Picker("Output Type", selection: $outputType) {
                        ForEach(typesTemperature, id: \.self) {
                            Text($0)
                        }
                    }
                        .pickerStyle(SegmentedPickerStyle())
                } header: {
                    Text("Output Type")
                }
                
                Section {
                    TextField("Temperature", value: $temperatureValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($temperatureValueIsFocused)
                } header: {
                    Text("Temperature (in \(inputType))")
                }
                
                Section {
                    Text(String(format: "%.2f", resultValue))
                } header: {
                    Text("Result (in \(outputType))")
                }
            }
                .navigationTitle("Temperature Conversion 🌡")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Result") {
                            temperatureValueIsFocused = false
                        }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
