//
//  EmailChipCard.swift
//  ZunuMailApp
//
//  Created by Igneta-Ziroh on 20/09/24.
//

import SwiftUI

struct EmailChipCard: View {
    
    let email: String
    
    let onDelete: (String) -> Void
    
    var body: some View {
        HStack {
            Text(email)
                .foregroundColor(.black)
                .lineLimit(1)
            Button {
                onDelete(email)
            } label: {
                Image(systemName: "xmark.circle")
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 6)
        .background(
            Capsule()
                .stroke(.white, style: StrokeStyle(lineWidth: 1))
                .background(Capsule().fill(.blue))
        )
    }
}

#Preview {
    EmailChipCard(email: "arunmehra1999@gmail.com") { item in
        print("remove chip card")
    }
}
