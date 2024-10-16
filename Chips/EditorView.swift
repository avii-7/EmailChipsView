//
//  EditorView.swift
//  Chips
//
//  Created by Arun on 07/10/24.
//

import SwiftUI

struct EditorView: View {
    
    @State private var toEmails: [String] = []
    
    @FocusState private var toEmailsFocus: Bool
    
    @State private var text = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("To")
                GeometryReader { geo in
                    EmailInputArea3(geometryWidth: geo.size.width, emails: $toEmails)
                }
                .padding(.vertical)
            }
            
            
            //            TextEditor(text: $text)
            //                .background(.blue)
        }
    }
}

#Preview {
    EditorView()
}
