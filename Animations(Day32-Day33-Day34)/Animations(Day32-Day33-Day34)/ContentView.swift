//
//  ContentView.swift
//  Animations(Day32-Day33-Day34)
//
//  Created by Alex Boisseau on 26/12/2021.
//

import SwiftUI

struct ContentView: View {
    let letters = Array("Hello SwiftUI")
    @State private var dragAmount = CGSize.zero
    @State private var enabled = false
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { index in
                Text(String(letters[index]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.default.delay(Double(index) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged {
                    dragAmount = $0.translation
                }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
