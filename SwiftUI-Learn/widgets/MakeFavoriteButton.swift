import SwiftUI

struct MakeFavoriteButton: View {
    let title: String;
    let type: String? = "LIKE";
    let actionFunc: () -> Void;
    
    var body: some View {
        Button("\(self.title)") {
            // ACTION BUTTON..
            self.actionFunc();
        }
        .padding()
        .background((self.type)?.uppercased() == "LIKE" ? Color.yellow : Color.red)
        .foregroundColor(.black)
        .cornerRadius(10);
    }
}
