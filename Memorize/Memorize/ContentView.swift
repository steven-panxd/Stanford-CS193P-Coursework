//
//  ContentView.swift
//  Memorize
//
//  Created by Steven Pan on 10/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}


struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack (content: {
            if (isFaceUp) {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(style: StrokeStyle(lineWidth: 2))
                Text("👻")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        })
    }
}









#Preview {
    ContentView()
}
