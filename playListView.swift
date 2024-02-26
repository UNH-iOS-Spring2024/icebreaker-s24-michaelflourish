//
//  playListView.swift
//  FlexFlix
//
//  Created by Olanrewaju Afolayan on 2/25/24.
//

import SwiftUI

struct playListView: View {
    @State private var selectedCountry = "Nigeria"
    let countries = ["Playlist", "Signout"]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("FLEXFLIX")
                        .font(.largeTitle)
                        .padding()
                    
                    Spacer()
                    
                    Menu {
                        ForEach(countries, id: \.self) { country in
                            Button(country, action: { selectedCountry = country })
                        }
                    } label: {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .imageScale(.large)
                            .padding()
                    }
                }
                
                VStack {
                    Text("User's Avatar")
                        .frame(width: UIScreen.main.bounds.width * 0.5, height: 200)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(50)
                    Text("Flourish")
                        .font(.title2)

                }
                .padding()
                
                VStack {
                    Text("My Playlist")
                        .font(.title)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<10) { _ in
                                VStack {
                                    Text("Movie Thumbnail")
                                        .frame(width: 120, height: 120)
                                        .background(Color.gray.opacity(0.3))
                                        .cornerRadius(8)
                                    Text("Movie Title")
                                        .font(.caption)
                                }
                                .padding(.horizontal, 4)
                            }
                        }
                    }
                }
                .padding()
                
                Button("Sign Out") {
                    // Play movie action
                }
                .frame(minWidth: 0, maxWidth: 100)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding()
                Spacer()
                
            
                HStack {
                    Spacer()
                    Button(action: {
                        // Go to home screen
                    }) {
                        Image(systemName: "house")
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Button(action: {
                        // Go to my playlist screen
                    }) {
                        Image(systemName: "play.rectangle")
                    }
                    Spacer()
                }
                .font(.title2)
                .padding()
                .background(Color(UIColor.systemBackground))
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.blue]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarHidden(true)
        }
    }
}

struct playListView_Previews: PreviewProvider {
    static var previews: some View {
        playListView()
    }
}