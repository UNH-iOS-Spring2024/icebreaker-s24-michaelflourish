//
//  EmailVerifyView.swift
//  FlexFlix
//
//  Created by Olanrewaju Afolayan on 2/25/24.
//

import SwiftUI

struct EmailVerifyView: View {
    @State private var verificationCode: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("FLEXFLIX")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                Text("Email Verification")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                
                Text("Enter your email below to get verification code")
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                TextField("Enter your Email address", text: $verificationCode)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .padding(.horizontal)
                    .keyboardType(.numberPad)
                
                Button("Send") {
                    // Handle continue action
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(5.0)
                .padding(.top, 20)
                
                Button("Didn't get code, Send again") {
                    // Handle resend code action
                }
                .foregroundColor(.white)
                .padding()
                
                Spacer()
            }
        }
    }
}

struct EmailVerifyView_Previews: PreviewProvider {
    static var previews: some View {
        EmailVerifyView()
    }
}

