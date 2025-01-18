//
//  ThirdPractice.swift
//  swiftUIPracticeApp
//
//  Created by Asad Anik on 1/4/25.
import SwiftUI
import Combine

// MARK: Main View
struct ThirdPractice: View {
    @State var titleText: String = "Hey i am here";
    @State var isToggledOn: Bool = false;
    
    var body: some View {
        ScrollView {
            Text("\(titleText)")
                .font(.headline);
            
            // First Child to passing Props..
            ToggleView(isToggled: $isToggledOn);
            
            // Second for using @Observable Objects with @StateObject
            CounterView();
            
            // Third One for @EnviromentObject Global State
    //        ThemeView();
            
            // Scrolling View here..
            ImageCard();
        }
    }
}


// The Child component
// Passing the Props and getting into childs by Bindings..
// MARK: Toggle Child View
struct ToggleView: View {
    @Binding var isToggled: Bool;
    
    var body: some View {
        Toggle("Vibrate on Ring", isOn: $isToggled)
            .toggleStyle(.switch);
        
        Toggle("Press to enable", isOn: $isToggled)
            .toggleStyle(.button);
    }
}


// Lets see example of Observed Object here
// MARK: @Observable Objects with @StateObject
// First lets making class here for observable object
class CounterModel: ObservableObject {
    @Published var count = 0;
}

struct CounterView: View {
    @StateObject var model = CounterModel();
    
    var body: some View {
        Text("This is Count \(model.count)");
        Button("Click to go UP") {
            // We can write return which is optional
            // Also can say self reference to current context
            // Saying self also optional
            return self.model.count += 1;
        }
    }
}


// Let's try the global State (This is like Redux thing)
// MARK: @EnvironmentObject
// Need a configuration / wrapper with this
//class ThemeModel: ObservableObject {
//    @Published var isDarkMode = false;
//}
//
//struct ThemeView: View {
//    @EnvironmentObject var themeModel: ThemeModel;
//    
//    var body: some View {
//        Text("Current Theme on \(themeModel.isDarkMode ? "Dark" : "Light")");
//        Button("Toggle Theme") {
//            return self.themeModel.isDarkMode.toggle();
//        }
//    }
//}
