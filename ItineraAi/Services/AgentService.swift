//
//  AgentService..swift
//  ItineraAi
//
//  Created by Gideon Adewuyi on 12/09/2025.
//

import Combine
import FirebaseAI
import Foundation

class AgentService {

    static var shared = AgentService()

    let model: GenerativeModel

    private init() {
        let aI: FirebaseAI = FirebaseAI.firebaseAI(
            backend: .googleAI()
        )

        let config = GenerationConfig(
            responseMIMEType: "application/json",
            responseSchema: reducesDescriptionJsonSchema
        )

        self.model =
            aI
            .generativeModel(
                modelName: "gemini-2.5-flash",
                generationConfig: config,
                systemInstruction: .init(role: "system", parts: systemPrompt)
            )
    }
}

@MainActor
class AiItineryService: ObservableObject {
    @Published var aIResponse: String = ""
    @Published var error: String?
    @Published var isLoading: Bool = false

    let aiAgent = AgentService.shared

    init() {
    }

    func generateItinery(userPrompt: String) async throws -> Itinery {
        isLoading = true
        error = nil

        defer {
            isLoading = false
        }

        do {
            let response = try await Task.detached {  // Make the API call off the main actor to avoid blocking UI
                try await self.aiAgent.model.generateContent(userPrompt)
            }.value

            if let text = response.text {  // Update response on main actor
                aIResponse = text
            }

            guard let text = response.text,
                let data = text.data(using: .utf8)
            else {
                let errorMessage = "Invalid response from AI service"
                error = errorMessage
                throw NSError(
                    domain: "GeminiError",
                    code: -1,
                    userInfo: [NSLocalizedDescriptionKey: errorMessage]
                )
            }

            let itinerary = try JSONDecoder().decode(Itinery.self, from: data)

            return itinerary

        } catch {
            let errorMessage = error.localizedDescription  // Handle errors and update error state
            self.error = errorMessage
            throw error
        }
    }

    var basePrompt: String {
        return ""
    }

}
