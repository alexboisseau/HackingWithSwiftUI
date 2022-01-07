//
//  ContentView.swift
//  MultiplicationTables(Day35)
//
//  Created by Alex Boisseau on 06/01/2022.
//

import SwiftUI

struct Question {
    var question: String
    var propositions: [String]
    var solution: Int
        
    init(table: Int) {
        let multiplicator = Int.random(in: 1...12)
        let answer = table * multiplicator
        let answerIndex = Int.random(in: 0...2)
        
        var propositionsTemp = [String]()
        var usedValue = [Int]()
        
        for i in 0...2 {
            
            if i == answerIndex {
                propositionsTemp.append("\(answer)")
            } else {
                var value = table * Int.random(in: 1...12)
                
                while usedValue.contains(value) || value == answer {
                    value = table * Int.random(in: 1...12)
                }
                
                usedValue.append(value)
                propositionsTemp.append("\(value)")
            }

        }
        
        self.propositions = propositionsTemp
        self.solution = answerIndex
        self.question = "\(table) * \(multiplicator)"
    }
}

struct ContentView: View {
    @State private var multiplicationTable = 5
    @State private var howManyQuestions = 5
    @State private var questionNumber = 1
    @State private var question = Question(table: 5)
    @State private var score = 0
    @State private var showingScore = false
    
    var body: some View {
        NavigationView {
            VStack{
                SettingsView(multiplicationTable: $multiplicationTable, howManyQuestions: $howManyQuestions, question: $question)
                Spacer()
                
                QuestionView(question: $question, questionNumber: $questionNumber, table: $multiplicationTable, score: $score, showingScore: $showingScore, howManyQuestions: howManyQuestions)
                VStack {
                    Text("Good response !")
                    Text("Score : \(score)")
                }
                .padding(.top, 10)
                .font(.caption)
                
                Spacer()
                
                Text("Question \(questionNumber)/\(howManyQuestions)")
            }
            .padding(.horizontal, 20)
            .navigationTitle("Multiplication Tables")
            .alert("This is the end !", isPresented: $showingScore) {
                Button("New Game", role: .cancel) {
                    newGame()
                }
            } message: {
                Text("This is the end of the game. Your score is : \(score)/\(howManyQuestions)")
            }
        }
    }
    
    func newGame() -> Void {
        questionNumber = 1
        question = Question(table: multiplicationTable)
        score = 0
    }
}

struct SettingsView: View {
    @Binding var multiplicationTable: Int
    @Binding var howManyQuestions: Int
    @Binding var question: Question
    
    var body: some View {
        Stepper("Choose a multiplication table : \(multiplicationTable)", value: $multiplicationTable, in: 1...12)
            .padding(.top, 10)
            .onChange(of: multiplicationTable) { newTable in
                question = Question(table: newTable)
            }
        Stepper("How many questions you want : \(howManyQuestions)", value: $howManyQuestions, in: 5...20, step: 5)
    }
}

struct QuestionView: View {
    @Binding var question: Question
    @Binding var questionNumber: Int
    @Binding var table: Int
    @Binding var score: Int
    @Binding var showingScore: Bool
    
    var howManyQuestions: Int
    
    @State private var userResponse = -1
    @State private var scale: CGFloat = 1
    @State private var rotationDegree = 0.0
    @State private var opacity = 1.0
    
    var body: some View {
        Text("\(question.question)")
            .font(.title)
        HStack {
            ForEach(0..<question.propositions.count) { index in
                Button("\(question.propositions[index])") {
                    withAnimation(.easeInOut(duration: 1)) {
                        userResponse = index
                        scale += 1
                        rotationDegree = 360
                        opacity = 0.6
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        nextQuestion()
                    }
                }
                .foregroundColor(.white)
                .padding(.horizontal, 25)
                .padding(.vertical, 12)
                .background(userResponse == index ? userResponse == question.solution ? .green : .red : .blue)
                .cornerRadius(5)
                .opacity(userResponse == index ? 1 : opacity)
                .rotation3DEffect(.degrees(userResponse == index ? rotationDegree : 0), axis: (x: 1, y: 1, z: 1))
                .scaleEffect(userResponse == index ? scale : 1)
                .zIndex(userResponse == index ? 100 : 1)
            }
        }
    }
    
    func nextQuestion() -> Void {
                
        if userResponse == question.solution {
            score += 1
        }
        
        if questionNumber == howManyQuestions {
            showingScore = true
        } else {
            questionNumber += 1
            question = Question(table: table)
        }
        
        opacity = 1
        scale = 1
        userResponse = -1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
