//
//  Scrumdinger.swift
//  swiftUIPracticeApp
//
//  Created by Asad Anik on 1/18/25.
//
import SwiftUI

struct Scrumdinger: View {
    @State var myFirstText: String = "I am Scrumdinger App Text for you!";
    
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor);
//            Text("Hello world");
            
            // Meeting Section View
            MeetingView();
        }
        .padding();
    }
}
