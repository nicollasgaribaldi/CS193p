//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Nícollas Garibaldi on 13/12/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
