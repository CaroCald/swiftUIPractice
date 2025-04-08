

//
//  ContentView.swift
//  swiftUIPractice
//
//  Created by Carolina Calderon on 28/7/24.
//

import SwiftUI

struct AuthView: View {
    @StateObject var viewModel = AuthViewModel(accountService: AccountRepository(authenticationUseCase: AuthenticationUseCase(service: FirebaseServiceImpl())))

       @State private var email: String = "" // Declare a separate @State for email
       @State private var password: String = "" // Declare a separate @State for password

    
    
    var body: some View {
        NavigationStack { // Wrap the content in a NavigationView for navigation
                  VStack {
                      CustomText(text: "Bienvenido")
                      
                      CustomTextField(icon: "person", placeHolder: "Email", text: $email).padding(10) // Bind the email @State
                      
                      CustomTextField(icon: "lock", placeHolder: "Password", text: $password) .padding(10) // Bind the password @State
                      
                      CustomButton(label: "Ingresar") {
                          viewModel.login(email: email, password: password) // Pass the email and password to viewModel.login
                      }
                      .padding(10)
                      
                      if let error = viewModel.errorMessage {
                          Text(error)
                              .foregroundColor(.red)
                              .multilineTextAlignment(.center)
                      }
                      
                      // Show a success message if logged in
                      if viewModel.isLoggedIn {
                          Text("Logged in as \(viewModel.user?.email ?? "Unknown")")
                      }
                      
                      // Use NavigationLink with value: to navigate when user is logged in
                                    NavigationLink(value: viewModel.isLoggedIn) {
                                        HomeView() // You can use an empty view to trigger the navigation automatically
                                    }
                                    .navigationDestination(for: Bool.self) { _ in
                                        HomeView() // Replace `HomeView` with your desired destination view
                                    }
                  }
                  .frame(maxWidth: .infinity, maxHeight: .infinity)
                  .background(Color.black) // Set the background color here
                  .foregroundColor(.black) // Optional: Set text color to white for contrast
                  .edgesIgnoringSafeArea(.all)
              }
          }
}

#Preview {
    AuthView()
}
