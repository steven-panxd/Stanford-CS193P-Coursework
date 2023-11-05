//
//  ContentView.swift
//  Memorize
//
//  Created by Steven Pan on 10/25/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame
    
//    let halloweenEmojis: Array<String> = ["👻", "🎃", "🕷️", "😈", "👽", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
//    let vehicleEmojis: Array<String> = ["✈️", "🚀", "🚗", "🛵", "🚜", "🚁", "🚤", "🚒", "🚓", "🚄", "🛳️", "🚖"]
//    let faceEmojis: Array<String> = ["😀", "😲", "🤢", "☺️", "😇", "🙃", "🥰", "😡", "😢", "🤬", "🥵", "🤧"]
        let halloweenEmojis: Array<String> = ["👻", "🎃", "🕷️", "😈", "👽"]
        let vehicleEmojis: Array<String> = ["✈️", "🚀", "🚗", "🛵", "🚜"]
        let faceEmojis: Array<String> = ["😀", "😲", "🤢", "☺️", "😇"]
    
    @State var emojis: Array<String> = []
    @State var currentThemeName = themeNames.halloween
    @State var themeColor = Color.orange
    @State var cardCount = 0
    
    
    var cardWidth: CGFloat {
        CGFloat(60 - (Double(cardCount) / 2.5))
    }

    enum themeNames {
        case halloween
        case vehicle
        case face
    }
    
    var body: some View {
        VStack{
            title
            ScrollView {
                cards
            }
            Spacer()
            ThemeSwichers
        }
        .padding()
    }
    
    var title: some View {
        Text("Memorize!").font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: self.cardWidth))]) {
            ForEach(0..<self.emojis.count, id: \.self) {
                index in
                CardView(content: self.emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundColor(self.themeColor)
    }
    
    
    var ThemeSwichers: some View {
        HStack(spacing: 15) {
            halloweenThemeSwicher
            vehicleThemeSwicher
            faceThemeSwicher
        }
        .imageScale(.large)
    }
    
    func themeSwicher(themeName: themeNames, symbol: String, text: String) -> some View {
        return Button(action: {
            self.emojis.removeAll()  // remove all existing emojis
            self.cardCount = 0
            
            switch themeName {
            case .face:
                for item: String in self.faceEmojis {
                    for _ in 0..<Int.random(in: 2...4) {
                        self.emojis += [item, item]
                        self.cardCount += 2
                    }
                }
                self.themeColor = Color.yellow
            case .vehicle:
                for item: String in self.vehicleEmojis {
                    for _ in 0..<Int.random(in: 2...4) {
                        self.emojis += [item, item]
                        self.cardCount += 2
                    }
                }
                self.themeColor = Color.red
            default:
                for item: String in self.halloweenEmojis {
                    for _ in 0..<Int.random(in: 2...4) {
                        self.emojis += [item, item]
                        self.cardCount += 2
                    }
                }
                self.themeColor = Color.orange
            }
            
            self.emojis.shuffle()
        }, label: {
            VStack(alignment: .center) {
                Image(systemName: symbol)
                Text(text)
            }
        })
    }
    
    var halloweenThemeSwicher: some View {
        themeSwicher(themeName: .halloween, symbol: "moon", text: "Halloween")
    }
    
    var vehicleThemeSwicher: some View {
        themeSwicher(themeName: .vehicle, symbol: "car", text: "Vehicle")
    }
    
    var faceThemeSwicher: some View {
        themeSwicher(themeName: .face, symbol: "face.smiling", text: "Face")
    }
}


struct CardView: View {
    let content: String;
    @State var isFaceUp: Bool = true
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        
        ZStack {
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 2))
                Text(self.content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }.onTapGesture() {
            self.isFaceUp.toggle()
        }
    }
}









#Preview {
    EmojiMemoryGameView()
}
