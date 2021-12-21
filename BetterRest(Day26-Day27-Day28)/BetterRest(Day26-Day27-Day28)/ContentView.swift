//
//  ContentView.swift
//  BetterRest(Day26-Day27-Day28)
//
//  Created by Alex Boisseau on 20/12/2021.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15) {
                Text("When do you want to wake up")
                    .font(.headline)
                
                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Text("Desired amount of sleep")
                    .font(.headline)
                
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount)
                
                Text("Daily coffee intake")
                    .font(.headline)
                
                Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
            }
                .navigationTitle("Better Rest 🧘")
                .toolbar {
                    Button("Calculate", action: calculateBedTime)
                }
        }
    }
    
    func calculateBedTime() -> Void {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
        } catch {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
