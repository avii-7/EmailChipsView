//
//  EmailInputArea.swift
//  Chips
//
//  Created by YourName on 07/10/24.
//

import SwiftUI

/** Important Notes
 * Make sure while adjusting padding, font size etc you adjust in both views (ChipCard and TextField)
 *
 */

struct EmailInputArea: View {
    
    @Binding private var emails: [String]
    
    @State private var text = ""
    
    @FocusState private var isTextFieldFocused: Bool
    
    @State private var geometryWidth: CGFloat = .zero
    
    init(emails: Binding<[String]>) {
        _emails = emails
    }
    
    var body: some View {
        childView
            .padding(.top, 1)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .readSize { size in
                geometryWidth = size.width
            }
        // Empty background so that tap gesture keep on working.
            .background()
            .onTapGesture {
                isTextFieldFocused = true
            }
    }
}

extension EmailInputArea {
    
    private var childView: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack (alignment: .topLeading) {
            ForEach(emails.indices, id: \.self) { index in
                
                EmailChipCard(email: emails[index]) { _ in
                    removeEmail(email: emails[index])
                }
                .padding(.horizontal, 5)
                .padding(.bottom, 7)
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
            
            EnhancedTextField(placeholder: "", text: $text, onBackspace: {
                removeLastChipCard()
            }, onSubmit: {
                appendEnteredEmail()
                text = ""
                isTextFieldFocused = true
            })
            .focused($isTextFieldFocused)
            .padding(.trailing, 10)
            .padding(.vertical, 6)
            .background(
                Capsule().fill(Color.clear)
            )
            .padding(.horizontal, 5)
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
        }
    }
}

extension EmailInputArea {
    
    private func appendEnteredEmail() {
        emails.append(text)
    }
    
    private func removeEmail(email: String) {
        withAnimation {
            if let index = emails.firstIndex(of: email) {
                emails.remove(at: index)
            }
        }
    }
    
    private func removeLastChipCard() {
        if
            text.isEmpty,
            emails.isEmpty == false {
            emails.removeLast()
        }
    }
}

#Preview {
    EmailInputArea(emails: .constant(["bob@example.com","alice@example.com"]))
        .padding(.horizontal)
}
