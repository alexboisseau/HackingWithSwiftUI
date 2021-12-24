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
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
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
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
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
                
                // Let's go ! Everything looks great
                print(rootWord)
                print("End of this function")
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
