//
//  HomePageView.swift
//  FlexFlix
//
//  Created by Olanrewaju Afolayan on 2/21/24.
//

import SwiftUI


struct HomePageView: View {
    @State private var showText = false
    @State private var navigateToContent = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            if !navigateToContent {
                Text("FLEXFLIX")
                    .font(.custom("iFont", size: 40))
                    .foregroundColor(.white)
                    .padding()
                    .opacity(showText ? 1 : 0)
                    .scaleEffect(showText ? 1 : 0.1)
                    .onAppear {
                        withAnimation(Animation.easeIn(duration: 2.0)) {
                            self.showText = true
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            self.navigateToContent = true
                        }
                    }
            } else {
                
                ContentView()
            }
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
