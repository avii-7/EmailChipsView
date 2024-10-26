//
//  EditorView.swift
//  Chips
//
//  Created by Arun on 07/10/24.
//

import SwiftUI

struct EditorView: View {
    
    @State private var toEmails = [String]()
    
    @State private var text: String = "Once there was a crow"
    
    @FocusState private var toEmailsFocus: Bool
    
    var body: some View {
        ScrollView {
            HStack (alignment: .top) {
                Text("To")
                    .font(.subheadline.weight(.medium))
                    .padding(.top, 7)
                    .foregroundStyle(.gray)
                EmailInputArea(emails: $toEmails)
            }
            
            Divider()
            
            TextEditor(text: $text)
                .frame(maxWidth: .infinity, minHeight: 100)
                .background(.green)
        }
        .navigationTitle("Chip View")
        .padding()
    }
}

#Preview {
    NavigationStack {
        EditorView()
    }
}
