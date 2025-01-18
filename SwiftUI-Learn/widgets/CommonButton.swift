import SwiftUI

struct CommonButton: View {
    @Binding var title: String;
    @Binding var cornerRadiusSize: Int;
    @Binding var type: String;
    internal var actionFunction: () -> Void;
    
    var body: some View {
        if (type == "SET") {
            Button("Press for \(self.title)") {
                // Action..
                self.actionFunction()
            }
            .padding()
            .background(Color.red)
            .foregroundColor(Color.white)
            .cornerRadius(CGFloat(self.cornerRadiusSize));
            
        } else if (type == "DEFAULT") {
            Button("\(self.title)") {
                // Action..
                self.actionFunction()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(CGFloat(self.cornerRadiusSize));
        }
        
    }
}
