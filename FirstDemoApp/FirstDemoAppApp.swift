//
//  FirstDemoAppApp.swift
//  FirstDemoApp
//
//  Created by Olanrewaju Afolayan on 2/18/24.
//

import SwiftUI
import Firebase

@main
struct FirstDemoAppApp: App {
    init(){
        let providerfactory = AppCheckDebugProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerfactory)
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
