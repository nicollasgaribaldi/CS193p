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

extension CGSize: RawRepresentable {
    private static let rawValueSeparator = ":"
    
    public var rawValue: String {
        "\(width)\(CGSize.rawValueSeparator)\(height)"
    }
    public init?(rawValue: String) {
        let values = rawValue.components(separatedBy: CGSize.rawValueSeparator)
        if values.count == 2, let width = Double(values.first!), let height = Double(values.last!) {
            self.init(width: width, height: height)
        } else {
            return nil
        }
    }
}

extension CGFloat: RawRepresentable {
    public var rawValue: String {
        description
    }
    public init?(rawValue: String) {
        if let doubleValue = Double(rawValue) {
            self.init(doubleValue)
        } else{
            return nil
        }
    }
}

extension Array where Element == NSItemProvider {
    func loadObjects<T>(ofType theType: T.Type, firstOnly: Bool = false, using load: @escaping (T) -> Void) -> Bool where T: NSItemProviderReading {
        if let provider = first(where: { S0.canLoadObject(ofClass: theType) }) {
            provider.loadObject(ofClass: theType) { object, error in
                if let value = object as? T {
                    DispatchQueue.main.async {
                        load(value)
                    }
                }
            }
            return true
        }
        return false
    }
    func loadObjects<T>(ofType theType: T.Type, firstOnly: Bool = false, using load: @escaping (T) -> Void) -> Bool where T: _ObjectiveCBridgeable, T._ObjectiveCType: NSItemProviderReading {
        if let provider = first(where: { S0.canLoadObject(ofClass: theType) }) {
            let _ = provider.loadObject(ofClass: theType) { object, error in
                if let value = object {
                    DispatchQueue.main.async {
                        load(value)
                    }
                }
            }
            return true
        }
        return false
    }
    func loadFirstObjects<T>(ofType theType: T.Type, firstOnly: Bool = false, using load: @escaping (T) -> Void) -> Bool where T: NSItemProviderReading {
        loadObjects(ofType: theType, firstOnly: true, using: load)
    }
    func loadFirstObjects<T>(ofType theType: T.Type, firstOnly: Bool = false, using load: @escaping (T) -> Void) -> Bool where T: _ObjectiveCBridgeable, T._ObjectiveCType: NSItemProviderReading {
            loadObjects(ofType: theType, firstOnly: true, using: load)
    }
}
