//
//  EditorView.swift
//  Chips
//
//  Created by Arun on 07/10/24.
//

import SwiftUI

struct EditorView: View {
    
    @State private var toEmails = [String]()
    
//    @State private var toEmails = ["arun.k@gmail.com", "jass.jj@gmail.com", "nice@gmail.com"]
    
    @State private var text: String = "Once there was a crow"
    
    @FocusState private var toEmailsFocus: Bool
    
    var body: some View {
        ScrollView {
            HStack (alignment: .center) {
                Text("To")
                EmailInputArea(emails: $toEmails)
            }
            TextEditor(text: $text)
                .frame(maxWidth: .infinity, minHeight: 40)
                .background(.green)
        }
        .navigationTitle("Compose")
        .padding()
    }
}

#Preview {
    NavigationStack {
        EditorView()
    }
}

/** Note
 1. We cannot use overlay/background to render chips becuase content is overflowing when chips expands beyound 1 line.
 */
