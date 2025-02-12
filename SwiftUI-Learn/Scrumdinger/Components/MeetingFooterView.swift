//
//  MeetingFooterView.swift
//  SwiftUI-Learn
//
//  Created by Asad Anik on 2/5/25.
//

import SwiftUI

// MARK: MeetingFooter View
struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker];
    var skipAction: () -> Void;
    
    /// Added a private computed property that determines the speaker number.
    /// ScumTimer marks each speaker as completed when their time has ended. The first speaker not market as completed becomes the active seaker. The speaker Number property uses the index to return the active speaker number, which you'll use as part of the footer text...
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1;
    }
    
    /// Added a private conputed property that checks wether the active speaker is the last speaker. This property is true if the isCompleted property of each speaker expect the final speaker is true.
    /// TIP: We can get the same result with `reduce( : :)` by returning `speaker.dropLast().reduce(true) { $0 && $1.isCompleted }`.
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted };
    }
    
    /// Added a private computed property that returns information about the active speaker, and pass it to the Text view.
    /// The property returns Speaker X of Y when there are remaining speakers or No more speakers when the meeting exceeds the allotted time.
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count)";
    }
    
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last Speaker");
                    
                } else {
                    Text("\(speakerText)");
                    
                    Spacer();
                    
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill");
                    }
                    .accessibilityLabel("Next speaker");
                }
            }
        }
        .padding([.bottom, .horizontal]);
    }
}

// MARK: MeetingFooterView Preview
struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
            .previewLayout(.sizeThatFits);
    }
}
