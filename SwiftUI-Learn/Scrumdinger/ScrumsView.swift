//
//  ScrumView.swift
//  SwiftUI-Learn
//
//  Created by Asad Anik on 1/18/25.
//

import SwiftUI

// MARK: ScrumView View
struct ScrumsView: View {
    let scrums: [DailyScrum];
    
    var body: some View {
        List(scrums, id: \.title) { scrum in
            CardView(scrum: scrum)
//                .listRowBackground(scrum.theme.mainColor);
        }
    }
}


// MARK: ScrumView Preview
struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.sampleData);
    }
}
