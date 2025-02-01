//  DetailEditView.swift
//  SwiftUI-Learn
//
//  Created by Asad Anik on 1/29/25.
//

import SwiftUI

// MARK: DetailEditView
struct DetailEditView: View {
    @Binding var scrum: DailyScrum;
//    @State private var scrum = DailyScrum.emptyScrum;
    @State private var newAttendeeName = "";
    
    var body: some View {
        Form {
            // MARK: Meeting-Info Section
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title);
                
                HStack {
                    Slider(
                        value: $scrum.lengthInMinutesDouble,
                        in: 5...30,
                        step: 1
                    ) {
                        Text("Length")
                    }
                    
                    Spacer()
                    
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                
                ThemePickerView(selection: $scrum.theme)
            }
            
            // MARK: Attendees Section
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                
                HStack {
                    TextField("New Attendees", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee);
                            newAttendeeName = "";
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

// MARK: DetailEdit Preview
struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(scrum: .constant(DailyScrum.sampleData[0]));
    }
}
