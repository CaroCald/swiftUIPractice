//
//  CustomButton.swift
//  swiftUIPractice
//
//  Created by bayteq on 7/10/24.
//

import SwiftUI

struct ButtonView: View {
    let icon: String?
    let label: String
    let action: () -> Void
    
    init(
        label: String,
        icon: String? = nil,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.icon = icon
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 8) {
                if let icon {
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                }
                CustomText(text:label)
            }
            .font(.title2)
            .padding(.vertical, 12)
            .foregroundColor(Color.purple)
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.purple, lineWidth: 2.0)
                  .background {
                      RoundedRectangle(cornerRadius: 12)
                          .fill(Color.purple.opacity(0.2))
                  }
            }
        }
    }
}
