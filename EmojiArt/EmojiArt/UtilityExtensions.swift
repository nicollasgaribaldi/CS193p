//
//  UtilityExtensions.swift
//  EmojiArt
//
//  Created by Nícollas Garibaldi on 11/01/24.
//

import SwiftUI

extension Collection where Element: Identifiable {
    func index(matching element: Element) -> Self.Index? {
        firstIndex(where: { $0.id == element.id})
    }
}

extension RangeReplaceableCollection where Element: Identifiable {
    mutating func remove(_ element: Element) {
        if let index = index(matching: element) {
            remove(at: index)
        }
    }
    
    subscript(_ element: Element) -> Element {
        get {
            if let index = index(matching: element) {
                return self[index]
            } else {
                return element
            }
        }
        set {
            if let index = index(matching: element) {
                replaceSubrange(index...index, with: [newValue])
            }
        }
    }
}

extension Set where Element: Identifiable {
    mutating func toggleMembership(of element: Element) {
        if let index = index(matching: element) {
            remove(at: index)
        } else {
             insert(element)
        }
    }
}
