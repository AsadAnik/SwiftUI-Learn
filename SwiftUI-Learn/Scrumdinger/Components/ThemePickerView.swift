//
//  ThemePicker.swift
//  SwiftUI-Learn
//
//  Created by Asad Anik on 1/31/25.
//

import SwiftUI

// MARK: ThemePicke View
struct ThemePickerView: View {
    @Binding var selection: Theme;
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.wheel)
    }
}

// MARK: ThemePicker Preview
struct ThemePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ThemePickerView(selection: .constant(.purple));
    }
}
