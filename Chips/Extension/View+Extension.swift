//
//  View+Extension.swift
//  Chips
//
//  Created by Arun Kumar on 16/10/24.
//

import SwiftUI

struct SizePreferenceKey: PreferenceKey {
    
    static var defaultValue = CGSize.zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) { }
}

extension View {
    
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background {
            GeometryReader { geo in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geo.size)
            }
        }
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}
