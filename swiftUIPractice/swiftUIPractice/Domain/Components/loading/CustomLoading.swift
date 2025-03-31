//
//  CustomLoading.swift
//  swiftUIPractice
//
//  Created by bayteq on 7/10/24.
//

import Foundation


import SwiftUI

struct CustomLoading: View {
    // MARK: - Properties
    @State private var degree:Int = 270
    @State private var spinnerLength = 0.6
    
    // MARK: - Body
    var body: some View {
        Circle()
            .trim(from: 0.0, to: spinnerLength)
            .stroke(
                LinearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing),
                style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: .round)
            )
            .frame(width: 60, height: 60)
            .rotationEffect(Angle(degrees: Double(degree)))
            .onAppear {
                withAnimation(Animation.easeIn(duration: 1.5).repeatForever(autoreverses: true)) {
                    spinnerLength = 0 // Start spinner animation
                }
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                    degree = 270 + 360 // Start rotation animation
                }
            }

    }
}
