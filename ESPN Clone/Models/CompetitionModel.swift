//
//  CompetitionModel.swift
//  ESPN Clone
//
//  Created by Nick on 9/18/23.
//

import Foundation

struct CompetitionModel: Identifiable, Codable, Hashable {
	static func == (lhs: CompetitionModel, rhs: CompetitionModel) -> Bool {
		lhs.id == rhs.id
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(self)
	}
	
	var id: String
	var competitors: [CompetitorModel]
	var situation: SituationModel?
	var status: CompetitionStatusModel?
	var broadcasts: [BroadcastModel]
	
	enum CodingKeys: String, CodingKey {
		case id, competitors, situation, status, broadcasts
	}
}

