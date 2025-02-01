//
//  DetailView.swift
//  SwiftUI-Learn
//
//  Created by Asad Anik on 1/28/25.
//

import SwiftUI

// MARK: DetailView View
struct DetailView: View {
    @Binding var scrum: DailyScrum;
    
    // Edit View States..
    @State private var isPresentingEditView = false
    @State private var editingScrum = DailyScrum.emptyScrum;

    
    var body: some View {
        List {
            // MARK: Meeting Section
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            
            // MARK: Attendees Section
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true;
                editingScrum = scrum;
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button("Cancel") {
                                isPresentingEditView = false;
                            }
                        }
                        
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Done") {
                                isPresentingEditView = false;
                                
                                // Done Updates the Binding here..
                                scrum = editingScrum;
                            }
                        }
                    }
            }
        }
    }
}

// MARK: DetailView Preview
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(scrum: .constant(DailyScrum.sampleData[0]));
        }
    }
}
