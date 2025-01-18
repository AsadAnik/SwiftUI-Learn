//
//  NavigationView.swift
//  swiftUIPracticeApp
//
//  Created by Asad Anik on 12/31/24.

import SwiftUI

struct NavigateView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    Text("Welcome to swiftUi here")
                        .font(.title)
                        .padding();
                    
                    NavigationLink(destination: FirstPractice()) {
                        Text("Go to 1st Day")
                            .font(.headline)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10);
                    }
                    
                    NavigationLink(destination: SecondPractice()) {
                        Text("Go to 2nd Day")
                            .font(.headline)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10);
                    }
                    
                    NavigationLink(destination: ThirdPractice()) {
                        Text("Got to 3rd Day")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10);
                    }
                    
                    NavigationLink(destination: Scrumdinger()) {
                        Label("Scrumdinger", systemImage: "list.bullet.rectangle")
                            .font(.subheadline)
                            .padding()
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(10);
                        
                    }
                }
            }
            .navigationTitle("Home")
        }
    }
}

