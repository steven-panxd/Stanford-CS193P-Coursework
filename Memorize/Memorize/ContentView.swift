//
//  ContentView.swift
//  Memorize
//
//  Created by Steven Pan on 10/25/23.
//

import SwiftUI

struct ContentView: View {
//    let emojis: [String] = ["👻", "🎃", "🕷️", "😈"]
    let emojis: Array<String> = ["👻", "🎃", "🕷️", "😈"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) {
                index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}


struct CardView: View {
    let content: String;
    @State var isFaceUp: Bool = true
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        
        ZStack {
            if (isFaceUp) {
                base.foregroundColor(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 2))
                Text(self.content).font(.largeTitle)
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
