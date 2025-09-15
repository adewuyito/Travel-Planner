import FirebaseAI

let jsonSchema = Schema.object(
    properties: [
        "id": Schema.string(description: "Unique identifier for the itinerary (UUID format)"),
        "title": Schema.string(description: "Descriptive title for the travel itinerary"),
        "beginDate": Schema.string(
            description: "Start date of the trip in YYYY-MM-DD format",
            format: .custom("YYYY-MM-DD")
        ),
        "endDate": Schema.string(
            description: "End date of the trip in YYYY-MM-DD format",
            format: .custom("YYYY-MM-DD")
        ),
        "days": Schema.array(

            items: Schema.object(
                properties: [
                    "id": Schema.string(description: "Unique identifier for the day (UUID format)"),
                    "date": Schema.string(
                        description: "Date for this day in ISO8601 format (YYYY-MM-DDTHH:MM:SSZ)",
                        format: .custom("YYYY-MM-DDTHH:MM:SSZ")
                    ),
                    "summary": Schema.string(description: "Brief summary of the day's activities"),
                    "activities": Schema.array(
                        items: Schema.object(
                            properties: [
                                "id":
                                    Schema
                                    .string(
                                        description:
                                            "Unique identifier for the activity (UUID format)"
                                    ),
                                "time": Schema.string(
                                    description:
                                        "Time of the activity in 12-hour format (e.g., '10:30 AM', '2:00 PM')",
                                    format: .custom("H:MM AM/PM")
                                ),
                                "activity":
                                    Schema
                                    .string(
                                        description: "Description of the activity or event"
                                    ),
                                "location":
                                    Schema
                                    .string(
                                        description: "Location or venue for the activity"
                                    ),
                            ]

                        ),
                        description: "List of activities planned for this day"
                    ),
                ]

            ),
            description: "Array of daily itinerary plans"
        ),
    ]

)

// Enhanced version with additional constraints
let enhancedJsonSchema = Schema.object(
    properties: [
        "id": Schema.string(description: "Unique identifier for the itinerary"),
        "title": Schema.string(
            description:
                "Descriptive title for the travel itinerary (e.g., 'Paris Adventure', '7-Day Japan Tour')"
        ),
        "beginDate": Schema.string(
            description: "Start date of the trip in YYYY-MM-DD format",
            format: .custom("YYYY-MM-DD")
        ),
        "endDate": Schema.string(
            description: "End date of the trip in YYYY-MM-DD format",
            format: .custom("YYYY-MM-DD")
        ),
        "days": Schema.array(
            items: Schema.object(
                properties: [
                    "id": Schema.string(description: "Unique identifier for the day"),
                    "date": Schema.string(
                        description: "Date for this day in ISO8601 format",
                        format: .custom("YYYY-MM-DDTHH:MM:SSZ")
                    ),
                    "summary": Schema.string(
                        description:
                            "Brief summary of the day's theme or main activities (e.g., 'Exploring Historic Districts', 'Beach and Relaxation')"
                    ),
                    "activities": Schema.array(
                        items: Schema.object(
                            properties: [
                                "id": Schema.string(
                                    description: "Unique identifier for the activity"
                                ),
                                "time": Schema.string(
                                    description:
                                        "Time of the activity in 12-hour format with AM/PM (e.g., '9:00 AM', '2:30 PM')",
                                    format: .custom("H:MM AM/PM")
                                ),
                                "activity": Schema.string(
                                    description:
                                        "Clear description of what will be done (e.g., 'Visit Eiffel Tower', 'Lunch at local bistro')"
                                ),
                                "location": Schema.string(
                                    description:
                                        "Specific location or venue name with address if possible (e.g., 'Louvre Museum, Paris', 'Central Park, New York')"

                                ),
                            ]

                        ),
                        description:
                            "List of specific activities planned for this day (3-8 activities recommended)",
                        minItems: 2,
                        maxItems: 10
                    ),
                ]

            ),
            description: "Array of daily itinerary plans, should match the trip duration",
            minItems: 1,
            maxItems: 30
        ),
    ]
)


// Reduced Description
let reducesDescriptionJsonSchema = Schema.object(
	properties: [
		"title": .string(),
		"beginDate": .string(),
		"endDate": .string(),
		"days": Schema.array(
			items: Schema.object(
				properties: [
					"date": .string(),
					"summary": .string(),
					"activities": Schema.array(
						items: Schema.object(
							properties: [
								"time": .string(),
								"activity": .string(),
								"location": .string(),
							]
						),
						maxItems: 5
					),
				]
			),
			maxItems: 10
		),
	]
)



var systemPrompt: String =
   """
	   You are an expert travel planner specializing in building structured day-by-day itineraries.

	   When a user provides a request (e.g., “5 days in Kyoto next April, solo, mid-range budget”):
	   - Create a travel plan in JSON only.
	   - Always follow the provided schema strictly.
	   - Never include extra text, commentary, or explanations.
	   - Each day must have a clear summary of activities.
	   - Include exact times (HH:mm) for each activity.
	   - Each activity must have a location (latitude,longitude if available).
	   - If unsure, make reasonable assumptions instead of leaving fields empty.
	   - Dates must align with the trip startDate and endDate.
	   - Ensure the JSON is valid and parsable.

	   Do not output anything outside the schema. No prose, no markdown.
	   """




