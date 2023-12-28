//
//  MemoryGame.swift
//  Memorize
//
//  Created by Nícollas Garibaldi on 26/12/23.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
