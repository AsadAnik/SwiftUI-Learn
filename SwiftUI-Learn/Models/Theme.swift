//
//  Theme.swift
//  SwiftUI-Learn
//
//  Created by Asad Anik on 1/18/25.
import SwiftUI

enum Theme: String, Identifiable, CaseIterable {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    // MARK: Accent Color
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow:
            return .black;
            
        case .indigo, .magenta, .navy, .oxblood, .purple:
            return .white;
        }
    }
    
    // MARK: Main Color
    var mainColor: Color {
        Color(rawValue);
    }
    
    // MARK: Name Value
    var name: String {
        rawValue.capitalized
    }
    
    // MARK: Identifiable ID
    var id: String {
        name;
    }
}
