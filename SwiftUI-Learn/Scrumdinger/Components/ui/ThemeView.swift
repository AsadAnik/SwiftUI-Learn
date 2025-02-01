//
//  ThemeView.swift
//  SwiftUI-Learn
//
//  Created by Asad Anik on 1/31/25.

import SwiftUI

// MARK: ThemeView View
struct ThemeView: View {
    let theme: Theme;
    
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 50));
    }
}


// MARK: ThemeView Previews
struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: .buttercup);
    }
}
