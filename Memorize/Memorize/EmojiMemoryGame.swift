//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Nícollas Garibaldi on 26/12/23.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String>
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
