//
//  EmailTextField.swift
//  Chips
//
//  Created by Arun on 19/10/24.
//

import SwiftUI

struct EmailTextField: View {
    
    @Binding private var text: String
    
    @FocusState private var isTextFieldFocused: Bool
    
    init(text: Binding<String>, isTextFieldFocused: FocusState<Bool>) {
        self._text = text
        self._isTextFieldFocused = isTextFieldFocused
    }
    
    var body: some View {
        TextField("", text: $text)
            .focused($isTextFieldFocused)
            .textInputAutocapitalization(.never)
            .textContentType(.emailAddress)
            .keyboardType(.emailAddress)
            .autocorrectionDisabled()
            .padding(.trailing, 15)
            .padding(.vertical, 6)
            .background(
                Capsule().fill(Color.clear)
            )
    }
}

#Preview {
    EmailTextField(text: .constant(""), isTextFieldFocused: .init())
}
