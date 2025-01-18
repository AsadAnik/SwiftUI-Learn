//
//  ImageCard.swift
//  swiftUIPracticeApp
//
//  Created by Asad Anik on 1/18/25.
//

import SwiftUI

struct ImageCard: View {
    @State var myFirstText: String = "I am Scrumdinger App Text for you!";
    
    var body: some View {
        VStack {
            // MARK: Image Cover
            Image("ContantImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .hoverEffect();
            
            // MARK: TextArea Bordered
            Text("I am here \(self.myFirstText)")
                .font(.largeTitle)
                .padding()
                .border(Color.purple, width: 1)
                .cornerRadius(5);
        }
    }
}
