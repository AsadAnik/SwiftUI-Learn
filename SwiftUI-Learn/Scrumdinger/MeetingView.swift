//
//  MeetingView.swift
//  swiftUIPracticeApp
//
//  Created by Asad Anik on 1/18/25.
import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            // MARK: Progress
            ProgressView(value: 10, total: 15);
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption);
                    Label("300", systemImage: "hourglass.tophalf.fill");
                }
                
                Spacer();
                
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption);
                    Label("600", systemImage: "hourglass.bottomhalf.filled");
                }
            }
             
            // MARK: Circle
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time Remaining")
            .accessibilityValue("10 Minutes")
            Circle()
                .strokeBorder(lineWidth: 20);
            HStack {
                Text("Speaker 1/3");
                Spacer();
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next speaker")
            }
        }
        .padding();
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView();
    }
}
