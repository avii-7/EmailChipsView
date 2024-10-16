//
//  EmailInputArea3.swift
//  Chips
//
//  Created by Arun on 07/10/24.
//

import SwiftUI

struct EmailInputArea3: View {
    
    @Binding private var emails: [String]
    
    @State private var text = ""
    
    @FocusState private var isTextFieldFocused: Bool
    
    @State private var geometryWidth: CGFloat = .zero
    
    init(emails: Binding<[String]>) {
        _emails = emails
    }
    
    var body: some View {
        childView
            .onTapGesture {
                isTextFieldFocused = true
            }
            .readSize { size in
                geometryWidth = size.width
            }
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
                        .focused($isTextFieldFocused)
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
                        .onSubmit {
                            appendEnteredEmail()
                            text = ""
                        }
                }
                else {
                    EmailChipCard(email: emails[index]) { _ in
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
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.orange)
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
