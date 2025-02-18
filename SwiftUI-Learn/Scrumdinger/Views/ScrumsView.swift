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
    @State private var isPresentingNewScrumView = false;
    
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
                Button(action: { isPresentingNewScrumView = true }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewScrumSheet(isPresentingNewScrumView: $isPresentingNewScrumView, scrums: $scrums);
        }
    }
}


// MARK: ScrumView Preview
struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: .constant(DailyScrum.sampleData));
    }
}
