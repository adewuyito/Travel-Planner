//
//  Swift+ViewExetension.swift
//  ItineraAi
//
//  Created by Gideon Adewuyi on 14/09/2025.
//
import SwiftUI

extension View {
    /// Applies a gradient border with customizable corner radius and line width
    /// - Parameters:
    ///   - cornerRadius: The corner radius of the border (default: 8)
    ///   - lineWidth: The width of the border line (default: 1.5)
    /// - Returns: A view with gradient border applied
    func gradientBorder(cornerRadius: CGFloat = 8, lineWidth: CGFloat = 1.5) -> some View {
        let color = [
            Color(red: 59 / 255, green: 171 / 255, blue: 140 / 255),  // #3BAB8C
            Color(red: 73 / 255, green: 164 / 255, blue: 149 / 255),  // #49A495
        ]
        return self.modifier(
            GradientBorderStyle(cornerRadius: cornerRadius, lineWidth: lineWidth, colors: color)
        )
    }

		/// Applies a gradient border with customizable corner radius and line width
		/// - Parameters:
		///   - cornerRadius: The corner radius of the border (default: 8)
		///   - lineWidth: The width of the border line (default: 1.5)
		///   - colors: The Gradient Color for the border
		/// - Returns: A view with gradient border applied
	func gradientBorder(cornerRadius: CGFloat = 8, lineWidth: CGFloat = 1.5, colors: [Color]) -> some View {
        return self.modifier(
            GradientBorderStyle(cornerRadius: cornerRadius, lineWidth: lineWidth, colors: colors)
        )
    }

    /// Applies a layered shadow effect with multiple shadow layers
    /// - Returns: A view with layered shadow effect applied
    func layeredShadow() -> some View {
        self.modifier(LayeredShadowStyle())
    }
}
