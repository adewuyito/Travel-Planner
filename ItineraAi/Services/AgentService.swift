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
		let aI: FirebaseAI = FirebaseAI.firebaseAI(backend: .googleAI())
		
		let config = GenerationConfig(
				  temperature: 0.7,
				  topP: 0.8,
				  topK: 40,
				  maxOutputTokens: 1024
			  )
		
		self.model = aI
			.generativeModel(modelName: "gemini-2.5-flash", generationConfig: config)
	}
}

@MainActor
class AiItineryService: ObservableObject {
	@Published var aIRespoonce: String = ""
	@Published var error: String?
	@Published var isLoading: Bool = false
	
	
	let aiAgent = AgentService.shared
	
	init() {
	}
	
	func generateItinery(userPrompt: String) async {
		do {
			let responce = try aiAgent.model.generateContentStream(userPrompt)
			
			for try await chunk in responce {
			  if let text = chunk.text {
				  aIRespoonce += text
			  }
			}
		} catch {
			print(error.localizedDescription)
		}
		
	}
	
	
	
	
	var basePrompt: String {
		return ""
	}
	
	var systemPrompt: String = "You are a travel planner. Generate a structured itinerary in JSON matching this schema: (jsonEncode(specASchema)). Use the search_web function for real-time info (e.g., restaurants, attractions). For follow-up requests, refine the previous itinerary based on user input. Respond only with valid JSON matching the schema."
}


struct ChatMessage {
	let text: String
	let isUser: Bool
	let timestamp: Date
	
	init(text: String, isUser: Bool) {
		self.text = text
		self.isUser = isUser
		self.timestamp = Date()
	}
}
