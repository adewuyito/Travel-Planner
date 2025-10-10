//
//  ItinerychatModel.swift
//  ItineraAi
//
//  Created by Gideon Adewuyi on 06/10/2025.
//

import SwiftData
import Foundation

@Model
class ItineryChat {
	@Attribute(.unique) var id: UUID
	var dateCreated: Date = Date.now
	var dateModified: Date
	var chart: [ChatType]
	
	init(
		id: UUID = UUID(),
		dateCreated: Date = .now,
		dateModified: Date,
		chart: [ChatType]
	) {
		self.id = id;
		self.dateCreated = dateCreated
		self.dateModified = dateModified
		self.chart = chart
	}
}


class ItineryChatService {
	init() {}
}
