//
//  PlayModel.swift
//  ESPN Clone
//
//  Created by Nick on 9/20/23.
//

import Foundation

struct PlayModel: Identifiable, Codable {
	var id: String
	var text: String
	var scoreValue: Int
	var team: TeamModel
	
	enum CodingKeys: String, CodingKey {
		case id, text, scoreValue, team
	}
}


