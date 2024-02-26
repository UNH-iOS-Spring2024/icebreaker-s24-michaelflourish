//
//  ReviewAppView.swift
//  FlexFlix
//
//  Created by Olanrewaju Afolayan on 2/24/24.
//

import SwiftUI

struct ReviewAppView: View {
    var body: some View {
        TabView {
            SignInView()
                .tabItem {
                    Label("Sign In", systemImage: "person.fill")
                }
            
            WatchView()
                .tabItem {
                    Label("Watch", systemImage: "tv.fill")
                }
            
            SignUpView()
                .tabItem {
                    Label("Sign Up", systemImage: "person.badge.plus.fill")
                }
        }
    }
}

struct SignInView: View {
    var body: some View {
        VStack {
            Text("Sign In View Content")
            // Add your sign-in UI components here
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .ignoresSafeArea()
    }
}

struct WatchView: View {
    var body: some View {
        VStack {
            Text("Watch View Content")
            // Add your watching UI components here
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .ignoresSafeArea()
    }
}

struct SignUpView: View {
    var body: some View {
        VStack {
            Text("Sign Up View Content")
            // Add your sign-up UI components here
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .ignoresSafeArea()
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ReviewAppView()
        }
    }
}
