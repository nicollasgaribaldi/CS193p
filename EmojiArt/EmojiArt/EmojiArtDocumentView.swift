//
//  ContentView.swift
//  EmojiArt
//
//  Created by Nícollas Garibaldi on 11/01/24.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    @ObservedObject var document: EmojiArtDocument
    
    let defaultEmojiFontSize: CGFloat = 40
    
    var body: some View {
        VStack(spacing: 0) {
            documentBody
            pallete
        }
    }
    
    var documentBody: some View {
        GeometryReader { geometry in
            ZStack {
                Color.yellow
                ForEach(document.emojis) { emoji in
                    Text(emoji.text)
                        .font(.system(size: fontSize(for: emoji)))
                        .position(position(for: emoji, in: geometry))
                }
            }
            .onDrop(of: [.plainText], isTargeted: nil) { providers, location in
                return drop(providers: providers, at: location)
            }
        }
    }
    
    private func drop(providers: [NSItemProvider], at location: CGPoint) -> Bool {
        return providers.loadObjects(ofType: String.self) { String in
            if let emoji = string.first, emoji.isEmoji {
                
            }
            document.addEmoji(emoji, at: convertToEmojiCoordenates(location), size: defaultEmojiFontSize)
        }
    }
    
    private func position(for emoji: EmojiArtModel.Emoji, in geometry: GeometryProxy ) -> CGPoint {
        convertFromEmojiCoordenates((emoji.x, emoji.y), in: geometry)
    }
    
    private func convertFromEmojiCoordenates(_ location: (x: Int, y: Int), in geometry: GeometryProxy ) -> CGPoint {
        let center = CGPoint(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
        return CGPoint(
            x: center.x + CGFloat(location.x),
            y: center.y + CGFloat(location.y)
        )
    }
    
    private func fontSize(for emoji: EmojiArtModel.Emoji) -> CGFloat {
        CGFloat(emoji.size)
    }
    
    var pallete: some View {
        ScrollingEmojisView(emojis: testEmojis)
            .font(.system(size: defaultEmojiFontSize))
    }
    
    let testEmojis = "😀🥲🐶🐻‍❄️🍏🍓⚽️🥏🚗🚒⌚️🖲❤️🤎🏳️🇦🇫🤣😌🐼🐸🍇🥥🏉🥍🚑🦽🖱📼🤍💓🇺🇳🇦🇮😁😇🐹"
}

struct ScrollingEmojisView: View {
    let emojis: String
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(emojis.map { String($0) }, id: \.self) { emoji in
                    Text(emoji)
                        .onDrag { NSItemProvider(object: emoji as NSString) }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiArtDocumentView(document: EmojiArtDocument())
    }
}
