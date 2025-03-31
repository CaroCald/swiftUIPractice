//
//  CustomAlert.swift
//  swiftUIPractice
//
//  Created by bayteq on 7/10/24.
//

import SwiftUI

struct CustomAlert: View {
    @State private var showingAlert = false

    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
        }
    }
}
