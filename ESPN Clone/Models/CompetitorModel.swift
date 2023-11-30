//
//  CompetitorModel.swift
//  ESPN Clone
//
//  Created by Nick on 9/18/23.
//

import Foundation

struct CompetitorModel: Identifiable, Codable {
	var id: String
	var order: Int
	var homeAway: String
	var winner: Bool?
	var team: TeamModel
	var score: String?
	var curatedRank: CuratedRankModel?
	var records: [RecordModel]
	var statistics: [StatisticModel]
	
	enum CodingKeys: String, CodingKey {
		case id, order, winner, homeAway, team, score, curatedRank, records, statistics
	}
}

