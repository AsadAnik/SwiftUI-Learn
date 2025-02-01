//
//  Untitled.swift
//  SwiftUI-Learn
//
//  Created by Asad Anik on 2/1/25.
//

import SwiftUI

// MARK: MeetingHeader View
struct MeetingHeaderView: View {
    let secondsElapsed: Int;
    let secondsRemaining: Int;
    let theme: Theme;
    
    // Total seconds computed property
    private var totalSeconds: Int {
        return self.secondsElapsed + self.secondsRemaining;
    }
    
    // Total progress computed property
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 };
        return Double(self.secondsElapsed) / Double(self.secondsRemaining);
    }
    
    // Minutes remaining property
    private var minutesRemaining: Int {
        return self.secondsRemaining / 60;
    }
    
    var body: some View {
        VStack {
            ProgressView(value: self.progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme));
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption);
                    Label("\(self.secondsElapsed)", systemImage: "hourglass.tophalf.fill");
                }
                
                Spacer();
                
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption);
                    Label("\(self.secondsRemaining)", systemImage: "hourglass.tophalf.fill")
                        .labelStyle(.trailingIcon);
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(self.minutesRemaining) minutes")
        .padding([.top, .horizontal]);
        
    }
}

// MARK: MeetingHeader Preview
struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180, theme: .bubblegum)
            .previewLayout(.sizeThatFits);
    }
}
