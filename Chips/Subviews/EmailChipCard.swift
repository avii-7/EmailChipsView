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
                .lineLimit(1)
                .fontWeight(.semibold)
            Button {
                onDelete(email)
            } label: {
                Image(systemName: "xmark.circle")
            }
        }
        .foregroundColor(.blue)
        .padding(.horizontal, 15)
        .padding(.vertical, 6)
        .background(
            Capsule()
                .stroke(.blue, style: StrokeStyle(lineWidth: 1.5))
                .background(Capsule().fill(.blue.opacity(0.05)))
        )
    }
}

#Preview {
    EmailChipCard(email: "kumar.arun.ynr@gmail.com") { item in
        print("remove chip card")
    }
}
