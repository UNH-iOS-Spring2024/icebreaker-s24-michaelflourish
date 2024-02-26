//
//  CreateAccountView.swift
//  FlexFlix
//
//  Created by Olanrewaju Afolayan on 2/21/24.
//

import SwiftUI

struct CreateAccountView: View {
    @State private var firstName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var lastName: String = ""
    @State private var phoneNumber: String = ""
    @State private var showSignIn = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("FLEXFLIX")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
                
                Text("Create Account")
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                
                TextField("Firstname", text: $firstName)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .padding(.bottom, 15)
                
                TextField("Lastname", text: $lastName)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .padding(.bottom, 15)
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .padding(.bottom, 15)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .padding(.bottom, 30)
                
                TextField("Phone Number", text: $phoneNumber)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .padding(.bottom, 15)
                
                Button("Create Account") {
                    // Handle account creation logic
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                
                NavigationLink(destination: SignInView(), isActive: $showSignIn) {
                    Button("Sign In") {
                        showSignIn = true
                    }
                    .frame(minWidth: 0, maxWidth: 80)
                    .padding()
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding(.horizontal, 30)
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
