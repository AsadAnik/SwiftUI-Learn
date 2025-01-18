import SwiftUI

struct FirstPractice: View {
    @State private var corderRadius: Int = 10;
    @State private var myName: String = "Asad Anik";
    @State var defaultButtonType: String = "DEFAULT";
    @State var defaultButtonTitle: String = "Default Make";
    @State var setButtonType: String = "SET";
    @State var setButtonTitle: String = "Set Default";
    
    func actionFuncSetDefaultClosure() -> Void {
        self.myName = "Asad Anik";
    }
    
    var body: some View {
        VStack {
            Text("This is my \(self.myName)")
                .padding()
                .background(!self.myName.isEmpty ? Color.cyan : Color.gray)
                .foregroundColor(Color.white)
                .cornerRadius(CGFloat(self.corderRadius));
            
            CommonButton(title: $defaultButtonTitle, cornerRadiusSize: $corderRadius, type: $defaultButtonType) {
                self.myName = "";
            }
            
            CommonButton(title: $setButtonTitle, cornerRadiusSize: $corderRadius, type: $setButtonType) {
                self.myName = "Asad Anik"
            }
        }
        .padding()
        .navigationTitle("First Day");
    }
}
