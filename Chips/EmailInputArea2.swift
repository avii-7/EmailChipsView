//
//  EmailInputArea2.swift
//  Chips
//
//  Created by Arun on 06/10/24.
//

import SwiftUI

struct EmailInputArea2: View {
    
    private static let textField = "textField"
    
    @State private var emails = ["arun.k@g.com", "jass.k@gil.com", "navi.256@gmail.com", textField]
    
    @State private var text = ""
    
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        GeometryReader { geometry in
            ZStack (alignment: .topLeading) {
                ForEach(emails, id: \.self) { email in
                    if email == Self.textField {
                        TextField("Enter your email", text: $text)
                            .background(.red)
                            .fixedSize()
                            .background(.green)
                            .padding(.top, 10)
                            .padding(.leading, 5)
                            .textInputAutocapitalization(.never)
                            .alignmentGuide(.leading) { dimension in
                                if (width + dimension.width > geometry.size.width) {
                                    width = 0
                                    height += dimension.height
                                }
                                let result = width
                                width = 0
                                return -result
                            }
                            .alignmentGuide(.top) { dimension in
                                let result = height
                                height = 0
                                return -result
                            }
                            .focused($isTextFieldFocused)
                            .onSubmit {
                                emails.insert(text, at: emails.count - 1)
                                text = ""
                                isTextFieldFocused = true
                            }
                    }
                    else {
                        EmailChipCard(email: email) { item in
                            emails.removeAll { $0 == item }
                        }
                            .padding(5)
                            .alignmentGuide(.leading) { dimension in
                                if (width + dimension.width > geometry.size.width) {
                                    width = 0
                                    height += dimension.height
                                }
                                let result = width
                                width += dimension.width
                                return -result
                            }
                            .alignmentGuide(.top) { dimension in
                                let result = height
                                return -result
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    EmailInputArea2()
}
