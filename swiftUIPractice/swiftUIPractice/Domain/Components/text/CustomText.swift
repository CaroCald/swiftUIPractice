//
//  CustomText.swift
//  swiftUIPractice
//
//  Created by bayteq on 7/10/24.
//

import Foundation
import SwiftUI
struct CustomText: View {
    let text: String
    let colorCustom: Color
    let customFont: Font
    let customAlignment: TextAlignment
    
    init(
        text: String,
        colorCustom: Color?  = nil,
        customFont: Font?  = nil,
        customAlignment: TextAlignment? = nil
       
    ) {
        self.text = text
        self.colorCustom = colorCustom ?? Color.white
        self.customFont = customFont ?? Font.title
        self.customAlignment = customAlignment ?? TextAlignment.center
    }

  var body: some View {
      Text(text)
        .foregroundStyle(colorCustom)
        .font(customFont)
        .multilineTextAlignment(customAlignment)
  }
}
