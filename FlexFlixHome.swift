//
//  FlexFlixHome.swift
//  FlexFlix
//
//  Created by Olanrewaju Afolayan on 2/21/24.
//

import SwiftUI

struct FlexFlixHome: View {
    @State private var selectedCountry = "Nigeria"
    let countries = ["Nigeria", "Ghana", "South Africa"]
    
    @State private var searchQuery = ""
    
    let movies = ["Movie Title 1", "Movie Title 2", "Movie Title 3", "Movie Title 4"]
    
    @State private var filteredMovies: [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                // Navigation bar with title and dropdown list
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
                
                // Featured movie section with Play and My List buttons
                VStack {
                    Text("Movie Preview Thumbnail")
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: 200)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(12)
                    
                    HStack {
                        Button("Play") {
                            // Play movie action
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        
                        Button("+ My List") {
                            // Add to my list action
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.5))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .padding(.top, 10)
                }
                .padding()
                
                TextField("Search movies...", text: $searchQuery)
                        .padding(7)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .onChange(of: searchQuery) { newValue in
                            // Filter movies based on search query
                            if !newValue.isEmpty {
                                filteredMovies = movies.filter { $0.localizedCaseInsensitiveContains(newValue) }
                            } else {
                                filteredMovies = movies
                            }
                        }
                        .onAppear {
                            // Initialize filteredMovies with all movies initially
                            filteredMovies = movies
                        }
                        .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<10) { _ in
                            VStack {
                                Text("Movie Thumbnail")
                                    .frame(width: 100, height: 100)
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(8)
                                Text("Movie Title")
                                    .font(.caption)
                            }
                            .padding(.horizontal, 4)
                        }
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<10) { _ in
                            VStack {
                                Text("Movie Thumbnail")
                                    .frame(width: 100, height: 100)
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(8)
                                Text("Movie Title")
                                    .font(.caption)
                            }
                            .padding(.horizontal, 4)
                        }
                    }
                }
                .padding()
                
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
                        Image(systemName: "person.crop.circle")
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

struct FlexFlixHome_Previews: PreviewProvider {
    static var previews: some View {
        FlexFlixHome()
    }
}
