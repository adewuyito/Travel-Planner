import Foundation
//
//  IteneraModel.swift
//  ItineraAi
//
//  Created by Gideon Adewuyi on 14/09/2025.
//
import SwiftData

@Model
class Itinery {
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
}

@Model
class TripDay {
	@Attribute(.unique) var id: UUID
    var summary: String
    var day: Date
	@Relationship(deleteRule: .cascade) var Activities: [ActivityItem]

    init(
		id: UUID = UUID(),
        day: Date = Date(),
        Activities: [ActivityItem] = [ActivityItem](),
        summary: String = ""
    ) {
		self.id = id
        self.day = day
        self.Activities = Activities
        self.summary = summary
    }
}

@Model
class ActivityItem {
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
}
