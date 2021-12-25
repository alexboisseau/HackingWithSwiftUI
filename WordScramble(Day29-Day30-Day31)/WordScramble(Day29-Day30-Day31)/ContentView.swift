//
//  ContentView.swift
//  WordScramble(Day29-Day30-Day31)
//
//  Created by Alex Boisseau on 24/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    @State private var currentScore = 0
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section("Score") {
                    Text("Your score is : \(currentScore)")
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
                .navigationTitle(rootWord)
                .onSubmit(addNewWord)
                .onAppear(perform: startGame)
                .alert(errorTitle, isPresented: $showingError) {
                    Button("OK", role: .cancel) {}
                } message: {
                    Text(errorMessage)
                }
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Button("New Word") {
                            startGame()
                        }
                    }
                }
        }
    }
    
    func addNewWord() {
        
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {
            wordError(title: "Invalid input", message: "Word must contains at least one caracter")
            return
        }
        
        guard answer != rootWord else {
            wordError(title: "Invalid input", message: "Word should not be the same that the root word !")
            return
        }
        
        guard isMoreThanThreeLetters(word: answer) else {
            wordError(title: "Invalid input", message: "Word must have more than three letters")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from \(rootWord)")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        currentScore += answer.count
        
        newWord = ""
    }
    
    func startGame() {
        // 1. Find the url for our start.txt file in our app bundle.
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: ".txt") {
            
            // 2. Load the content of the file inside a string
            if let fileContent = try? String(contentsOf: fileURL) {
                
                // 3. Split the content of the file inside an array
                let words = fileContent.components(separatedBy: "\n")
                
                // 4. Get a random element from this one
                rootWord = words.randomElement() ?? "silkworm"
                
                // 5. Clear the usedWords array and set the score to 0
                usedWords.removeAll()
                currentScore = 0
                
                // Let's go ! Everything looks great
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        
        for letter in word {
            if (!rootWord.contains(String(letter))){
                return false
            }
        }
        
        return true
    }
    
    func isMoreThanThreeLetters(word: String) -> Bool {
        return word.count > 3
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let mispelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return mispelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) -> Void {
        errorTitle = title
        errorMessage = message
        
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
