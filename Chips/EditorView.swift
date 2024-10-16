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
    
    var body: some View {
        VStack {
            HStack (alignment: .top) {
                Text("To")
                EmailInputArea3(emails: $toEmails)
            }
            .padding(.vertical)
            .background(.yellow)
        }
    }
}

#Preview {
    EditorView()
}

/** Note
  1. We cannot use overlay/background to render chips becuase content is overflowing when chips expands beyound 1 line.
 */
