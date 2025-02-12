//
//  ScrumTimer.swift
//  SwiftUI-Learn
//
//  Created by Asad Anik on 2/4/25.
//

import Foundation

/// The Source of Truth / State Management with ObservableObject then it will be Publish some variables which is for getting into the Views accordingly..
/// The Views are here to getting the things without passing on every level of the data itself.

@MainActor
final class ScrumTimer: ObservableObject {
    // MARK: Speaker Struct
    /// A struct to keep track of meeting attendees during the meeting..
    struct Speaker: Identifiable {
        /// id -> For identifiable Compormance (AUTO INCREMENTS WITH UNIQUE IDENTIFIER)
        /// name -> Attendee Name (IMMUTABLE CONSTANT NAME)
        /// isCompleted -> True if attendee has completed their turn to speak (MUTABLE COMPLETED STATUS FLAG)
        let id: UUID = UUID();
        let name: String;
        var isCompleted: Bool
    }
    
    /// The name of the meeting attendee who is speaking..
    @Published var activeSpeaker = "";
    
    /// The number of seconds since the beginning of the meeting.,
    @Published var secondsElapsed = 0;
    
    /// The number of seconds until all attendees have had a turn to speak
    @Published var secondsRemaining = 0;
    
    /// All meeting attendees, listen in the order they will speak.
    private(set) var speakers: [Speaker] = [];
    
    /// The scum meeting length.
    private(set) var lengthInMinutes: Int;
    
    /// A closure that is excuted when a new attendee begins speaking.
    var speakerChangedAction: (() -> Void)?
    
    private weak var timer: Timer?;
    private var timerStopped = false;
    private var frequency: TimeInterval { 1.0 / 60.0 };
    private var lengthInSeconds: Int { lengthInMinutes * 60 };
    private var secondsPerSpeaker: Int {
        (lengthInMinutes * 60) / speakers.count
    }
    private var secondsElapsedForSpeaker: Int = 0;
    private var speakerIndex: Int = 0;
    private var speakerText: String {
        return "Speaker \(speakerIndex + 1): " + speakers[speakerIndex].name;
    }
    private var startDate: Date?;
    
    
    // MARK: Initializer
    /**
     Initialize a new timer. Initializing a time with no arguments creates a ScrumTimer with no attendees and zero length.
     Use `startScrum()` to start the timer.
     
     - Parameters:
     - lengthInMinutes: The meeting length.
     -  attendees: A list of attendees for the meeting.
     */
    init(lengthInMinutes: Int = 0, attendees: [DailyScrum.Attendee] = []) {
        self.lengthInMinutes = lengthInMinutes;
        self.speakers = attendees.speakers;
        secondsRemaining = lengthInSeconds;
        activeSpeaker = speakerText;
    }
    
    // MARK: Start Timer
    func startScrum() {
        timer = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true) { [weak self] timer in
            self?.update();
        }
        timer?.tolerance = 0.1;
        changeToSpeaker(at: 0);
    }
    
    // MARK: Stop Timer
    func stopScrum() {
        timer?.invalidate();
        timerStopped = true;
    }
    
    // MARK: Skip To Next Speaker
    /// Advance the timer to the next speaker.
    nonisolated func skipSpeaker() {
        Task { @MainActor in
            changeToSpeaker(at: speakerIndex + 1);
        }
    }
    
    /// The Function to change the speaker..
    private func changeToSpeaker(at index: Int) {
        if index > 0 {
            let previousSpeakerIndex = index - 1;
            speakers[previousSpeakerIndex].isCompleted = true;
        }
        
        secondsElapsedForSpeaker = 0;
        guard index < speakers.count else { return }
        speakerIndex = index;
        activeSpeaker = speakerText;
        
        secondsElapsed = index * secondsPerSpeaker;
        secondsRemaining = lengthInSeconds - secondsElapsed;
        startDate = Date();
    }
    
    /// Update Function to Update the speaker and time intervals and seconds
    nonisolated private func update() {
        Task { @MainActor in
            guard let startDate, !timerStopped else { return }
            let secondsElapsed = Int(Date().timeIntervalSince1970 - startDate.timeIntervalSince1970)
            secondsElapsedForSpeaker = secondsElapsed
            self.secondsElapsed = secondsPerSpeaker * speakerIndex + secondsElapsedForSpeaker
            
            guard secondsElapsed <= secondsPerSpeaker else { return }
            secondsRemaining = max(lengthInSeconds - self.secondsElapsed, 0)
            
            if secondsElapsedForSpeaker >= secondsPerSpeaker {
                changeToSpeaker(at: speakerIndex + 1)
                speakerChangedAction?()
            }
        }
    }
    
    /**
     Reset the timer with a new meeting length and new attendees.
     
     - Parameters:
     - lengthInMinutes: The meeting length.
     - attendees: The name of each attendee.
     */
    // MARK: Reset Timer & Speaker
    func reset(lengthInMinutes: Int, attendees: [DailyScrum.Attendee]) {
        self.lengthInMinutes = lengthInMinutes;
        self.speakers = attendees.speakers;
        secondsRemaining = lengthInSeconds;
        activeSpeaker = speakerText;
    }
}


// MARK: Extension For Speakers Array
extension Array<DailyScrum.Attendee> {
    var speakers: [ScrumTimer.Speaker] {
        if isEmpty {
            return [ScrumTimer.Speaker(name: "Speaker 1", isCompleted: false)];
            
        } else {
            return map { ScrumTimer.Speaker(name: $0.name, isCompleted: false) };
        }
    }
}
