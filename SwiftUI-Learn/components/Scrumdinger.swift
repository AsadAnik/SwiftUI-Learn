//
//  Scrumdinger.swift
//  swiftUIPracticeApp
//
//  Created by Asad Anik on 1/18/25.
//
import SwiftUI

struct Scrumdinger: View {
    @State var myFirstText: String = "I am Scrumdinger App Text for you!";
    @State private var scrums = DailyScrum.sampleData;
    
    var body: some View {
        NavigationStack {
            ScrumsView(scrums: $scrums);
        }
    }
}

#Preview {
    Scrumdinger()
}
