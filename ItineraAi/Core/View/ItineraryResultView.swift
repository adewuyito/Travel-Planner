//
//  ItineryView.swift
//  ItineraAi
//
//  Created by Gideon Adewuyi on 15/09/2025.
//
import SwiftUI

struct ItineraryResultView: View {
    var body: some View {
		
		VStack {
			// App bar view
			HStack {
				Text("Hey Shubham 👋")
					.font(.headline)
					.fontWeight(.bold)
					.foregroundStyle(.appGreen46)

				Spacer()

				Circle()
					.frame(width: 40, height: 40)
					.foregroundStyle(.appGreen46)
					.overlay {
						Text("S")
							.font(.title)
							.fontWeight(.medium)
							.foregroundStyle(.white)
					}
			}
			.padding(.horizontal, 27)
			.padding(.bottom, 30)
			
			VStack {
				Text("Creating Itinerary...")
					.font(.title)
					.fontWeight(.bold)
					.padding(.bottom, 24)
				
				Rectangle()
					.frame(width: .infinity, height: .infinity)
					.foregroundStyle(.white)
					.clipShape(RoundedRectangle(cornerRadius: 16))
					.overlay {
						VStack {
							ProgressView("Curating a perfect plan for you...")
								.font(.callout)
								.fontWeight(.medium)
//							Text()
//
						}
					}
				
				
				CustomGreenButton(label: "Follow up to refine") {}
					.padding(.top, 22)
				
				Button(action: {}) {
					HStack {
						Image(systemName: "square.and.arrow.down.fill")
							.imageScale(.large)
							
						Text("Save Offline")
							.fontWeight(.medium)
					}
				}
				.frame(height: 52)
				.buttonStyle(.plain)
				
			}
			.padding(.horizontal, 27)
		}.background(.appWhiteF7)
		
	
    }
}


#Preview {
    ItineraryResultView()
}
