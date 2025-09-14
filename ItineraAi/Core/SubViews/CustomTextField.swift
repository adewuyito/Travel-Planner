//
//  CustomTextField.swift
//  ItineraAi
//
//  Created by Gideon Adewuyi on 09/09/2025.
//

import SwiftUI

struct CustomTextView: View {
    @Binding var text: String
    var label: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
            HStack {
                Image(systemName: "envelope")
                    .padding(.leading)
                    .foregroundStyle(.appGrayB2)

                TextField(label, text: $text)
                    .frame(minHeight: 58)
                //					.padding()
            }
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(.appGrayE5)
            )
            .padding(.bottom, 24)
        }
    }
}

struct LayeredShadowStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(
                color: Color(red: 107 / 255, green: 127 / 255, blue: 156 / 255).opacity(0.10),
                radius: 13.5,
                x: 0,
                y: 12
            )
            .shadow(
                color: Color(red: 216 / 255, green: 186 / 255, blue: 207 / 255).opacity(0.09),
                radius: 24.5,
                x: 0,
                y: 49
            )
            .shadow(
                color: Color(red: 162 / 255, green: 192 / 255, blue: 170 / 255).opacity(0.05),
                radius: 33,
                x: 0,
                y: 109
            )
            .shadow(
                color: Color(red: 126 / 255, green: 134 / 255, blue: 150 / 255).opacity(0.01),
                radius: 39,
                x: 0,
                y: 194
            )
            .shadow(
                color: Color(red: 164 / 255, green: 99 / 255, blue: 157 / 255).opacity(0.0),
                radius: 42.5,
                x: 0,
                y: 304
            )
    }
}

struct GradientBorderStyle: ViewModifier {
    let cornerRadius: CGFloat
    let lineWidth: CGFloat
	let colors: [Color]

	init(cornerRadius: CGFloat = 8, lineWidth: CGFloat = 1.5, colors: [Color]) {
        self.cornerRadius = cornerRadius
        self.lineWidth = lineWidth
		self.colors = colors
    }

    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(
                        LinearGradient(
							gradient: Gradient(colors: colors),
                            startPoint: .leading,
                            endPoint: .trailing
                        ),
                        lineWidth: lineWidth
                    )
            )
    }
}
