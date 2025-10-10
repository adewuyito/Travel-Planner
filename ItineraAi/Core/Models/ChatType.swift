//
//  ChartType.swift
//  ItineraAi
//
//  Created by Gideon Adewuyi on 06/10/2025.
//
import Foundation

enum ChatType: Codable  {
	case PlainChat(PlainChatType)
	case ModelIteneryChat(ModelItenreryChartType)
}


internal enum PlainChatResponse: Codable {
	case model, user
}

internal struct PlainChatType: Identifiable, Codable {
	var id: UUID
	var chatResponder: PlainChatResponse
	var message: String
	
	init(
		id: UUID = UUID(),
		message: String,
		chatResponder: PlainChatResponse = .user
	) {
		self.id = id
		self.message = message
		self.chatResponder = chatResponder
	}
}

internal struct ModelItenreryChartType: Identifiable, Codable {
	var id: UUID
	let chatResponder: PlainChatResponse = .model
	var message: Itinery
	
	enum CodingKeys: String, CodingKey {
		case id, message
	}
}
