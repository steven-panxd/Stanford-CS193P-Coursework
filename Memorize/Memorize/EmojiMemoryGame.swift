//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Steven Pan on 11/5/23.
//
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "👽", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 16) {
            pairIndex in
            if emojis.indices.contains(pairIndex) {
                // return EmojiMemoryGame.emojis[pairIndex]
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
            
        }
    }
    
    // var objectWillChange: ObservableObjectPublisher
    
    // private var model = EmojiMemoryGame.createMemoryGame()
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: Intent functions
    
    func shuffle() {
        self.model.shuffle()
        // objectWillChange.send()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        self.model.choose(card)
    }
}
