//
//  EnhancedTextField.swift
//  Chips
//
//  Created by Arun on 19/10/24.
//

import UIKit
import SwiftUI

struct EnhancedTextField : UIViewRepresentable {
    
    let placeholder: String
    @Binding var text: String
    var onBackspace: (() -> Void)? = nil
    var onSubmit: (() -> Void)? = nil
    
    func makeUIView(context: Context) -> CustomUITextField {
        let view = CustomUITextField()
        view.keyboardType = .emailAddress
        view.textContentType = .emailAddress
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        view.placeholder = placeholder
        view.onBackspacePress = onBackspace
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: CustomUITextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> EnhancedTextFieldCoordinator {
        EnhancedTextFieldCoordinator(text: $text, onSubmit: onSubmit)
    }
    
    class EnhancedTextFieldCoordinator: NSObject, UITextFieldDelegate {
        
        @Binding private var text: String
        
        private let onSubmit: (() -> Void)?
        
        init(text: Binding<String>, onSubmit: (() -> Void)? = nil) {
            self._text = text
            self.onSubmit = onSubmit
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let currentValue = textField.text as NSString? {
                let proposedValue = currentValue.replacingCharacters(in: range, with: string)
                text = proposedValue
            }
            return true
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            onSubmit?()
            return true
        }
    }
}

#Preview {
    EnhancedTextField(placeholder: "Enter your email", text: .constant(""), onSubmit:  {
        print("Backspace pressed")
    })
}
