//
//  ContentView.swift
//  BetterRest(Day26-Day27-Day28)
//
//  Created by Alex Boisseau on 20/12/2021.
//

import CoreML
import SwiftUI

struct RowStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color(uiColor: .secondarySystemBackground))
            .cornerRadius(5)
    }
}

extension View {
    func rowStyle() -> some View {
        modifier(RowStyle())
    }
}

struct ContentView: View {
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    @State private var idealSleepTime: String = "Your ideal bedtime is ..."
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("When do you want to wake up ⏰")
                            .font(.headline)
                        
                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .onChange(of: wakeUp) {newValue in
                                updateBedTime()
                            }
                    }
                        .rowStyle()
                    
                    VStack(alignment: .leading) {
                        Text("Desired amount of sleep 🥱")
                            .font(.headline)
                        
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount)
                            .onChange(of: sleepAmount) {newValue in
                                updateBedTime()
                            }
                    }
                        .rowStyle()
                    
                    VStack(alignment: .leading) {
                        Text("Daily coffee intake ☕️")
                            .font(.headline)
                        
                        Picker("Number of cup(s)", selection: $coffeeAmount) {
                            ForEach(1 ..< 21) {
                                 Text("\($0) coffee")
                             }
                        }
                            .onChange(of: coffeeAmount) {newValue in
                                updateBedTime()
                            }
                            .pickerStyle(.wheel)
                    }
                        .rowStyle()
                    
                    Spacer()
                    
                    Text("\(idealSleepTime)")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Spacer()
                    
                }
                    .onAppear(perform: updateBedTime)
                    .navigationTitle("Better Rest 🧘")
                    .alert(alertTitle, isPresented: $showingAlert) {
                        Button("OK") {}
                    } message: {
                        Text(alertMessage)
                    }
            }
                .padding()
        }
    }
    
    func updateBedTime() -> Void {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            idealSleepTime = "Your ideal bedtime is \(sleepTime.formatted(date: .omitted, time: .shortened))"
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
            
            showingAlert = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
