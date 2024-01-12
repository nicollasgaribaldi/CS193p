//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Nícollas Garibaldi on 11/01/24.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    let document = EmojiArtDocument()
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: document)
        }
    }
}
