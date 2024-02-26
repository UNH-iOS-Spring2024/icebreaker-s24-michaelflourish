//
//  ReviewView.swift
//  FlexFlix
//
//  Created by Olanrewaju Afolayan on 2/24/24.
//

import SwiftUI

struct ReviewView: View {
    // Define the state to keep track of which text is currently selected
    @State private var selectedTextIndex = 0
    
    let textOptions = ["Home", "Away From Home", "Watch African Movies"]
    
    var body: some View {
        VStack {
            Image("YourImageName") // Replace with your actual image name
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding(.top)
            
            // Swappable text views
            TabView(selection: $selectedTextIndex) {
                ForEach(0..<textOptions.count, id: \.self) { index in
                    Text(textOptions[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(height: 100)
            .padding()
            
            // Sign Up and Sign In buttons
            VStack {
                Button("Sign Up") {
                    // Handle sign up action
                }
                .padding()
                
                Button("Sign In") {
                    // Handle sign in action
                }
                .padding()
                .buttonStyle(PrimaryButtonStyle())
            }
            
            Spacer()
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.blue]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
}

// Custom button style
struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
    }
}
