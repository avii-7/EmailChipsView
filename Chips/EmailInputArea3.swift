//
//  EmailInputArea3.swift
//  Chips
//
//  Created by Arun on 07/10/24.
//

import SwiftUI

struct EmailInputArea3: View {
    
    private static let textField = "textField"
    
    @Binding private var emails: [String]
    
    @State private var text = ""
    
    @FocusState private var isTextFieldFocused: Bool
    
    @State private var geometryWidth: CGFloat = .zero
    
    init(emails: Binding<[String]>) {
        _emails = emails
    }
    
    var body: some View {
        childView
            .readSize { size in
                geometryWidth = size.width
                print("NOKI Above", geometryWidth)
            }
        //.fixedSize(horizontal: false, vertical: true)
        
    }
}

extension EmailInputArea3 {
    
    private var childView: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        return ZStack (alignment: .topLeading) {
            ForEach(0...emails.count, id: \.self) { index in
                if index == emails.count {
                    TextField("Enter your email", text: $text)
                        .background(.green)
                        .padding(.top, 10)
                        .padding(.leading, 5)
                        .textInputAutocapitalization(.never)
                        .fixedSize()
                        .alignmentGuide(.leading) { dimension in
                            if (width + dimension.width > geometryWidth) {
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
                            appendEnteredEmail()
                            text = ""
                        }
                        .onAppear {
                            isTextFieldFocused = true
                        }
                }
                else {
                    EmailChipCard(email: emails[index]) { item in
                        removeEmail(email: emails[index])
                    }
                    .padding(5)
                    .alignmentGuide(.leading) { dimension in
                        if (width + dimension.width >  geometryWidth) {
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
        .background(.orange)
        .frame(maxWidth: .infinity, alignment: .leading)
        .focused($isTextFieldFocused)
    }
}

extension EmailInputArea3 {
    
    private func appendEnteredEmail() {
        emails.append(text)
    }
    
    private func removeEmail(email: String) {
        emails.removeAll { $0 == email }
    }
}

#Preview {
    EmailInputArea3(emails: .constant(["arun1235@example.com", ""]))
}
