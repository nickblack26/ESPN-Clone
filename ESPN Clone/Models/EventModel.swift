import Foundation

struct EventModel: Codable, Identifiable, Hashable {
	static func == (lhs: EventModel, rhs: EventModel) -> Bool {
		lhs.id == rhs.id
	}
	
	var id: String
	var date: String
	var name: String
	var shortName: String
	var competitions: [CompetitionModel]
	
	enum CodingKeys: String, CodingKey {
		case id, date, name, shortName, competitions
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}

struct StatusModel: Codable {
	var clock: Double
	var displayClock: String
	var period: Int
	var type: StatusTypeModel
}

struct StatusTypeModel: Codable {
	var id: String
	var name: String
	var state: String
	var completed: Bool
	var description: String
	var detail: String
	var shortDetail: String
}
