//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Alex Boisseau on 13/12/2021.
//

import SwiftUI

struct LargeBlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func largeBlueTitleStyle() -> some View {
        modifier(LargeBlueTitle())
    }
}

struct FlagImage: View {
    var image: String

    var body: some View {
        Image(image)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var questionNumber = 1
    @State private var flagAnimationAmount: Double = 0
    @State private var userResponse = 0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.7)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Text("Guess the Flag")
                    .largeBlueTitleStyle()
                
                
                Spacer()
                Spacer()
                
                Text("Score: \(userScore)")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.black)
                            .font(.subheadline.weight(.heavy))
                        
                        Text((countries[correctAnswer]))
                            .font(.largeTitle.weight(.semibold))
                            .foregroundStyle(.black)
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            
                            // Used for the animation
                            userResponse = number
                            withAnimation(.easeInOut(duration: 0.5)) {
                                flagAnimationAmount = 360
                            }
                        } label: {
                            FlagImage(image: countries[number])
                        }
                        .rotation3DEffect(.degrees(number == userResponse ? flagAnimationAmount : 0), axis: (x: 0, y: 1, z: 0))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .foregroundColor(.black)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }.padding()
            
        }.alert(scoreTitle, isPresented: $showingScore) {
            
            if questionNumber == 8 {
                Button("Start a new Game", action: newGame)
            } else {
                Button("Continue", action: askQuestion)
            }
            
        } message: {
            
            if questionNumber == 8 {
                Text("This is the end of the game ! Your score is \(userScore)")
            } else {
                Text("Your score is \(userScore)")
            }
        
        }
        
    }
    
    func flagTapped(_ number: Int) {
    
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
        } else {
            scoreTitle = "Wrong ! That's the flag of \(countries[number])"
        }
        
        showingScore = true
        
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionNumber += 1
        flagAnimationAmount = 0
    }
    
    func newGame() {
        userScore = 0
        questionNumber = 0
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
