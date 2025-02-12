//  MeetingView.swift
//  swiftUIPracticeApp
//
//  Created by Asad Anik on 1/18/25.
import SwiftUI
import AVFoundation

// MARK: MeetingView View
struct MeetingView: View {
    @Binding var scrum: DailyScrum;
    @StateObject var scrumTimer = ScrumTimer();
    
    private var player: AVPlayer { AVPlayer.sharedDingPlayer }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor);
            
            VStack {
                // MARK: Progress
                MeetingHeaderView(
                    secondsElapsed: scrumTimer.secondsElapsed,
                    secondsRemaining: scrumTimer.secondsRemaining,
                    theme: scrum.theme
                )
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("Time Remaining")
                .accessibilityValue("10 Minutes");
                
                // MARK: Circle
                Circle()
                    .strokeBorder(lineWidth: 20);
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker);
            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
        
        /// SwiftUI provides life cycle methods to trigger events when view appear and disappears. For example, you could add `onAppear(perform: )` to start an animation after a view appears. And you could add `onDisappear(perform: )` to release unnecessary resources when a view disappears.
        /// In this section, we will add calls from the ScrumTimer class to rest, start, and stop the timer at specific times in the view's life cycle.
        .onAppear {
            /// Call `scrumTimer.reset()`, passing in the length in minutes and attendees.
            /// The timer resets each time an instance of MeetingView shows on screen, indicating that a meeting should begin.
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees);
            
            
            /// In onAppear, add the speakerChangedAction.
            /// ScrumTimer calls this action when a speaker’s time expires.
            scrumTimer.speakerChangedAction = {
                /// In the closure, seek to time .zero in the audio file.
                /// Seeking to time .zero ensures that the audio file always plays from the beginning.
                player.seek(to: .zero);
                player.play();
            }
            
            
            /// Call `scrumTimer.startScrum()` to start a new scrum timer after the timer resets.
            scrumTimer.startScrum();
        }
        
        /// Add an `onDisappear(perform: )` modifier, and call `scrumTimer.stopScrum()`
        /// The timer stops each time an instance of MeetingView leaves the screen, indicating that a meeting has ended.
        .onDisappear {
            scrumTimer.stopScrum();
        }
    }
}

// MARK: MeetingView Previews
struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.sampleData[0]));
    }
}
