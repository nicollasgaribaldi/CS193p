//
//  UtilityViews.swift
//  EmojiArt
//
//  Created by Nícollas Garibaldi on 11/01/24.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
        
    var body: some View {
        if uiImage != nil {
            Image(uiImage: uiImage!)
        }
    }
}

struct AnimatedActionButton: View {
    var title: String? = nil
    var systemImage: String? = nil
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            withAnimation {
                action()
            }
        }) {
            if let title = title, let systemImage = systemImage {
                Label(title, systemImage: systemImage)
            } else if let title = title {
                Text(title)
            } else if let systemImage = systemImage {
                Image(systemImage)
            } else {
                EmptyView() // Provide an EmptyView as a default case
            }
        }
    }
}


struct IdentifiableAlert: Identifiable {
    var id: String
    var alert: () -> Alert
}
