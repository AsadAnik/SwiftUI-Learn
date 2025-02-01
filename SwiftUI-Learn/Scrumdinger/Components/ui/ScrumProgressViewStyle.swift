//
//  ScrumProgressViewStyle.swift
//  SwiftUI-Learn
//
//  Created by Asad Anik on 2/2/25.

import SwiftUI

// MARK: ScrumProgressViewStyle View
struct ScrumProgressViewStyle: ProgressViewStyle {
    var theme: Theme;
    
    /**
     * This will customise the current existing view style to makeBody function which will returns the View.
     * Here is also the example of iOS version checking with avaiability of specific version for the,
     * specific views renders. Or else another view style will be appearing.
     * This View you can use anywhere you needs.
     */
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(theme.accentColor)
                .frame(height: 20.0);
            
            if #available(iOS 15.0, *) {
                ProgressView(configuration)
                    .tint(theme.mainColor)
                    .padding(.horizontal);
            } else {
                ProgressView(configuration)
                    .frame(height: 12.0)
                    .padding(.horizontal);
            }
        }
    }
}



// MARK: ScrumProgressViewStyle Preview
struct ScrumProgressViewStyle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(value: 0.4)
            .progressViewStyle(ScrumProgressViewStyle(theme: .buttercup))
            .previewLayout(.sizeThatFits);
    }
}
