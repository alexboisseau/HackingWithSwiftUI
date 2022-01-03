//
//  ContentView.swift
//  Animations(Day32-Day33-Day34)
//
//  Created by Alex Boisseau on 26/12/2021.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    @State private var isShowingRectangle = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
                
            if isShowingRectangle {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                print(isShowingRectangle)
                isShowingRectangle.toggle()
                print(isShowingRectangle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
