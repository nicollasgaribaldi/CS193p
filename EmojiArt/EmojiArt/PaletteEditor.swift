//
//  PaletteEditor.swift
//  EmojiArt
//
//  Created by Nícollas Garibaldi on 16/01/24.
//

import SwiftUI

struct PaletteEditor: View {
    @State private var palette: Palette = PaletteStore(named: "test").palette(at: 2)
    
    var body: some View {
        TextField("Name",text: $palette.name)
    }
}

struct PaletteEditor_Previews: PreviewProvider {
    static var previews: some View {
        PaletteEditor()
    }
}
