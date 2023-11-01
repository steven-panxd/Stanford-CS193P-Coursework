//
//  ContentView.swift
//  Memorize
//
//  Created by Steven Pan on 10/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: false)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}


struct CardView: View {
    @State var isFaceUp: Bool = true
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        
        ZStack {
            if (isFaceUp) {
                base.foregroundColor(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 2))
                Text("👻").font(.largeTitle)
            } else {
                base.fill() // fill is the default
            }
        }.onTapGesture() {
            self.isFaceUp.toggle()
        }
    }
}









#Preview {
    ContentView()
}
