//
//  TrailingIconLabelStyle.swift
//  SwiftUI-Learn
//
//  Created by Asad Anik on 1/18/25.
import SwiftUI

// MARK: Custom Style Element
struct TrailingIconLabelStyle: LabelStyle {
    // MARK: Empty Make Body
    func makeBody(configuration: Configuration) -> some View {
        /**
         Inside the HStack, add configuration.title and configuration.icon.
         The configuration parameter is a LabelStyleConfiguration, which contains the icon and title views. These views represent the label’s image and label text.
         */
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

/**
 Add an extension on LabelStyle that creates a static property named trailingIcon.
 Because you defined the label style as a static property, you can call it using leading-dot syntax, which makes your code more readable.
 */
extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
