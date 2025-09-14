//
//  CustomButton.swift
//  ItineraAi
//
//  Created by Gideon Adewuyi on 09/09/2025.
//

import SwiftUI

struct CustomGreenButton: View {
	var label: String
	var action: () -> Void
	
	var body: some View {
		Button(action: action){
			Text(label)
				.font(.headline)
				.foregroundStyle(.white)
				.frame(maxWidth: .infinity, minHeight: 52)
		}
		.background(
			RoundedRectangle(cornerRadius: 16)
				.foregroundStyle(.appGreen46)
		)
	}
}
