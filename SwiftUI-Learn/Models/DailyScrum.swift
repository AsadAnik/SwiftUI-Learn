//  DailyScrum.swift
//  SwiftUI-Learn
//
//  Created by Asad Anik on 1/18/25.
/**
 title: String
 attendeese: [String]
 lengthInMinutes: Int
 theme: Theme
 */

import Foundation

// MARK: DailyScrum Model
struct DailyScrum {
    var title: String;
    var attendees: [String];
    var lengthInMinutes: Int;
    var theme: Theme;
}

extension DailyScrum {
    // MARK: Sample Data Array
    static let sampleData: [DailyScrum] = [
        DailyScrum(title: "Design", attendees: ["Cathy", "Ankara", "John"], lengthInMinutes: 5, theme: .yellow),
        DailyScrum(title: "App UI", attendees: ["Doe", "Katy", "Pavon"], lengthInMinutes: 10, theme: .orange),
        DailyScrum(title: "App Dev", attendees: ["Asad", "Paul", "Jonathan"], lengthInMinutes: 20, theme: .sky),
    ];
}
