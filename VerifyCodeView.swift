//
//  VerifyCodeView.swift
//  FlexFlix
//
//  Created by Olanrewaju Afolayan on 2/21/24.
//

import SwiftUI

struct VerifyCodeView: View {
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
                
                Text("Enter Verification Code")
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                
                Text("Enter the code sent to your email")
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                TextField("Verification Code", text: $verificationCode)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .padding(.horizontal)
                    .keyboardType(.numberPad)
                
                Button("Continue") {
                   
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

struct VerifyCodeView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyCodeView()
    }
}

