//
//  EnhancedTextField+UITextField.swift
//  Chips
//
//  Created by Arun on 19/10/24.
//

import UIKit

extension EnhancedTextField {
    
    class CustomUITextField: UITextField {
        var onBackspacePress: (() -> Void)?
        
        override func deleteBackward() {
            onBackspacePress?()
            super.deleteBackward()
        }
    }
}
