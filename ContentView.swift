//
//  ContentView.swift
//  FlexFlix
//
//  Created by Olanrewaju Afolayan on 2/21/24.
//

import SwiftUI

struct ContentView: View {
    
    private let swipeableTexts = [
        "Stream on your phone, tablet, laptop and TV",
        "Enjoy a wide range of genres from comedy to drama, kids to classics",
        "Create a FlexFlix account and more at an affordable price"
    ]
    
    @State private var showSignIn = false
    @State private var showSignUp = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    
                    Image("thumbnailImage") // Would add an image later
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 200)

                    TabView {
                        ForEach(swipeableTexts, id: \.self) { text in
                            Text(text)
                                .font(.title)
                                .multilineTextAlignment(.center)
                                .padding()
                                .foregroundColor(.white)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 200)
                    
                    NavigationLink(destination: CreateAccountView(), isActive: $showSignUp) {
                        Button("Sign Up") {
                            showSignUp = true
                        }
                        .frame(minWidth: 0, maxWidth: 100)
                        .padding()
                        .background(Color.gray.opacity(0.5))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                
                    }
                    .padding(.horizontal)

                    Spacer()

                    NavigationLink(destination: SignInView(), isActive: $showSignIn) {
                        Button("Sign In") {
                            showSignIn = true
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
                        .background(Color.green)
                        .cornerRadius(10)
                    }
                    .padding(.bottom)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

