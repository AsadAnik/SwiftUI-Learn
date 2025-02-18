//
//  ScrumSheet.swift
//  SwiftUI-Learn
//
//  Created by Asad Anik on 2/5/25.
//

import SwiftUI

// MARK: NewScrumSheet View
struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum;
    @Binding var isPresentingNewScrumView: Bool;
    @Binding var scrums: [DailyScrum];
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewScrumView = false;
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            scrums.append(newScrum)
                            isPresentingNewScrumView = false;
                        }
                    }
                }
        }
    }
}


// MARK: NewScrumSheet Preview
struct NewScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewScrumSheet(
            isPresentingNewScrumView: .constant(true),
            scrums: .constant(DailyScrum.sampleData)
        );
    }
}
