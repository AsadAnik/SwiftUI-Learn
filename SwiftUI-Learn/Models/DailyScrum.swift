//  DailyScrum.swift
//  SwiftUI-Learn
//
//  Created by Asad Anik on 1/18/25.
/**
 title: String
 attendeese: [Attendee]
 lengthInMinutes: Int
 theme: Theme
 */

import Foundation

// MARK: DailyScrum Model
struct DailyScrum: Identifiable {
    let id: UUID;
    var title: String;
    var attendees: [Attendee];
    var lengthInMinutes: Int;
    var lengthInMinutesDouble: Double {
        get {
            Double(lengthInMinutes)
        }
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    var theme: Theme;
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id;
        self.title = title;
        self.attendees = attendees.map { Attendee(name: $0) };
        self.lengthInMinutes = lengthInMinutes;
        self.theme = theme;
    }
}

// MARK: Sample Data Array
extension DailyScrum {
    static let sampleData: [DailyScrum] = [
        DailyScrum(title: "Design", attendees: ["Cathy", "Ankara", "John"], lengthInMinutes: 5, theme: .yellow),
        DailyScrum(title: "App UI", attendees: ["Doe", "Katy", "Pavon"], lengthInMinutes: 10, theme: .orange),
        DailyScrum(title: "App Dev", attendees: ["Asad", "Paul", "Jonathan"], lengthInMinutes: 20, theme: .sky),
    ];
}


// MARK: Attendee Data
extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id;
            self.name = name;
        }
    }
    
    // MARK: Empty Scrum
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky);
    }
}
