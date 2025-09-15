//
//  HomeView.swift
//  ItineraAi
//
//  Created by Gideon Adewuyi on 12/09/2025.
//

import SwiftData
import SwiftUI

struct HomeView: View {
    @StateObject var aiAgent: AiItineryService = AiItineryService()

    @State var inputText = ""

    @Query var itinery: [Itinery]

    @Environment(\.modelContext) private var modelContext

    var body: some View {
        if aiAgent.isLoading {
            ProgressView()
        } else {
            VStack {
                // Header ( AppBar )
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
                ScrollView {
                    VStack {
                        Text("What's your vision for this trip?")
                            .multilineTextAlignment(.center)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom, 36)
                            .padding(.top, 34)

                        TextField("Enter a prompt", text: $inputText)
                            .textFieldStyle(.plain)
                            .frame(minHeight: 171, alignment: .topLeading)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color(.systemGray6))
                            )
                            .gradientBorder(cornerRadius: 16)
                            .layeredShadow()
                            .padding(.bottom, 30)
                            .padding(.horizontal, 27)

                        CustomGreenButton(
                            label: "Create my Itinerary",
                            action: {

                                Task {
                                    do {
										let response: Itinery = try await aiAgent.generateItinery(
                                            userPrompt: inputText
                                        )
										
										print(
											"""
Response from AI:
Title: \(response.title)
StartDate: \(response.beginDate)
"""
										)
                                    } catch {
										print("Error: \(error.localizedDescription)")
                                    }

                                }
                            }
                        )
                        .disabled(aiAgent.isLoading)
                        .padding(.bottom, 37)
                        .padding(.horizontal, 27)

                        if !(itinery.isEmpty) {
                            Text("Offline Saved Itineraries")
                                .font(.title3)
                                .fontWeight(.medium)

                            ForEach(itinery) { data in
                                HStack(spacing: 8) {
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundStyle(.appGreen8D)
                                        .overlay {
                                            Circle()
                                                .foregroundStyle(.appGreenC5)
                                        }

                                    Text(data.title)
                                        .font(.callout)
                                        .fontWeight(.medium)
                                        .lineLimit(1)
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                                .gradientBorder(
                                    cornerRadius: 16,
                                    colors: [
                                        .gradientTop,
                                        .gradientMid,
                                        .gradientBottom,
                                    ]
                                )
                                .layeredShadow()
                                .padding(.horizontal, 27)
                            }

                        }

                    }
                }
            }

        }
    }

    func addItinery() {
        //        let newItinery = Itinery(
        //            title: "This is a trip to tokyo in th esub urban areas",
        //            beginDate: .
        //            endDate: .now,
        //            days: [TripDays]()
        //        )

        //        modelContext.insert(newItinery)
    }
}

//#Preview {
//    HomeView()
//}
