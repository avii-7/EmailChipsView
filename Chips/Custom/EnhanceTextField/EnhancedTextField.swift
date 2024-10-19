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
    
    func makeUIView(context: Context) -> CustomUITextField {
        let view = CustomUITextField()
        view.placeholder = placeholder
        view.onBackspacePress = onBackspace
        view.delegate = context.coordinator
        return view
      }
    
    func updateUIView(_ uiView: CustomUITextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> EnhancedTextFieldCoordinator {
        EnhancedTextFieldCoordinator(text: $text)
    }
    
    class EnhancedTextFieldCoordinator: NSObject, UITextFieldDelegate {
        
        private let text: Binding<String>
        
        init(text: Binding<String>) {
            self.text = text
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            text.wrappedValue = textField.text ?? ""
            return true
        }
    }
}

#Preview {
    EnhancedTextField(placeholder: "Enter your email", text: .constant("")) {
        print("Backspace pressed")
    }
}
