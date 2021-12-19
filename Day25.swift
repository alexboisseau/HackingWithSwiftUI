//
//  ContentView.swift
//  day25-binding
//
//  Created by Alex Boisseau on 19/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var agreedToTerms = false
    @State private var agreedToPrivacyPolicy = false
    @State private var agreedToEmails = false
    
    var body: some View {
        
        let agreedToAll = Binding<Bool>(
            get: {
                agreedToTerms && agreedToPrivacyPolicy && agreedToEmails
            },
            set: {
                print("New value : \($0)")
                agreedToTerms = $0
                agreedToPrivacyPolicy = $0
                agreedToEmails = $0
            }
        )
        
        return ZStack {
            Color(uiColor: .black)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("Our Conditions 🍇")
                    .font(.largeTitle)
                
                Toggle("Agree to terms", isOn: $agreedToTerms)
                Toggle("Agree to privacy policy", isOn: $agreedToPrivacyPolicy)
                Toggle("Agree to emails", isOn: $agreedToEmails)
                Toggle("Agree to all", isOn: agreedToAll)
                Spacer()
            }
            .foregroundColor(.white)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
