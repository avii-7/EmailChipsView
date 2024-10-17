//
//  EditorView.swift
//  Chips
//
//  Created by Arun on 07/10/24.
//

import SwiftUI

struct EditorView: View {
    
    @State private var toEmails: [String] = ["bob@example.com", "jane@example.com", "growmore@example.com"]
    
    @State private var fromEmails: [String] = []
    
    @FocusState private var toEmailsFocus: Bool
    
    var body: some View {
            ScrollView {
                VStack (spacing: 10) {
                    
                    HStack (alignment: .top) {
                        Text("To")
                        EmailInputArea3(emails: $toEmails)
                    }
//                    HStack (alignment: .center) {
//                        Text("From")
//                        EmailInputArea3(emails: $fromEmails)
//                    }
//                    TextEditor(text: .constant(""))
//                        .background(.blue)
                }
//                .padding(.top, 100)
            }
            
        .navigationTitle("Compose")
        .padding()
    }
}

#Preview {
    EditorView()
}

/** Note
  1. We cannot use overlay/background to render chips becuase content is overflowing when chips expands beyound 1 line.
 */
