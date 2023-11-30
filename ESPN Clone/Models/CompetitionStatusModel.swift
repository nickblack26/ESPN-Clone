//
//  CompetitionStatusModel.swift
//  ESPN Clone
//
//  Created by Nick on 9/20/23.
//

import Foundation

struct CompetitionStatusModel: Codable {
	var clock: Float
	var displayClock: String
	var period: Int
	
	enum CodingKeys: String, CodingKey {
		case clock, displayClock, period
	}
}
