//
//  PaletteManager.swift
//  EmojiArt
//
//  Created by Nícollas Garibaldi on 19/01/24.
//

import SwiftUI

struct PaletteManager: View {
    @EnvironmentObject var store: PaletteStore
    
    var body: some View {
            NavigationView {
            List {
                ForEach(store.palettes) { palette in
                    NavigationLink(destination: PaletteEditor(palette: $store.palettes[palette])) {
                        VStack(alignment: .leading) {
                            Text(palette.name)
                            Text(palette.emojis)
                        }
                    }
                }
            }
            .navigationTitle("Manage Palettes")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PaletteManager_Previews: PreviewProvider {
    static var previews: some View {
        PaletteManager()
            .previewDevice("iPhone 8")
            .environmentObject(PaletteStore(named: "Preview"))
    }
}
