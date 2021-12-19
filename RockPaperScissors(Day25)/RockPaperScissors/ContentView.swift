//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Alex Boisseau on 19/12/2021.
//

import SwiftUI

struct Symbol: Hashable {
    let name: String
    let color: Color
    let emoji: String
}

struct Prompt {
    var name: String
    var emoji: String
}

let symbols = [
    Symbol(name: "Rock", color: .brown, emoji: "🏔"),
    Symbol(name: "Paper", color: .blue, emoji: "🍃"),
    Symbol(name: "Scissors", color: .indigo, emoji: "✂️")
]
let promptings = [
    Prompt(name: "Win", emoji: "✅"),
    Prompt(name: "Lose", emoji: "❌")
]

struct ResponseButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding(10)
            .background(.blue)
            .cornerRadius(5)
    }
}

extension View {
    func responseButton() -> some View {
        modifier(ResponseButton())
    }
}

struct ContentView: View {
    @State private var correctSymbolIndex: Int = Int.random(in: 0 ..< symbols.count)
    @State private var correctPromptIndex: Int = Int.random(in: 0 ..< promptings.count)
    @State private var userScore: Int = 0
    @State private var currentQuestion: Int = 1
    @State private var showingEndGameAlert: Bool = false
    @State private var progressBarValue: Double = 0.0
    @State private var needToStartNewTimer: Bool = false
    @State private var progressBarLabel: String = "3 seconds ..."
        
    var body: some View {
        VStack {
            
            Spacer()
            
            HStack {
                Text("\(symbols[correctSymbolIndex].name) \(symbols[correctSymbolIndex].emoji) : \(promptings[correctPromptIndex].name)\(promptings[correctPromptIndex].emoji)")
            }.font(.body.bold())
            
            HStack {
                ForEach(symbols, id: \.self) {
                    let name = $0.name
                    let emoji = $0.emoji
                    
                    Button("\(name)\(emoji)") {
                        handleResponse(response: name)
                        nextQuestion()
                    }
                    .responseButton()
                }
            }
            
            VStack {
                Text(progressBarLabel)
                ProgressView(value: progressBarValue)
            }
            .padding(.top, 50)
            .padding(.horizontal, 25)
            
               
            Spacer()
            Text("Score : \(userScore)")
                .font(.largeTitle)
            
            Text("Question \(currentQuestion)/10")
                .font(.caption)
                .padding(.bottom, 30)
            
            Text("Brain Training Game 🧠")
                .font(.caption2)
            Text("Developped by Alex Boisseau | 2021")
                .font(.caption2)
            
        }
        .onAppear(){
            startTimer()
        }
        .alert("End Game !", isPresented: $showingEndGameAlert) {
            Button("Restart") {
                newGame()
            }
        } message: {
            Text("This is the end of the game ! Your score is \(userScore)")
        }
    }
    
    func handleResponse(response: String) {
        if userResponseIsValid(response: response) {
            userScore += 1
        }
    }
    
    func nextQuestion() -> Void {
        
        if (currentQuestion == 10) {
            showingEndGameAlert = true
        } else {
            currentQuestion += 1
            changeQuestion()
        }
    }
    
    func newGame() -> Void {
        changeQuestion()
        
        userScore = 0
        currentQuestion = 1
    }
    
    func changeQuestion() -> Void {
        correctSymbolIndex = Int.random(in: 0 ..< symbols.count)
        correctPromptIndex = Int.random(in: 0 ..< promptings.count)
        
        progressBarValue = 0.00
        progressBarLabel = "3 seconds ..."
    }
    
    func startTimer() -> Void {
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {timer in
            
            if progressBarValue + 0.03 > 1 {
                nextQuestion()
            } else {
                progressBarValue += 0.03
                
                if progressBarValue >= 0.66 {
                    progressBarLabel = "1 seconds ..."
                } else if progressBarValue >= 0.33 {
                    progressBarLabel = "2 seconds ..."
                }
                
                print(progressBarValue)
            }
            
        }
    }
        
    func getCorrectResponse() -> String {
        switch symbols[correctSymbolIndex].name {
        case "Rock":
            if promptings[correctPromptIndex].name == "Win" {
                return "Paper"
            } else {
                return "Scissors"
            }
        case "Paper":
            if promptings[correctPromptIndex].name == "Win" {
                return "Scissors"
            } else {
                return "Rock"
            }
        case "Scissors":
            if promptings[correctPromptIndex].name == "Win" {
                return "Rock"
            } else {
                return "Paper"
            }
        default:
            return ""
        }
    }
    
    func userResponseIsValid(response userResponse: String) -> Bool {
        return userResponse == getCorrectResponse()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
