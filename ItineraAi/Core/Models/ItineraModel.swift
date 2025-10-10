import Foundation
//
//  IteneraModel.swift
//  ItineraAi
//
//  Created by Gideon Adewuyi on 14/09/2025.
//
import SwiftUI
import SwiftData

@Model
class Itinery: Codable, Identifiable {
	@Attribute(.unique) var id: UUID
	var title: String
	var beginDate: String
	var endDate: String
	@Relationship(deleteRule: .cascade) var days: [TripDay]

	init(
		id: UUID = UUID(),
		title: String,
		beginDate: String,
		endDate: String,
		days: [TripDay] = [TripDay]()
	) {
		self.id = id
		self.title = title
		self.beginDate = beginDate
		self.endDate = endDate
		self.days = days
	}
	
	// MARK: - Codable Implementation
	
	enum CodingKeys: String, CodingKey {
		case id
		case title
		case beginDate
		case endDate
		case days
	}
	
	required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		// Decode UUID from string if needed, or create new UUID if not provided
		if let idString = try? container.decode(String.self, forKey: .id) {
			self.id = UUID(uuidString: idString) ?? UUID()
		} else {
			self.id = UUID()
		}
		
		self.title = try container.decode(String.self, forKey: .title)
		self.beginDate = try container.decode(String.self, forKey: .beginDate)
		self.endDate = try container.decode(String.self, forKey: .endDate)
		self.days = try container.decodeIfPresent([TripDay].self, forKey: .days) ?? []
	}
	func encode(to encoder: Encoder) throws {}
}

@Model
class TripDay: Codable, Identifiable {
	@Attribute(.unique) var id: UUID
	var summary: String
	var date: String
	@Relationship(deleteRule: .cascade) var activities: [ActivityItem]

	init(
		id: UUID = UUID(),
		date: String,
		activities: [ActivityItem] = [ActivityItem](),
		summary: String = ""
	) {
		self.id = id
		self.date = date
		self.activities = activities
		self.summary = summary
	}
	
	// MARK: - Codable Implementation
	
	enum CodingKeys: String, CodingKey {
		case id
		case summary
		case date
		case activities = "activities"
	}
	
	required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		// Decode UUID from string if needed, or create new UUID if not provided
		if let idString = try? container.decode(String.self, forKey: .id) {
			self.id = UUID(uuidString: idString) ?? UUID()
		} else {
			self.id = UUID()
		}
		
		self.summary = try container.decodeIfPresent(String.self, forKey: .summary) ?? ""
		
		// Handle date decoding - adjust format based on your JSON structure
		self.date = try container.decode(String.self, forKey: .date)
		
		self.activities = try container.decodeIfPresent([ActivityItem].self, forKey: .activities) ?? []
	}
	func encode(to encoder: Encoder) throws {}
}

@Model
class ActivityItem: Codable, Identifiable {
	@Attribute(.unique) var id: UUID
	var time: String
	var activity: String
	var location: String

	init(id: UUID = UUID(), time: String, activity: String, location: String) {
		self.id = id
		self.time = time
		self.activity = activity
		self.location = location
	}
	
	// MARK: - Codable Implementation
	
	enum CodingKeys: String, CodingKey {
		case id
		case time
		case activity
		case location
	}
	
	required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		// Decode UUID from string if needed, or create new UUID if not provided
		if let idString = try? container.decode(String.self, forKey: .id) {
			self.id = UUID(uuidString: idString) ?? UUID()
		} else {
			self.id = UUID()
		}
		
		self.time = try container.decode(String.self, forKey: .time)
		self.activity = try container.decode(String.self, forKey: .activity)
		self.location = try container.decode(String.self, forKey: .location)
	}
	func encode(to encoder: Encoder) throws {}
}
