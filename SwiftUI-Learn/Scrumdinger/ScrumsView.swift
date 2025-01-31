//
//  ScrumView.swift
//  SwiftUI-Learn
//
//  Created by Asad Anik on 1/18/25.
//

import SwiftUI

// MARK: ScrumView View
struct ScrumsView: View {
//    let scrums: [DailyScrum];
    @Binding var scrums: [DailyScrum];
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}


// MARK: ScrumView Preview
struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: .constant(DailyScrum.sampleData));
    }
}
