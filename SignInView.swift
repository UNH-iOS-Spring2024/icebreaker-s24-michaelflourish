//
//  SignInView.swift
//  FlexFlix
//
//  Created by Olanrewaju Afolayan on 2/21/24.
//

import SwiftUI

struct SignInView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State public var showSignIn = false
    @State public var showSignUp = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 15) {
                Text("FLEXFLIX")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.bottom, 50)
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .padding(.bottom, 10)
                
                HStack {
                    Spacer()
                    Button("Forget Password", action: {
                       
                    }).foregroundColor(.white)
                }
                
                Button(action: {
                   
                }) {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(5.0)
                }
                .padding(.top, 20)
                
                Spacer()
                
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.white)
                    
                    NavigationLink(destination: CreateAccountView(), isActive: $showSignUp) {
                        Button("Sign Up") {
                            showSignUp = true
                        }
                        .frame(minWidth: 0, maxWidth: 80)
                        .padding()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.horizontal, 30)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

